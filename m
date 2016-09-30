From: Stuart Yoder <stuart.yoder@nxp.com>
Subject: RE: [PATCH v2 1/1] arm64: Add DTS support for FSL's LS1012A SoC
Date: Fri, 30 Sep 2016 13:55:34 +0000
Message-ID: <VI1PR0401MB2638683943A984F9C638F4A88DC10@VI1PR0401MB2638.eurprd04.prod.outlook.com>
References: <1472207241-18461-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <20160829095239.GM30790@tiger>
 <AM4PR0401MB22753C87DE074EE7BF456CE48CC10@AM4PR0401MB2275.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM4PR0401MB22753C87DE074EE7BF456CE48CC10@AM4PR0401MB2275.eurprd04.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bhaskar U <bhaskar.upadhaya@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pratiyush Srivastava <pratiyush.srivastava@nxp.com>, "oss@buserror.net" <oss@buserror.net>, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, "linux-devel@gforge.freescale.net" <linux-devel@gforge.freescale.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> >> +&qspi {
> >> +	num-cs = <2>;
> >> +	bus-num = <0>;
> >> +	status = "disabled";
> >
> >Why is it being disabled?
> 
> Ok, will change like below.
> status = "okay";

The comment was not "change this to okay".  The question is why is this disabled?
Can you explain why it was disabled?   Should it have been disasbled?  Is qspi
working and tested on this board?

> 
> >
> >> +	fsl,ddr-sampling-point = <4>;
> >
> >I do not find the bindings for this property, neither how driver supports it.
> 
> Yes the QSPI DDR mode is not yet up-streamed, so  I will remove this property as of now.
> 
> >
> >> +
> >> +	qflash0: s25fs512s@0 {
> >> +		compatible = "spansion,m25p80";
> >> +		#address-cells = <1>;
> >> +		#size-cells = <1>;
> >> +		spi-max-frequency = <20000000>;
> >> +		m25p,fast-read;
> >> +		reg = <0>;
> >> +	};
> >> +};
> >> +
> >> +&i2c0 {
> >> +	status = "okay";
> >> +
> >> +	codec: sgtl5000@a {
> >> +		#sound-dai-cells = <0>;
> >> +		compatible = "fsl,sgtl5000";
> >> +		reg = <0xa>;
> >> +		VDDA-supply = <&reg_1p8v>;
> >> +		VDDIO-supply = <&reg_1p8v>;
> >> +		clocks = <&sys_mclk>;
> >> +	};
> >> +};
> >> +
> >> +&duart0 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&esdhc0 {
> >> +	status = "disabled";
> >
> >We prefer to disable devices which have board level options by default in
> ><soc>.dtsi, and enable them per availability in <board>.dts.
> 
> Ok , will make the status as okay i.e. status = "okay";

Again, the feedback was not "set this to okay".  Why was esdhc0 set to "disabled"
here in the first place?  Was there a reason?

The comment is that if there are certain boards where esdhc0 is not available,
then fsl-ls1012a.dtsi should set this to "disabled" and board .dts files should
override it.

> >
> >> +};
> >> +
> >> +&esdhc1 {
> >> +	status = "disabled";
> >> +};
> >> +
> >> +&sai2 {
> >> +	status = "disabled";
> >> +};

Same comment for the above nodes.  The fsl-ls1012a.dtsi should set them to
disabled and any .dts file should override with "ok" if applicable.

Stuart
