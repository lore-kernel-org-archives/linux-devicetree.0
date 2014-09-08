From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dmaengine: qcom_bam_dma: add one more optional clock
Date: Mon, 08 Sep 2014 18:43:58 +0300
Message-ID: <540DCEBE.8060808@mm-sol.com>
References: <1410112547-363-1-git-send-email-svarbanov@mm-sol.com> <20140908103559.GC12081@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140908103559.GC12081@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Thank you for the comments!

On 09/08/2014 01:36 PM, Mark Rutland wrote:
> On Sun, Sep 07, 2014 at 06:55:47PM +0100, Stanimir Varbanov wrote:
>> The BAM is tightly coupled with the peripheral to which it
>> belongs. In that sprit to access the BAM configuration
>> registers the driver needs to enable some peripheral
>> clocks. Currently the DT node enables bamclk which seems
>> is not enough for some peripherals (for example the crypto
>> engine wants core and iface clocks). This change attempts
>> to solve this issue by adding one more optional clock
>> in bam_dma driver.
>>
>> Signed-off-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/dma/qcom_bam_dma.txt       | 12 ++++--
>>  drivers/dma/qcom_bam_dma.c                         | 44 +++++++++++++++-------
>>  2 files changed, 38 insertions(+), 18 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
>> index d75a9d7..2376897 100644
>> --- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
>> +++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
>> @@ -6,8 +6,11 @@ Required properties:
>>  - interrupts: Should contain the one interrupt shared by all channels
>>  - #dma-cells: must be <1>, the cell in the dmas property of the client device
>>    represents the channel number
>> -- clocks: required clock
>> -- clock-names: must contain "bam_clk" entry
>> +- clocks: list of required clock plus one optional clock. The optional clock
>> +          is needed for some peripherals and can be omitted.
>> +- clock-names: must contain "core" clock name representing the required clock
>> +               plus the optional "iface" clock name depending on
>> +               peripheral needs.
> 
> Please don't change the names of input lines (at least without retaining
> support for the old name). Does this change not break existing DTBs?

It shouldn't break any DTBs. I changed the "bam_clk" because it sounds
like the BAM needs only one "bam_clk". But the practice shows that in
the crypto engine case I need to pass "core" and "iface" clocks to get
bam dma driver initialised.

I hope Andy can share his opinion on that, or even suggest something better.

> 
> Which of these new names did "bam_clk" previously correspond to?

The required one i.e. "core".

> 
> How many clock inputs does the BAM actually have? Are there more which
> we don't yet describe?
> 
> You mention that the iface clock is actually fed into the peripheral the
> BAM is attached to. Can you explain why this clock is necessary to use
> the BAM?

No, I can't explain why, might be hardware reasons.

> 
> If you want do describe multiple clocks and names are required, define
> clocks in terms of clock-names so you don't need to state everything
> twice, Put each clock on a new line, e.g.
> 
> - clocks: A list of phandle + clock-specifier pairs, one for each entry
>   in clock-names
> - clock-names: should contain:
>    * "foo_clk" for the FOO clock
>    * "bar_clk" for the BAR input on baz_xxxx systems

OK. Thanks.

-- 
regards,
Stan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
