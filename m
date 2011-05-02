From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: DTC failure on /memreserve/ if moved after /include/
Date: Mon, 2 May 2011 11:54:06 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B1BF@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following from tegra-harmony.dts compiles fine:

    /dts-v1/;

    /memreserve/ 0x1c000000 0x04000000;
    /include/ "tegra250.dts"

    / {

However, if I re-order this as follows:

    /dts-v1/;
    /include/ "tegra250.dts"

    /memreserve/ 0x1c000000 0x04000000;

    / {

Then dtc fails:

      DTC     arch/arm/boot/tegra-harmony.dtb
    DTC: dts->dtb  on file "arch/arm/boot/dts/tegra-harmony.dts"
    Error: arch/arm/boot/dts/tegra-harmony.dts:4.1-13 syntax error
    FATAL ERROR: Unable to parse input tree
    make[1]: *** [arch/arm/boot/tegra-harmony.dtb] Error 1

Is this a dtc bug, or does the DTS syntax actually disallow this?

Thanks.

-- 
nvpublic
