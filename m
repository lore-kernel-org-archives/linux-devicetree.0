From: Shaohui Xie <shaohui.xie-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH] powerpc/mpc85xx: Add pcsphy nodes to FManV3 device tree
Date: Tue, 22 Dec 2015 06:26:59 +0000
Message-ID: <VI1PR04MB1664BA0097C2C574F084F544E8E50@VI1PR04MB1664.eurprd04.prod.outlook.com>
References: <1450655851-6556-1-git-send-email-igal.liberman@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450655851-6556-1-git-send-email-igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Madalin-Cristian Bucur <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "shaohui.xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <shaohui.xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> @@ -55,6 +55,7 @@ fman@400000 {
>  		reg = <0xe0000 0x1000>;
>  		fsl,fman-ports = <&fman0_rx_0x08 &fman0_tx_0x28>;
>  		ptp-timer = <&ptp_timer0>;
> +		pcsphy-handle = <&pcsphy0>;
>  	};
> 
>  	mdio@e1000 {
> @@ -62,5 +63,9 @@ fman@400000 {
>  		#size-cells = <0>;
>  		compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
>  		reg = <0xe1000 0x1000>;
> +
> +		pcsphy0: ethernet-phy@0 {
> +			reg = <0x0>;
> +		};
>  	};
>  };

[S.H] snip.

>  	mdio@e1000 {
> @@ -58,5 +59,9 @@ fman@400000 {
>  		#size-cells = <0>;
>  		compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
>  		reg = <0xe1000 0x1000>;
> +
> +		pcsphy0: pcs-phy@0 {
> +			reg = <0x0>;
> +		};
>  	};
[S.H] Should use 'ethernet-phy', same as above.

Thanks,
Shaohui

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
