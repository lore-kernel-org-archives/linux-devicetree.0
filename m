From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: meson: add specific simplefb bindings
Date: Wed, 12 Dec 2018 14:28:45 +0100
Message-ID: <CAMO6nawq6XsmsucVHPDDc3nuYLEDa4U1QC_5v26jofNv+BKH1A@mail.gmail.com>
References: <20181210090640.4495-1-mjourdan@baylibre.com> <434d1dc0-3c5e-5cb3-cc88-b565bfb74217@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <434d1dc0-3c5e-5cb3-cc88-b565bfb74217@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Neil,
On Wed, Dec 12, 2018 at 10:54 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Maxime,
>
> On 10/12/2018 10:06, Maxime Jourdan wrote:
> > Similar to simple-framebuffer-sunxi, we support different display pipelines
> > that the firmware is free to choose from.
> >
> > This documents the "amlogic,simple-framebuffer" compatible and the
> > "amlogic,pipeline" extension.
> >
> > Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> > ---
> >  .../display/simple-framebuffer-meson.txt      | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt
> >
> > diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt b/Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt
> > new file mode 100644
> > index 000000000000..122a5c005cd9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt
> > @@ -0,0 +1,33 @@
> > +Meson specific Simple Framebuffer bindings
> > +
> > +This binding documents meson specific extensions to the simple-framebuffer
> > +bindings. The meson simplefb u-boot code relies on the devicetree containing
> > +pre-populated simplefb nodes.
> > +
> > +These extensions are intended so that u-boot can select the right node based
> > +on which pipeline is being used. As such they are solely intended for
> > +firmware / bootloader use, and the OS should ignore them.
> > +
> > +Required properties:
> > +- compatible: "amlogic,simple-framebuffer"
> > +- amlogic,pipeline, one of:
> > +  "vpu-cvbs"
> > +  "vpu-hdmi"
> > +
> > +Example:
> > +
> > +chosen {
> > +     #address-cells = <2>;
> > +     #size-cells = <2>;
> > +     ranges;
> > +
> > +     framebuffer@0 {
> > +             compatible = "amlogic,simple-framebuffer",
> > +                          "simple-framebuffer";
> > +             amlogic,pipeline = "vpu-hdmi";
> > +             clocks = <&clkc CLKID_HDMI_PCLK>,
> > +                      <&clkc CLKID_CLK81>,
> > +                      <&clkc CLKID_GCLK_VENCI_INT0>;
> > +             power-domains = <&pwrc_vpu>;
> > +     };
> > +};
> >
>
> You should add a cover-letter for this patchset !
>
> Neil

Sorry about that, I completely forgot. Thanks for the reminder, will repost.

Maxime
