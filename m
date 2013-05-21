From: "Chaiken, Alison" <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] drivers: bus: add a new driver for WEIM
Date: Tue, 21 May 2013 16:29:22 +0000
Message-ID: <60BA5429A0E1584BA3633194F6F993B50252C924@NA-MBX-03.mgc.mentorg.com>
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

> +	weim: weim at 021b8000 {
> +		compatible = "fsl,imx6q-weim";
> +		reg = <0x021b8000 0x4000>;
> +		interrupts = <0 14 0x04>;
> +		clocks = <&clks 196>;
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0x08000000 0x08000000>;
> +
> +		nor at 0,0 {
> +			compatible = "cfi-flash";

Why not use 

compatible = "micron,M29W256G", "cfi-flash";

since that's what's on the SABRE-AI board?

> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index b05ecab..0f997af 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -4,6 +4,15 @@
>  
>  menu "Bus devices"
>  
> +config IMX_WEIM
> +	tristate "Freescale EIM DRIVER"
> +	depends on ARCH_MXC && MTD_PHYSMAP_OF

Shawn Guo:
I do not see how this driver depends on MTD_PHYSMAP_OF.

physmap_of is the module that provides the mapping driver for the cfi-flash that associates memory with the "reg" properties of the nor node.   However, since EIM can also attach Bluetooth module or GPS, the EIM driver itself certainly does not depend on the map module.

-- 
Alison Chaiken
alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
