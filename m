From: Han Xu <xhnjupt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/6] Documentation: dt: mtd: gpmi: document the clocks
 and clock-names in DT property
Date: Tue, 28 Jun 2016 16:18:27 -0500
Message-ID: <CA+EcR21hRgt6veugwf8oasZkRD6DEeMtBXGoJa+Z-aY2eJwBRw@mail.gmail.com>
References: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
 <1466804411-19874-3-git-send-email-han.xu@nxp.com> <20160628205551.GI3737@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160628205551.GI3737@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 28, 2016 at 3:55 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Jun 24, 2016 at 04:40:07PM -0500, Han Xu wrote:
>> add the clocks and clock-names in DT property, gpmi-io clock is
>> mandatory for all platforms, but some platforms, such as i.MX6Q may
>> need more extra clocks for submodules. More details please refer to the
>> SoC reference manual.
>>
>> Signed-off-by: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
>> index d02acaf..a2fd034 100644
>> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
>> @@ -13,6 +13,13 @@ Required properties:
>>      and GPMI DMA channel ID.
>>      Refer to dma.txt and fsl-mxs-dma.txt for details.
>>    - dma-names: Must be "rx-tx".
>> +  - clocks : The clocks needed by the gpmi controller. This field varies
>> +    depends on the SoC design, "gpmi-io" is mandatory but some platforms may
>> +    need several extra clocks, such as i.MX6 series, which requires "gpmi_apb,
>> +    gpmi_bch, gpmi_bch_apb and per1_bch" for all submodules, while i.MX7 only
>> +    need gpmi_bch_apb. Please refer to the HW design manual.
>> +  - clock-names : the name of the clocks, please refer to the HW design
>> +    manual.
>
> No please list the names here (I assume what is above?). Also need to
> specify the order of the clocks. It would be clearest if you list things
> by exact compatible strings.

These are the exact clocks needed by i.MX6 and i.MX7. Order doesn't matter.

>
> Rob
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Sincerely,

Han XU
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
