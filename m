From: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [RFC,V2,1/2] media: dt-bindings: media: i2c: Add bindings for
 OV02A10
Date: Sat, 17 Aug 2019 13:03:39 +0800
Message-ID: <1566018219.21623.18.camel@mhfsdcap03>
References: <20190704084651.3105-1-dongchun.zhu@mediatek.com>
 <20190704084651.3105-2-dongchun.zhu@mediatek.com>
 <20190722234924.GA22604@bogus>
 <5d5d644af9334609bb7c3ff745b2e754@mtkmbs02n1.mediatek.inc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5d5d644af9334609bb7c3ff745b2e754@mtkmbs02n1.mediatek.inc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org, srv_heupstream@mediatek.com, menghui.lin@mediatek.com, Sakari Ailus <sakari.ailus@iki.fi>, tfiga@google.com, shengnan.wang@mediatek.com, louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Hi Rob,

On Mon, 2019-07-22 at 18:49 -0500, Rob Herring wrote:
> 
> On Thu, Jul 04, 2019 at 04:46:50PM +0800, dongchun.zhu@mediatek.com wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> >
> > Add device tree binding documentation for the OV02A10 camera sensor.
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/i2c/ov02a10.txt      | 43 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  7 ++++
> >  2 files changed, 50 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > new file mode 100644
> > index 0000000..d40aa87
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > @@ -0,0 +1,43 @@
> > +* Omnivision OV02A10 MIPI CSI-2 sensor
> > +
> > +Required Properties:
> > +- compatible: shall be "ovti,ov02a10"
> > +- clocks: reference to the xvclk input clock
> > +- clock-names: shall be "xvclk"
> > +- avdd-supply: Analog voltage supply, 2.8 volts
> > +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> > +- dvdd-supply: Digital core voltage supply, 1.8 volts
> > +- reset-gpios: Low active reset gpio
> > +
> > +The device node shall contain one 'port' child node with an
> > +'endpoint' subnode for its digital output video port, in accordance
> > +with the video interface bindings defined in
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +The endpoint optional property 'data-lanes' shall be "<1>".
> > +
> > +Example:
> > +&i2c4 {
> > +ov02a10: camera-sensor@3d {
> > +compatible = "ovti,ov02a10";
> > +reg = <0x3d>;
> > +pinctrl-names = "default";
> > +pinctrl-0 = <&camera_pins_cam1_mclk_on>;
> > +
> > +clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
> > +<&topckgen CLK_TOP_UNIVP_192M_D8>;
> > +clock-names = "xvclk", "freq_mux";
> > +
> > +avdd-supply = <&mt6358_vcama1_reg>;
> > +dvdd-supply = <&mt6358_vcn18_reg>;
> > +dovdd-supply = <&mt6358_vcamio_reg>;
> > +pwdn-gpios = <&pio 107 1>;
> 
> Not documented. If you need this, use 'powerdown-gpios' instead.
> 

Fixed in next release.

> > +reset-gpios = <&pio 109 1>;
> > +
> > +port {
> > +   ov02a10_core: endpoint {
> > +       remote-endpoint = <&ov02a10_0>;
> > +   data-lanes = <1>;
> > +};
> > +};
> > +};
> > +};
> > diff --git a/MAINTAINERS b/MAINTAINERS index 5cfbea4..62b81ff 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11571,6 +11571,13 @@ T:git git://linuxtv.org/media_tree.git
> >  S:Maintained
> >  F:drivers/media/i2c/ov13858.c
> >
> > +OMNIVISION OV02A10 SENSOR DRIVER
> > +M:Dongchun Zhu <dongchun.zhu@mediatek.com>
> > +L:linux-media@vger.kernel.org
> > +T:git git://linuxtv.org/media_tree.git
> > +S:Maintained
> > +F:Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > +
> >  OMNIVISION OV2680 SENSOR DRIVER
> >  M:Rui Miguel Silva <rmfrfs@gmail.com>
> >  L:linux-media@vger.kernel.org
> > --
> > 2.9.2
> >
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> *********************MEDIATEK Confidential/Internal Use*********************
