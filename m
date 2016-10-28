From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [RESEND PATCH v2] clk: hisilicon: add CRG driver for Hi3798CV200
 SoC
Date: Fri, 28 Oct 2016 09:19:38 +0800
Message-ID: <bc6bced1-e0cb-4239-7543-0302d00bde4e@hisilicon.com>
References: <1477013830-11481-1-git-send-email-xuejiancheng@hisilicon.com>
 <20161027134833.vdtd5t5hx33o3ahb@rob-hp-laptop>
 <20161028002548.GN26139@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161028002548.GN26139-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bin.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wenpan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org



在 2016/10/28 8:25, Stephen Boyd 写道:
> On 10/27, Rob Herring wrote:
>> On Fri, Oct 21, 2016 at 09:37:10AM +0800, Jiancheng Xue wrote:
>>> Add CRG driver for Hi3798CV200 SoC. CRG(Clock and Reset
>>> Generator) module generates clock and reset signals used
>>> by other module blocks on SoC.
>>>
>>> Signed-off-by: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>>> ---
>>> change log
>>> v2:
>>> - Fixed compiling error when compiled as a module.
>>> - Fixed issues pointed by Stephen Boyd.
>>> - Added prefix HISTB for clock index macro definitions.
>>
>> What Stephen asked for is send this and the Hi3516CV300 series as one 
>> series since there is a dependency.
> 
> Exactly. Please resend both parts, along with Rob's ack on this
> one. I can review it all then and hopefully Rob will be ok with
> the other binding change.
> 

I planed to send the Hi3516CV300 patch after this patch is accepted.

It's also OK to combine them as one series. I'll resend them.

Thanks,
Jiancheng

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
