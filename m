From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: dtx_diff - add info to error message
Date: Fri, 12 Feb 2016 09:37:57 -0800
Message-ID: <56BE1875.5010307@gmail.com>
References: <56B0FD4B.8080600@gmail.com> <56BD2C6D.6000400@gmail.com> <CAL_JsqL0CpbcACqNjo1u7KYUz_rnKVWj8ZjKuyE2mefNw=Li4A@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL0CpbcACqNjo1u7KYUz_rnKVWj8ZjKuyE2mefNw=Li4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2/11/2016 5:41 PM, Rob Herring wrote:
> On Thu, Feb 11, 2016 at 6:50 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 2/2/2016 11:02 AM, Frank Rowand wrote:
>>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>>
>>> If kernel config options are not properly set, "make scripts" will not
>>> compile dtc.  Update the unable to find dtc error message to check
>>> the kernel config and give better advice on how to create dtc.
>>>
>>> Reword another error message to increase clarity.
>>>
>>> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>
>> < snip >
>>
>> Ping, no reply on original email.
> 
> No comment, no reply. I only reply with "applied" when I actually
> apply stuff which tends to be at least several weeks. Otherwise, I
> might tell you applied and then miss it. :)
> 
> Anyway, now applied.
> 
>> In the thread about the of ir msi-map patch you mentioned that you have nothing
>> else queued for 4.5.  Is dtx_diff (and hopefully this patch) queued up for 4.6?
>> If so, could they instead go into 4.5 since they are support tools, and do not
>> directly impact the kernel?
> 
> It's not a fix either though, so no, it's queued for 4.6 and has been
> since -rc1.
> 
> Rob
> 

Ok, thanks!

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
