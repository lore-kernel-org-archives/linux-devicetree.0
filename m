From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] mailbox: mailbox-test: add support for separate
 tx/rx buffer with single channel
Date: Fri, 12 Feb 2016 09:15:05 +0000
Message-ID: <20160212091505.GS20693@x1>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
 <1455210808-29395-5-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455210808-29395-5-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 11 Feb 2016, Sudeep Holla wrote:

> This patch adds support for different MMIO region for Tx and Rx paths=
=2E
> If only one region is specified, it's assumed to be shared between Rx
> and Tx, thereby retaining backward compatibility.
>=20
> Also in order to support single channel dealing with both Tx and Rx w=
ith
> dedicated MMIO regions, Tx channel itself is assigned to Rx if MMIO
> regions are different and Rx is not specified.
>=20
> Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  drivers/mailbox/mailbox-test.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox=
-test.c
> index f690f11969a1..767b9ec37a96 100644
> --- a/drivers/mailbox/mailbox-test.c
> +++ b/drivers/mailbox/mailbox-test.c
> @@ -31,7 +31,8 @@ static struct dentry *root_debugfs_dir;
> =20
>  struct mbox_test_device {
>  	struct device		*dev;
> -	void __iomem		*mmio;
> +	void __iomem		*tx_mmio;
> +	void __iomem		*rx_mmio;
>  	struct mbox_chan	*tx_channel;
>  	struct mbox_chan	*rx_channel;
>  	char			*rx_buffer;
> @@ -112,7 +113,7 @@ static ssize_t mbox_test_message_write(struct fil=
e *filp,
>  	 * A separate signal is only of use if there is
>  	 * MMIO to subsequently pass the message through
>  	 */
> -	if (tdev->mmio && tdev->signal) {
> +	if (tdev->tx_mmio && tdev->signal) {
>  		print_hex_dump_bytes("Client: Sending: Signal: ", DUMP_PREFIX_ADDR=
ESS,
>  				     tdev->signal, MBOX_MAX_SIG_LEN);
> =20
> @@ -220,8 +221,8 @@ static void mbox_test_receive_message(struct mbox=
_client *client, void *message)
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&tdev->lock, flags);
> -	if (tdev->mmio) {
> -		memcpy_fromio(tdev->rx_buffer, tdev->mmio, MBOX_MAX_MSG_LEN);
> +	if (tdev->rx_mmio) {
> +		memcpy_fromio(tdev->rx_buffer, tdev->rx_mmio, MBOX_MAX_MSG_LEN);
>  		print_hex_dump_bytes("Client: Received [MMIO]: ", DUMP_PREFIX_ADDR=
ESS,
>  				     tdev->rx_buffer, MBOX_MAX_MSG_LEN);
>  	} else if (message) {
> @@ -236,11 +237,11 @@ static void mbox_test_prepare_message(struct mb=
ox_client *client, void *message)
>  {
>  	struct mbox_test_device *tdev =3D dev_get_drvdata(client->dev);
> =20
> -	if (tdev->mmio) {
> +	if (tdev->tx_mmio) {
>  		if (tdev->signal)
> -			memcpy_toio(tdev->mmio, tdev->message, MBOX_MAX_MSG_LEN);
> +			memcpy_toio(tdev->tx_mmio, tdev->message, MBOX_MAX_MSG_LEN);
>  		else
> -			memcpy_toio(tdev->mmio, message, MBOX_MAX_MSG_LEN);
> +			memcpy_toio(tdev->tx_mmio, message, MBOX_MAX_MSG_LEN);
>  	}
>  }
> =20
> @@ -294,9 +295,13 @@ static int mbox_test_probe(struct platform_devic=
e *pdev)
> =20
>  	/* It's okay for MMIO to be NULL */
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	tdev->mmio =3D devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(tdev->mmio))
> -		tdev->mmio =3D NULL;
> +	tdev->tx_mmio =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(tdev->tx_mmio))
> +		tdev->tx_mmio =3D NULL;

Nit: I'd prefer to see a new line separator here.

> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	tdev->rx_mmio =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(tdev->rx_mmio))
> +		tdev->rx_mmio =3D tdev->tx_mmio;
> =20
>  	tdev->tx_channel =3D mbox_test_request_channel(pdev, "tx");
>  	tdev->rx_channel =3D mbox_test_request_channel(pdev, "rx");
> @@ -304,6 +309,9 @@ static int mbox_test_probe(struct platform_device=
 *pdev)
>  	if (!tdev->tx_channel && !tdev->rx_channel)
>  		return -EPROBE_DEFER;
> =20
> +	if (!tdev->rx_channel && (tdev->rx_mmio !=3D tdev->tx_mmio))
> +		tdev->rx_channel =3D tdev->tx_channel;
> +
>  	tdev->dev =3D &pdev->dev;
>  	platform_set_drvdata(pdev, tdev);

Otherwise code looks good.  Nice extension.

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
