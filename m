From: "nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCHv3 1/6] ARM: dts: Add SoC level device tree support for
 LS1021A
Date: Thu, 11 Sep 2014 10:10:37 +0000
Message-ID: <1444adbcf7cd4b578a131db11e662490@BN1PR0301MB0593.namprd03.prod.outlook.com>
References: <1410253952-15631-1-git-send-email-jingchang.lu@freescale.com>
 <1410253952-15631-2-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410253952-15631-2-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <Shawn.Guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "suresh.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <suresh.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "shaveta-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <shaveta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ruchika Gupta <ruchika.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>-----Original Message-----
>From: Jingchang Lu [mailto:jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org]
>Sent: Tuesday, September 09, 2014 2:42 PM
>To: Guo Shawn-R65073
>Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Lu
>Jingchang-B35083; Badola Nikhil-B46172; Zhao Chenhui-B35336; Gupta Suresh-
>B42813; Leekha Shaveta-B20052; Gupta Ruchika-R66431; Sharma Bhupesh-
>B45370; Fu Chao-B44548; Xiubo Li-B47053; Lu Jingchang-B35083
>Subject: [PATCHv3 1/6] ARM: dts: Add SoC level device tree support for LS1021A
>
>From: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
>Add Freescale LS1021A SoC device tree support
>+
>+		usb@8600000 {
>+			compatible = "fsl-usb2-dr-v2.5", "fsl-usb2-dr";
>+			reg = <0x0 0x8600000 0x0 0x1000>;
>+			#address-cells = <1>;
>+			#size-cells = <0>;
>+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
>+			dr_mode = "host";
>+			phy_type = "ulpi";
>+		};
>+

Please remove following from the above node :  
			#address-cells = <1>;
			#size-cells = <0>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
