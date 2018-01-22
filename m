From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH -next] of: platform: fix OF node refcount leak
Date: Mon, 22 Jan 2018 11:13:06 +0000
Message-ID: <10e5ef22-37e5-986f-eda0-446214c5626b@arm.com>
References: <1516272219-25359-1-git-send-email-sudeep.holla@arm.com>
 <fd9de06f-df7e-4114-8dda-0483c338b394@arm.com>
 <CAPBZ5QfuExQtM91wPCooiCoztoyt8ihXXWPccGi=_zca+eO5JA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPBZ5QfuExQtM91wPCooiCoztoyt8ihXXWPccGi=_zca+eO5JA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Loys Ollivier <lollivier-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 19/01/18 23:34, Andy Gross wrote:
> On 19 January 2018 at 09:37, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>> Hi Andy,
>>
>> On 18/01/18 10:43, Sudeep Holla wrote:
>>> We need to call of_node_put() for device nodes obtained with
>>> of_find_node_by_path().
>>>
>>> Fixes: 3aa0582fdb82 ("of: platform: populate /firmware/ node from of_platform_default_populate_init()")
>>> Reported-by: Loys Ollivier <lollivier-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>> ---
>>>  drivers/of/platform.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>
>> Can you pick up this with other fixes you would send after v4.16-rc1 or
>> do you prefer me to route through ARM-SoC directly ? Let me know.
> 
> I can pick this up for fixes, no problem.  I can send it along right
> now if you like.  This is a pretty low risk patch.
> 

Thanks Andy.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
