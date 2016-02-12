From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] mailbox: mailbox-test: use print_hex_dump_bytes to
 allow dynamic printk
Date: Fri, 12 Feb 2016 09:12:18 +0000
Message-ID: <20160212091218.GR20693@x1>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
 <1455210808-29395-4-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455210808-29395-4-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 11 Feb 2016, Sudeep Holla wrote:

> Reduce the logging from info to debug. Also use print_hex_dump_bytes
> instead as it has support for dynamic printk providing options to
> conditionally enable/disable these logs.

Printing out the data in this way is kinda the point of the driver.
But if you don't have a use for it, then I guess it's okay to
downgrade it to DEBUG, as turning debug on, or hacking the driver back
again are trivial actions.

> Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  drivers/mailbox/mailbox-test.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox=
-test.c
> index 036a852b5fa1..f690f11969a1 100644
> --- a/drivers/mailbox/mailbox-test.c
> +++ b/drivers/mailbox/mailbox-test.c
> @@ -113,15 +113,15 @@ static ssize_t mbox_test_message_write(struct f=
ile *filp,
>  	 * MMIO to subsequently pass the message through
>  	 */
>  	if (tdev->mmio && tdev->signal) {
> -		print_hex_dump(KERN_INFO, "Client: Sending: Signal: ", DUMP_PREFIX=
_ADDRESS,
> -			       MBOX_BYTES_PER_LINE, 1, tdev->signal, MBOX_MAX_SIG_LEN, tr=
ue);
> +		print_hex_dump_bytes("Client: Sending: Signal: ", DUMP_PREFIX_ADDR=
ESS,
> +				     tdev->signal, MBOX_MAX_SIG_LEN);
> =20
>  		data =3D tdev->signal;
>  	} else
>  		data =3D tdev->message;
> =20
> -	print_hex_dump(KERN_INFO, "Client: Sending: Message: ", DUMP_PREFIX=
_ADDRESS,
> -		       MBOX_BYTES_PER_LINE, 1, tdev->message, MBOX_MAX_MSG_LEN, tr=
ue);
> +	print_hex_dump_bytes("Client: Sending: Message: ", DUMP_PREFIX_ADDR=
ESS,
> +			     tdev->message, MBOX_MAX_MSG_LEN);
> =20
>  	ret =3D mbox_send_message(tdev->tx_channel, data);
>  	if (ret < 0)
> @@ -222,13 +222,11 @@ static void mbox_test_receive_message(struct mb=
ox_client *client, void *message)
>  	spin_lock_irqsave(&tdev->lock, flags);
>  	if (tdev->mmio) {
>  		memcpy_fromio(tdev->rx_buffer, tdev->mmio, MBOX_MAX_MSG_LEN);
> -		print_hex_dump(KERN_INFO, "Client: Received [MMIO]: ",
> -			       DUMP_PREFIX_ADDRESS, MBOX_BYTES_PER_LINE, 1,
> -			       tdev->rx_buffer, MBOX_MAX_MSG_LEN, true);
> +		print_hex_dump_bytes("Client: Received [MMIO]: ", DUMP_PREFIX_ADDR=
ESS,
> +				     tdev->rx_buffer, MBOX_MAX_MSG_LEN);
>  	} else if (message) {
> -		print_hex_dump(KERN_INFO, "Client: Received [API]: ",
> -			       DUMP_PREFIX_ADDRESS, MBOX_BYTES_PER_LINE, 1,
> -			       message, MBOX_MAX_MSG_LEN, true);
> +		print_hex_dump_bytes("Client: Received [API]: ", DUMP_PREFIX_ADDRE=
SS,
> +				     message, MBOX_MAX_MSG_LEN);
>  		memcpy(tdev->rx_buffer, message, MBOX_MAX_MSG_LEN);
>  	}
>  	spin_unlock_irqrestore(&tdev->lock, flags);

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
