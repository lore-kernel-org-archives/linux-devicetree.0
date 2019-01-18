From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCHv2] Patch to add the realtek bluetooth device tree refs to
 the code
Date: Fri, 18 Jan 2019 11:57:17 +0100
Message-ID: <510BE8B9-76BD-4A64-86C2-ACA1D50819DF@holtmann.org>
References: <20181229115513.31153-1-beagleboard@davidjohnsummers.uk>
 <20190103163538.6575-1-beagleboard@davidjohnsummers.uk>
 <20190103163538.6575-2-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190103163538.6575-2-beagleboard@davidjohnsummers.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Summers <beagleboard@davidjohnsummers.uk>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi David,

> This patch adds the necessary device tree hooks to the realtek
> bluetooth driver for serial connections.
> 
> The realtek devices that are listed btrtl.c are searched on the
> realtek web site for the version that have serial connections.
> 
> Most of these devices also have wi-fi connected via sdio, that is not
> covered by the bluetooth driver - but as that interface will also be
> needed in the device tree, the hocks here have "-bluetooth" added. The
> exception to this is the rtl8761atv, which only has a serial
> bluetooth.
> 
> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
> ---
> drivers/bluetooth/hci_h5.c | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
> index 8eede1197cd2..2fec7ff2ce7c 100644
> --- a/drivers/bluetooth/hci_h5.c
> +++ b/drivers/bluetooth/hci_h5.c
> @@ -925,6 +925,22 @@ static struct h5_vnd rtl_vnd = {
> };
> #endif
> 
> +#ifdef CONFIG_OF
> +static const struct of_device_id h5_of_match[] = {
> +#ifdef CONFIG_BT_HCIUART_RTL
> +       { .compatible = "realtek,rtl8723as-bluetooth"},
> +       { .compatible = "realtek,rtl8723bs-bluetooth"},
> +       { .compatible = "realtek,rtl8723ds-bluetooth"},
> +       { .compatible = "realtek,rtl8761atv"},
> +       { .compatible = "realtek,rtl8821as-bluetooth"},
> +       { .compatible = "realtek,rtl8821cs-bluetooth"},
> +       { .compatible = "realtek,rtl8822bs-bluetooth"},
> +#endif

I really need an Ack from Rob on the naming here.

Regards

Marcel
