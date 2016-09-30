From: Bhaskar U <bhaskar.upadhaya@nxp.com>
Subject: RE: [PATCH v2 1/1] arm64: Add DTS support for FSL's LS1012A SoC
Date: Fri, 30 Sep 2016 21:19:13 +0000
Message-ID: <AM4PR0401MB2275E76A1EC44FE6DA19D4978CC10@AM4PR0401MB2275.eurprd04.prod.outlook.com>
References: <1472207241-18461-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <VI1PR0401MB2638C032B77C9313C17BBE898DC10@VI1PR0401MB2638.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR0401MB2638C032B77C9313C17BBE898DC10@VI1PR0401MB2638.eurprd04.prod.outlook.com>
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
To: Stuart Yoder <stuart.yoder@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "oss@buserror.net" <oss@buserror.net>, "linux-devel@gforge.freescale.net" <linux-devel@gforge.freescale.net>, Pratiyush Srivastava <pratiyush.srivastava@nxp.com>, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



>-----Original Message-----
>From: Stuart Yoder
>Sent: Friday, September 30, 2016 7:28 PM
>To: Bhaskar U <bhaskar.upadhaya@nxp.com>; devicetree@vger.kernel.org;
>shawnguo@kernel.org
>Cc: oss@buserror.net; linux-arm-kernel@lists.infradead.org; linux-
>devel@gforge.freescale.net; Bhaskar U <bhaskar.upadhaya@nxp.com>;
>Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>; Pratiyush Srivastava
><pratiyush.srivastava@nxp.com>
>Subject: RE: [PATCH v2 1/1] arm64: Add DTS support for FSL's LS1012A SoC
>
>> +		dspi0: dspi@2100000 {
>> +			compatible = "fsl,ls1012a-dspi",
>> +				     "fsl,ls1043a-dspi",
>> +				     "fsl,ls1021a-v1.0-dspi";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x0 0x2100000 0x0 0x10000>;
>> +			interrupts = <0 64 0x4>;
>> +			clock-names = "dspi";
>> +			clocks = <&clockgen 4 0>;
>> +			spi-num-chipselects = <5>;
>> +			big-endian;
>> +			status = "enabled";
>
>"enabled" is not a valid status value.
>

So shall I put the status = "okay" ?

But there are other nodes like i2c below having status = "enabled", so do we need to edit them also ? If yes then what should be written in the status ?
i2c0: i2c@2180000 {
                        compatible = "fsl,vf610-i2c";
                        #address-cells = <1>;
                        #size-cells = <0>;
                        reg = <0x0 0x2180000 0x0 0x10000>;
                        interrupts = <0 56 0x4>;
                        clock-names = "i2c";
                        clocks = <&clockgen 4 0>;
                        status = "enabled";
                };

                i2c1: i2c@2190000 {
                        compatible = "fsl,vf610-i2c";
                        #address-cells = <1>;
                        #size-cells = <0>;
                        reg = <0x0 0x2190000 0x0 0x10000>;
                        interrupts = <0 57 0x4>;
                        clock-names = "i2c";
                        clocks = <&clockgen 4 0>;
                        status = "enabled";
                };


>Stuart
