From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5 v10] dt/bindings: Add binding for the DA8xx MUSB
 driver
Date: Fri, 11 Mar 2016 21:24:03 +0300
Message-ID: <56E30D43.9030508@cogentembedded.com>
References: <1457684989-13318-1-git-send-email-petr@barix.com>
 <20160311155115.GC20204@uda0271908> <56E2EB3C.6080602@barix.com>
 <20160311160603.GF20204@uda0271908> <56E2F078.9020708@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E2F078.9020708-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/11/2016 07:21 PM, Petr Kulhavy wrote:

>> I am having 2nd thought on parsing the clock prop, Sergei's comment
>> might be better. I will look more on this over this weekend. (DT is not
>> in my expertise...)
>>
>> Regards,
>> -Bin.
>
> I like Sergei's comment as well, but cannot see (yet) how the clock input
> selection would be done.

    The same way as now, of course. Only getting the clock frequency would be 
different, via clk_get_rate()...

> I mean, it makes sense to do the clock abstraction only if it can be done
> properly and the clock input selection can be covered as well.

    No, this item has never been covered by the clk layer IIRC. That's what 
the device node props are for.

> The DA8xx platform is missing the real clock framework and therefore the
> different clocks cannot be referenced in DT.

    You mean more than one clock per device?

> There is a fake clock framework in arch/arm/mach-davinci/clock.c - I've
> already been through that and then gave up.

    I'm not sure why you call it "fake". It's a normal clk implementation, 
just not converted to the common clk framework.

> Regards
> Petr

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
