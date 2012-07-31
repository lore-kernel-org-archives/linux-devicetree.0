From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/6] tegra: fdt: Add NAND definitions to fdt
Date: Tue, 31 Jul 2012 10:15:45 +0100
Message-ID: <CAPnjgZ2-MBrXh2FoZnTL-tU+U4e_rqR4CRKoquLw3YE+VG=xCg@mail.gmail.com>
References: <1343631210-22278-1-git-send-email-sjg@chromium.org>
 <1343631210-22278-5-git-send-email-sjg@chromium.org>
 <50170F63.70403@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50170F63.70403-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Scott,

On Mon, Jul 30, 2012 at 11:49 PM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On 07/30/2012 01:53 AM, Simon Glass wrote:
>> Add a flash node to handle the NAND, including memory timings and
>> page / block size information.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>> Changes in v2:
>> - Update NAND binding to add "nvidia," prefix
>>
>> Changes in v3:
>> - Add reg property for unit address (should be used for chip select)
>> - Update fdt binding to make everything Nvidia-specific
>>
>> Changes in v4:
>> - Remove fdt bindings related to page structure
>>
>>  board/nvidia/dts/tegra20-seaboard.dts |   10 ++++++++++
>>  1 files changed, 10 insertions(+), 0 deletions(-)
>>
>> diff --git a/board/nvidia/dts/tegra20-seaboard.dts b/board/nvidia/dts/tegra20-seaboard.dts
>> index 3352539..25a63a0 100644
>> --- a/board/nvidia/dts/tegra20-seaboard.dts
>> +++ b/board/nvidia/dts/tegra20-seaboard.dts
>> @@ -153,4 +153,14 @@
>>                       0x1f04008a>;
>>               linux,fn-keymap = <0x05040002>;
>>       };
>> +
>> +     nand-controller@70008000 {
>> +             nvidia,wp-gpios = <&gpio 59 0>;         /* PH3 */
>> +             nvidia,width = <8>;
>> +             nvidia,timing = <26 100 20 80 20 10 12 10 70>;
>> +             nand@0 {
>> +                     reg = <0>;
>> +                     compatible = "hynix,hy27uf4g2b", "nand-flash";
>> +             };
>> +     };
>
> Are #address-cells, #size-cells, and reg on the controller node provided
> by an /include/?

Yes that's right, in the previous patch:

	nand: nand-controller@70008000 {
		#address-cells = <1>;
		#size-cells = <0>;
		compatible = "nvidia,tegra20-nand";
		reg = <0x70008000 0x100>;
	};

Regards,
Simon

>
> -Scott
>
>
