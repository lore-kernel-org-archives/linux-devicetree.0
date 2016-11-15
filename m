From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: hisilicon: add CRG driver for Hi3516CV300 SoC
Date: Tue, 15 Nov 2016 09:58:07 +0800
Message-ID: <85a91eb4-73bb-582f-b68d-960d423210ef@hisilicon.com>
References: <1477721618-10809-1-git-send-email-xuejiancheng@hisilicon.com>
 <1477721618-10809-3-git-send-email-xuejiancheng@hisilicon.com>
 <20161112000415.GE5177@codeaurora.org>
 <0c3b49a4-f58c-253a-fd87-ab52b0b26010@hisilicon.com>
 <20161114200359.GM5177@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161114200359.GM5177-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bin.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wenpan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, howell.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2016/11/15 4:03, Stephen Boyd wrote:
> On 11/14, Jiancheng Xue wrote:
>> Hi Stephen,
>>
>> On 2016/11/12 8:04, Stephen Boyd wrote:
>>> On 10/29, Jiancheng Xue wrote:
>>>
>>> Should be a From: Pan Wen here?
>>>
>>>> Add CRG driver for Hi3516CV300 SoC. CRG(Clock and Reset
>>>> Generator) module generates clock and reset signals used
>>>> by other module blocks on SoC.
>>>>
>>>> Signed-off-by: Pan Wen <wenpan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>>>
>>> And you should have signed it off? Care to resend or state that
>>> this is incorrectly attributed to you instead of Pan Wen?
>>>
>>
>> Pan Wen is the main author of this patch. I just made some small modification
>> with agreement from him. Do I need to resend this patch if it's better to add my
>> signed-off?
>>
> 
> Sure I'll apply the resent one. But you should also make sure to
> retain Pan Wen's authorship. I'll go do that when applying it.
> 

OK. I have resent this patch. Please check it. Thank you, Stephen.

Regards,
Jiancheng



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
