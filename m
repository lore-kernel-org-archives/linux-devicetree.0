From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 1/3] Bluetooth: btusb: add QCA6174A compatible properties
Date: Fri, 22 Feb 2019 10:04:06 -0800
Message-ID: <20190222180406.GA223791@google.com>
References: <20190222003403.128243-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190222003403.128243-1-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, Rajat Jain <rajatja@google.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 21, 2019 at 04:34:01PM -0800, Brian Norris wrote:
> We may need to specify a GPIO wake pin for this device, so add a
> compatible property for it.
> 
> There are at least to USB PID/VID variations of this chip: one with a
> Lite-On ID and one with an Atheros ID.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  drivers/bluetooth/btusb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 470ee68555d9..380e6f38c607 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2862,6 +2862,8 @@ static irqreturn_t btusb_oob_wake_handler(int irq, void *priv)
>  
>  static const struct of_device_id btusb_match_table[] = {
>  	{ .compatible = "usb1286,204e" },
> +	{ .compatible = "usb0cf3,e300" }, /* QCA6174A */
> +	{ .compatible = "usb04ca,301a" }, /* QCA6174A (Lite-On) */
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, btusb_match_table);

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
