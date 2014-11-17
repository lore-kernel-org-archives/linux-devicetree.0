From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: simplefb-sunxi: Add sunxi
 simplefb extensions
Date: Mon, 17 Nov 2014 12:18:14 +0000
Message-ID: <CACxGe6vaWbs558W4cjvSdDeujH_1qYPAoo9+AP-wUb1MUSd76w@mail.gmail.com>
References: <1416224086-5698-1-git-send-email-hdegoede@redhat.com> <1416224086-5698-3-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCJP567ORICBBGWPU6RQKGQEKMUOYGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1416224086-5698-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 11:34 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> If pre-filled framebuffer nodes are used, the firmware may need extra
> properties to find the right node. This documents the properties to use
> for this on sunxi platforms.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  .../bindings/video/simple-framebuffer-sunxi.txt    | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/simple-framebuffer-sunxi.txt
>
> diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer-sunxi.txt b/Documentation/devicetree/bindings/video/simple-framebuffer-sunxi.txt
> new file mode 100644
> index 0000000..84ca264
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/simple-framebuffer-sunxi.txt
> @@ -0,0 +1,33 @@
> +Sunxi specific Simple Framebuffer bindings
> +
> +This binding documents sunxi specific extensions to the simple-framebuffer
> +bindings. The sunxi simplefb u-boot code relies on the devicetree containing
> +pre-populated simplefb nodes.
> +
> +These extensions are intended so that u-boot can select the right node based
> +on which pipeline and output is being used. As such they are solely intended
> +for firmware / bootloader use, and the OS should ignore them.
> +
> +Required properties:
> +- compatible: "sunxi,framebuffer"
> +- sunxi,pipeline:
> +  <0> for the de_be0 -> lcdc0 -> output pipeline
> +  <1> for the de_be1 -> lcdc1 -> output pipeline
> +- sunxi,output: One of: "hdmi", "lcd", "vga", and "composite"
> +
> +Example:
> +
> +chosen {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       ranges;
> +
> +       framebuffer@0 {
> +               compatible = "sunxi,framebuffer", "simple-framebuffer";
> +               sunxi,pipeline = <0>;
> +               sunxi,output = "hdmi";
> +               clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
> +                        <&ahb_gates 44>;
> +               status = "disabled";
> +       };
> +};
> --
> 2.1.0
>
