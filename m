From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] misc: Add Allwinner Q8 tablet hardware manager
Date: Fri, 9 Sep 2016 16:41:44 -0500
Message-ID: <CAL_JsqLGS23JQxtdtUqNhkhDiV4mnKSBpMjdo4fx0=wuq_ydeg@mail.gmail.com>
References: <20160901190820.21987-1-hdegoede@redhat.com> <20160901190820.21987-2-hdegoede@redhat.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBMOZZS7AKGQEJPTEPTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160901190820.21987-2-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 1, 2016 at 2:08 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Allwinnner A13 / A23 / A33 based Q8 tablets are popular cheap 7" tablets
> of which a new batch is produced every few weeks. Each batch uses a
> different mix of touchscreen, accelerometer and wifi peripherals.
>
> Given that each batch is different creating a devicetree for each variant
> is not desirable. This commit adds a Q8 tablet hardware manager which
> auto-detects the touchscreen and accelerometer so that a single generic
> dts can be used for these tablets.
>
> The wifi is connected to a discoverable bus (sdio or usb) and will be
> autodetected by the mmc resp. usb subsystems.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  .../misc/allwinner,sunxi-q8-hardwaremgr.txt        |  52 +++
>  drivers/misc/Kconfig                               |  12 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/q8-hardwaremgr.c                      | 512 +++++++++++++++++++++
>  4 files changed, 577 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/allwinner,sunxi-q8-hardwaremgr.txt
>  create mode 100644 drivers/misc/q8-hardwaremgr.c
>
> diff --git a/Documentation/devicetree/bindings/misc/allwinner,sunxi-q8-hardwaremgr.txt b/Documentation/devicetree/bindings/misc/allwinner,sunxi-q8-hardwaremgr.txt
> new file mode 100644
> index 0000000..f428bf5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/allwinner,sunxi-q8-hardwaremgr.txt
> @@ -0,0 +1,52 @@
> +Q8 tablet hardware manager
> +--------------------------
> +
> +Allwinnner A13 / A23 / A33 based Q8 tablets are popular cheap 7" tablets of
> +which a new batch is produced every few weeks. Each batch uses a different
> +mix of touchscreen, accelerometer and wifi peripherals.
> +
> +Given that each batch is different creating a devicetree for each variant is
> +not desirable. The Q8 tablet hardware manager bindings are bindings for an os
> +module which auto-detects the touchscreen so that a single
> +generic dts can be used for these tablets.
> +
> +The wifi is connected to a discoverable bus and will be autodetected by the os.
> +
> +Required properties:
> + - compatible         : "allwinner,sunxi-q8-hardwaremgr"
> + - touchscreen        : phandle of a template touchscreen node, this must be a
> +                       child node of the touchscreen i2c bus
> +
> +Optional properties:
> + - touchscreen-supply : regulator phandle for the touchscreen vdd supply

While I said I think you should be using overlays here, you could also
do it without. However, this node has to go. It is not h/w, and you
are putting it here purely to instantiate a driver. For the
touchscreen property, surely you know where the touchscreen is located
in the DT? If not, of_find_node_by_name()? For touchscreen-supply, I
assume this is to turn on the supply so you can talk to the touch
controller. There's no reason the supply can't just be in the
touchscreen node itself.

> +
> +touschreen node required properties:
> + - interrupt-parent   : phandle pointing to the interrupt controller
> +                       serving the touchscreen interrupt
> + - interrupts         : interrupt specification for the touchscreen interrupt
> + - power-gpios        : Specification for the pin connected to the touchscreen's
> +                       enable / wake pin. This needs to be driven high to
> +                       enable the touchscreen controller
> +
> +Example:
> +
> +/ {
> +       hwmgr {
> +               compatible = "allwinner,sunxi-q8-hardwaremgr";
> +               touchscreen = <&touchscreen>;
> +               touchscreen-supply = <&reg_ldo_io1>;
> +       };
> +};
> +
> +&i2c0 {
> +       touchscreen: touchscreen@0 {
> +               interrupt-parent = <&pio>;
> +               interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5 */
> +               power-gpios = <&pio 7 1 GPIO_ACTIVE_HIGH>; /* PH1 */
> +               /*
> +                * Enabled by sunxi-q8-hardwaremgr if it detects a
> +                * known model touchscreen.
> +                */
> +               status = "disabled";
> +       };
> +};
