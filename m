From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/2] dt: bindings: add MARVELL's sd8xxx wireless device
Date: Wed, 30 Mar 2016 09:15:44 -0500
Message-ID: <CAL_JsqK5TiNCub6XnBcE118gLkC-mjf437zWhLOsjgtz+1peuw@mail.gmail.com>
References: <1459343998-5187-1-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459343998-5187-1-git-send-email-akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wei-Ning Huang <wnhuang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 30, 2016 at 8:19 AM, Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> wrote:
> From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>
> Add device tree binding documentation for MARVELL's sd8xxx
> (sd8897 and sd8997) wlan chip.
>
> Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
> Listing changelist for both 1/2 and 2/2 patches
> v3: Don't update adapter->dt_node if mwifiex_plt_dev is NULL
>
> v4: a)Corrected the 'name' and 'compatible' property names.(Arnd Bergmann and Rob
>     Herring)
>     b)Patch description wraped in 72 columns(Rob Herring)
>     c)Moved DT binding file to bindings/net/wireless/(Rob Herring)
>     d)Renamed "mwifiex,chip-gpio" to "marvell,wakeup-gpios"(Rob Herring/
>     Arnd Bergmann)
>     e)Replaced #ifdef with __maybe_unused(Arnd Bergmann)
>
> v5: a)Removed wildcards from compatible string(Arnd Bergmann)
>     b)Prepared single patch for all binding changes(Rob Herring)
>     c)Specified our node as a subnode of SDIO controller. With this approach, we
>     don't need to register new platform driver. (Rob herring)
>
> v6: a)List out the specific property names for marvell,caldata* and size of the data(Rob Herring)
>     b)Use sdio function number for both the unit address and reg(Rob Herring)
> ---
>  .../bindings/net/wireless/marvell-sd8xxx.txt       | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt
>
> diff --git a/Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt b/Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt
> new file mode 100644
> index 0000000..337fed4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt
> @@ -0,0 +1,63 @@
> +Marvell 8897/8997 (sd8897/sd8997) SDIO devices
> +------
> +
> +This node provides properties for controlling the marvell sdio wireless device.
> +The node is expected to be specified as a child node to the SDIO controller that
> +connects the device to the system.
> +
> +Required properties:
> +
> +  - compatible : should be one of the following:
> +       * "marvell,sd8897"
> +       * "marvell,sd8997"
> +
> +Optional properties:
> +
> +  - marvell,caldata* : A series of properties with marvell,caldata prefix,
> +                     represent calibration data downloaded to the device during
> +                     initialization. This is an array of unsigned values.

unsigned 8-bit values...

> +                     the properties should follow below property name and
> +                     corresponding array length:
> +       "marvell,caldata_00_txpwrlimit_2g_cfg_set" (length = 566).
> +       "marvell,caldata_00_txpwrlimit_5g_cfg_set_sub0" (length = 502).
> +       "marvell,caldata_00_txpwrlimit_5g_cfg_set_sub1" (length = 688).
> +       "marvell,caldata_00_txpwrlimit_5g_cfg_set_sub2" (length = 750).
> +       "marvell,caldata_00_txpwrlimit_5g_cfg_set_sub3" (length = 502).

The 00 and cfg_set seem pretty pointless, and '-' is preferred over '_'. So:

marvell,caldata-txpwrlimit-5g-sub3

> +  - marvell,wakeup-pin : 'wakeuppin' is a wakeup pin number of wifi chip which will

Drop "wakeuppin is"

> +                     be configured to firmware. firmware will wakeup host side use
> +                     the pin during suspend/resume stage.
> +  - interrupt-parent: phandle of the parent interrupt controller
> +  - interrupts : interrupt pin number to the cpu. driver will request an irq based on
> +                this interrupt number. during system suspend, the irq will be enabled
> +                as system wakeup source, so that the wifi chip can wakeup host

You need to use the wakeup-source binding here
(bindings/power/wakeup-source.txt). Probably on the BT binding too?

> +                platform under certain condition. during system resume, the irq will
> +                be disabled to make sure unnecessary interrupt is not received.
> +
> +Example:
> +
> +Tx power limit calibration data is configured in below example.
> +The calibration data is an array of unsigned values, the length
> +can vary between hw versions.
> +IRQ pin 38 is used as system wakeup source interrupt. wakeup pin 3 is configured
> +so that firmware can wakeup host using this device side pin.
> +
> +&mmc3 {
> +       status = "okay";
> +       vmmc-supply = <&wlan_en_reg>;
> +       bus-width = <4>;
> +       cap-power-off-card;
> +       keep-power-in-suspend;
> +
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       mwifiex: mwifiex@1 {

wifi@1

> +               compatible = "marvell,sd8897";
> +               reg = <1>;
> +               interrupt-parent = <&pio>;
> +               interrupts = <38 IRQ_TYPE_LEVEL_LOW>;
> +
> +               marvell,caldata_00_txpwrlimit_2g_cfg_set = /bits/ 8 <
> +       0x01 0x00 0x06 0x00 0x08 0x02 0x89 0x01>;
> +               marvell,wakeup-pin = <3>;
> +       };
> +};
> --
> 1.8.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
