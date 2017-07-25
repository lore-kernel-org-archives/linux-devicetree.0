From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: dma: Add Spreadtrum SC9860 DMA controller
Date: Tue, 25 Jul 2017 14:23:29 +0800
Message-ID: <CAMz4ku+PnouY3vNL18Psvp9+0MMqqm-MrOLis_3B=00WeRs1Hw@mail.gmail.com>
References: <63f2b93b3e484862f736e37d6d422b5566637163.1500361078.git.baolin.wang@spreadtrum.com>
 <20170724175246.fgqtls664zmg4r4y@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170724175246.fgqtls664zmg4r4y@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 25 July 2017 at 01:52, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Jul 18, 2017 at 03:06:11PM +0800, Baolin Wang wrote:
>> This patch adds the binding documentation for Spreadtrum SC9860 DMA
>> controller device.
>>
>> Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/dma/sprd-dma.txt |   41 ++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/dma/sprd-dma.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/sprd-dma.txt b/Documentation/devicetree/bindings/dma/sprd-dma.txt
>> new file mode 100644
>> index 0000000..3ccf776
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/sprd-dma.txt
>> @@ -0,0 +1,41 @@
>> +* Spreadtrum DMA controller
>> +
>> +This driver follows the generic DMA bindings defined in dma.txt.
>
> s/driver/binding/
>
> With that,
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Will fix this in next version. Thanks Rob.

-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
