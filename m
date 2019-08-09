From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [linux-sunxi] [PATCH v8 4/4] arm64: dts: allwinner: orange-pi-3:
 Enable HDMI output
Date: Fri, 9 Aug 2019 11:04:43 +0200
Message-ID: <20190809090443.kq5bnsrkgr746l2i@core.my.home>
References: <20190806155744.10263-1-megous@megous.com>
 <20190806155744.10263-5-megous@megous.com>
 <CAEKpxBn1nF0t-M34iRSy1yYEuUxgNMUXFBhtjXBY8Qk+43zbDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEKpxBn1nF0t-M34iRSy1yYEuUxgNMUXFBhtjXBY8Qk+43zbDQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Code Kipper <codekipper@gmail.com>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 09, 2019 at 10:25:32AM +0200, Code Kipper wrote:
> On Tue, 6 Aug 2019 at 17:57, <megous@megous.com> wrote:
> >
> > From: Ondrej Jirman <megous@megous.com>
> >
> > Orange Pi 3 has a DDC_CEC_EN signal connected to PH2, that enables the DDC
> > I2C bus voltage shifter. Before EDID can be read, we need to pull PH2 high.
> > This is realized by the ddc-en-gpios property.
> Great work. Is there any chance you can move this to the
> arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi?, as all the H6
> based orange-pi's have this feature.

I plan to do that as a followup patch, once this is merged.

regards,
	o.

> BR,
> CK
> >
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> >  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 26 +++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > index 2c6807b74ff6..01bb1bafe284 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> > @@ -22,6 +22,18 @@
> >                 stdout-path = "serial0:115200n8";
> >         };
> >
> > +       connector {
> > +               compatible = "hdmi-connector";
> > +               ddc-en-gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
> > +               type = "a";
> > +
> > +               port {
> > +                       hdmi_con_in: endpoint {
> > +                               remote-endpoint = <&hdmi_out_con>;
> > +                       };
> > +               };
> > +       };
> > +
> >         leds {
> >                 compatible = "gpio-leds";
> >
> > @@ -72,6 +84,10 @@
> >         cpu-supply = <&reg_dcdca>;
> >  };
> >
> > +&de {
> > +       status = "okay";
> > +};
> > +
> >  &ehci0 {
> >         status = "okay";
> >  };
> > @@ -91,6 +107,16 @@
> >         status = "okay";
> >  };
> >
> > +&hdmi {
> > +       status = "okay";
> > +};
> > +
> > +&hdmi_out {
> > +       hdmi_out_con: endpoint {
> > +               remote-endpoint = <&hdmi_con_in>;
> > +       };
> > +};
> > +
> >  &mdio {
> >         ext_rgmii_phy: ethernet-phy@1 {
> >                 compatible = "ethernet-phy-ieee802.3-c22";
> > --
> > 2.22.0
> >
> > --
> > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20190806155744.10263-5-megous%40megous.com.
