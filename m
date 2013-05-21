From: "Chaiken, Alison" <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/6] ARM: dts: imx6q: add pinctrl for WEIM NOR
Date: Tue, 21 May 2013 16:16:11 +0000
Message-ID: <60BA5429A0E1584BA3633194F6F993B50252C8D8@NA-MBX-03.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
> index ed11bcf..e6174c7 100644
> --- a/arch/arm/boot/dts/imx6q.dtsi
> +++ b/arch/arm/boot/dts/imx6q.dtsi
> @@ -323,6 +323,64 @@
>  						>;
>  					};
>  				};
> +
> +				weim {
> +					pinctrl_weim_nor_1: weim_norgrp-1 {
> +						fsl,pins = <
> +							MX6Q_PAD_EIM_OE__EIM_OE_B     0x10
> +							MX6Q_PAD_EIM_RW__EIM_RW       0x10
> +							MX6Q_PAD_EIM_CS0__EIM_CS0_B   0x10
> +							MX6Q_PAD_EIM_LBA__EIM_LBA_B   0x10
> +							MX6Q_PAD_EIM_WAIT__EIM_WAIT_B 0x8000
> +							MX6Q_PAD_EIM_BCLK__EIM_BCLK   0x8000

The following values are derived using Table 4-1 of "i.MX 6Dual/6Quad Applications Processor Reference Manual Document Number: IMX6DQRM Rev. 1, 04/2013":

MX6Q_PAD_EIM_OE__WEIM_WEIM_OE        0xb0b1
MX6Q_PAD_EIM_RW__WEIM_WEIM_RW       0xb0b1
MX6Q_PAD_EIM_CS0__WEIM_WEIM_CS_0   0xb0b1
MX6Q_PAD_EIM_WAIT__WEIM_WEIM_WAIT 0xb060

(I wrote a short C program that parses a human-readable property table for the pins and spits out hex to generate them.)   How are 0x10 values calculated?   Are settings for MX6Q_PAD_EIM_LBA__EIM_LBA_B and MX6Q_PAD_EIM_BCLK__EIM_BCLK useful?   We run NOR without them.

> +							MX6Q_PAD_EIM_A17__EIM_ADDR17 0xb0b1
> +							MX6Q_PAD_EIM_A16__EIM_ADDR16 0xb0b1
> +							MX6Q_PAD_EIM_DA15__EIM_AD15  0xb0b1
> +							MX6Q_PAD_EIM_DA14__EIM_AD14  0xb0b1
> +							MX6Q_PAD_EIM_DA13__EIM_AD13  0xb0b1

Are these names correct?    "MX6Q_PAD_EIM_A16__EIM_ADDR16" but "MX6Q_PAD_EIM_DA15__EIM_AD15" et cetera?

-- 
Alison Chaiken
alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
