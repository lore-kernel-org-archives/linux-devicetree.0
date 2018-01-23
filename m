From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] dmaengine: qcom: bam_dma: make bam clk optional
Date: Tue, 23 Jan 2018 09:20:30 +0000
Message-ID: <86774341-19e6-5653-49ae-cb7614490d1b@linaro.org>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
 <20180116190236.14558-2-srinivas.kandagatla@linaro.org>
 <20180119055221.GV18649@localhost>
 <8dfa8ba1-6e98-a8e4-614c-592861cef571@linaro.org>
 <20180123091905.GY18649@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180123091905.GY18649@localhost>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhe-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, ramkri-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, sdharia-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 23/01/18 09:19, Vinod Koul wrote:
> On Mon, Jan 22, 2018 at 09:55:01AM +0000, Srinivas Kandagatla wrote:
> 
>>>> @@ -1180,13 +1180,14 @@ static int bam_dma_probe(struct platform_device *pdev)
>>>>   						"qcom,controlled-remotely");
>>>>   	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
>>>
>>> but you still do clk_get unconditionally?
>>
>> Only reason to do this way is to not break existing users in the mainline.
>>
>> remotely controlled BAM is already supported in upstream driver, there are
>> users of this who pass clk from device tree, If I make this conditional then
>> subsequent reads to the BAM registers for those instances might crash the
>> system.
> 
> But these instances are remote controlled, so if we stop representing them
> in Linux, why would we read them?

Plan is that we would transition those users once we get these 
bindings/changes in. Currently I don't have access to any of those 
devices so I made the changes safe, such that it does not break devices 
on mainline.

--srini

> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
