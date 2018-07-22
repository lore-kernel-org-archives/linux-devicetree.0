From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 6/9] dt-bindings: phy: add binding for
 Allwinner USB3 PHY
Date: Sun, 22 Jul 2018 14:10:33 +0800
Message-ID: <CAGb2v65m6AEW=DO-cqLMyjfnaiZudm38hXufJL6LXdOrJqir_g@mail.gmail.com>
References: <20180722055739.26464-1-icenowy@aosc.io> <20180722055739.26464-7-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB4F72DNAKGQEHRK7TPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180722055739.26464-7-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 22, 2018 at 1:57 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> The new Allwinner H6 SoC contains a USB3 PHY that is wired to the
> external USB3 pins of the SoC.
>
> Add a device tree binding for the PHY.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
> Changes in v3:
> - Added Chen-Yu's Review tag.
>
> Rob,
> Although you mentioned that the supply is for the port, not the phy;
> currently in USB situation "powering on the PHY" also indicates
> "powering on the port" and nearly all usages of phy-supply is for Vbus.
>
> Maybe we should change the overall phy-supply to satisfy this.

Or maybe change it to vbus-supply, like we have for phy-sun4i-usb,
until USB port power sequencing is added. (I remember there were
patches for this. What happened?)

ChenYu

> Thanks,
> Icenowy
>
>  .../bindings/phy/sun50i-usb3-phy.txt          | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
>
> diff --git a/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> new file mode 100644
> index 000000000000..912d55f9f69d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> @@ -0,0 +1,24 @@
> +Allwinner sun50i USB3 PHY
> +-----------------------
> +
> +Required properties:
> +- compatible : should be one of
> +  * allwinner,sun60i-h6-usb3-phy
> +- reg : a list of offset + length pairs
> +- #phy-cells : from the generic phy bindings, must be 0
> +- clocks : phandle + clock specifier for the phy clock
> +- resets : phandle + reset specifier for the phy reset
> +
> +Optional Properties:
> +- phy-supply : from the generic phy bindings, a phandle to a regulator that
> +              provides power to VBUS.
> +
> +Example:
> +       usb3phy: phy@5210000 {
> +               compatible = "allwinner,sun50i-h6-usb3-phy";
> +               reg = <0x5210000 0x10000>;
> +               clocks = <&ccu CLK_USB_PHY1>;
> +               resets = <&ccu RST_USB_PHY1>;
> +               #phy-cells = <0>;
> +               status = "disabled";
> +       };
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
