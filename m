From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5 v10] dt/bindings: Add binding for the DA8xx MUSB
 driver
Date: Mon, 4 Apr 2016 10:45:06 +0200
Message-ID: <57022992.4060008@barix.com>
References: <1457684989-13318-1-git-send-email-petr@barix.com>
 <87fuvtbl26.fsf@intel.com> <56E76E5A.5060801@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E76E5A.5060801-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 15.03.2016 03:07, David Lechner wrote:
> On 03/14/2016 02:00 AM, Felipe Balbi wrote:
>>
>> Hi,
>>
>> why isn't this an actual clock phandle ? Driver could, then, use
>> clk_get_rate() to figure this one out. You could just use a fixed clock
>> here to satisfy the clock API.
>>
>
> I've actually been working on getting the da8xx ohci driver working 
> with device tree. It has similar clock issues (in fact, the ohci clock 
> is a child of the musb clock). Petr, give me a day or two and will 
> have post some patches. It will have a clock that can be used here for 
> clk_get_rate().

Hi David,

I'm trying to move on with my USB2.0 patch set because my projects is 
blocked waiting for it.
I've seen your PHY patch but it contains only on/off functions and does 
not handle the clocks, which IMHO should be moved to the PHY driver as 
well if we decided to do it properly.

How shall we proceed if both of us are working on the same piece of code?

Thanks
Petr

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
