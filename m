From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: Re: [PATCH 14/22] ARM: dts: apalis-imx6: Add some example I2C devices
Date: Wed, 31 Jul 2019 11:36:59 +0000
Message-ID: <cd35b9553397f51153ccb5cea9205f91f659cfdf.camel@toradex.com>
References: <20190730144649.19022-1-dev@pschenker.ch>
 <20190730144649.19022-15-dev@pschenker.ch>
 <CAOMZO5BtXFR7kDuiHedsDA0AaNZqsO_L2x9d3u9ZuULkovChoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5BtXFR7kDuiHedsDA0AaNZqsO_L2x9d3u9ZuULkovChoQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <95B9859292AAB34A95A9803C3C1320F2@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "festevam@gmail.com" <festevam@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>, Max Krummenacher <max.krummenacher@toradex.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-07-30 at 17:53 -0300, Fabio Estevam wrote:
> On Tue, Jul 30, 2019 at 11:57 AM Philippe Schenker <dev@pschenker.ch> wrote:
> 
> >  &backlight {
> > @@ -204,6 +228,77 @@
> >   */
> >  &i2c3 {
> >         status = "okay";
> > +
> > +       adv7280: adv7280@21 {
> > +               compatible = "adv7280";
> > +               reg = <0x21>;
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&pinctrl_ipu1_csi0 &pinctrl_cam_mclk>;
> > +               clocks = <&clks 200>;
> 
> Please replace this 200 with a proper clock label.
> 
> > +               clock-names = "csi_mclk";
> > +               DOVDD-supply = <&reg_3p3v>;
> > +               AVDD-supply = <&reg_3p3v>;
> > +               DVDD-supply = <&reg_3p3v>;
> > +               PVDD-supply = <&reg_3p3v>;
> > +               csi_id = <0>;
> 
> This is not a valid property upstream.
> 
> It seems you just ported it from a downstream vendor kernel. Please
> make sure you test with the dt-bindings from mainline.
> 
> > +               mclk = <24000000>;
> > +               mclk_source = <1>;
> > +               status = "okay";
> > +       };
> > +
> > +       /* Video ADC on Analog Camera Module */
> > +       adv7180: adv7180@21 {
> > +               compatible = "adv,adv7180";
> > +               reg = <0x21>;
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&pinctrl_ipu1_csi0 &pinctrl_cam_mclk>;
> > +               clocks = <&clks 200>;
> 
> clock label, please.
> 
> > +               clock-names = "csi_mclk";
> > +               DOVDD-supply = <&reg_3p3v>; /* 3.3v */
> > +               AVDD-supply = <&reg_3p3v>;  /* 1.8v */
> > +               DVDD-supply = <&reg_3p3v>;  /* 1.8v */
> > +               PVDD-supply = <&reg_3p3v>;  /* 1.8v */
> > +               csi_id = <0>;
> 
> Same here
> 
> > +               mclk = <24000000>;
> > +               mclk_source = <1>;
> > +               cvbs = <1>;
> > +               status = "disabled";
> > +       };
> > +
> > +       max9526: max9526@20 {
> > +               compatible = "maxim,max9526";
> 
> This is not documented in mainline.

Yeah, too much downstream stuff in here. I will drop that patch for now...
