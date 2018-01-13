From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v5 02/44] clk: davinci: New driver for davinci PLL clocks
Date: Fri, 12 Jan 2018 19:11:26 -0600
Message-ID: <4a32c52f-4335-52c0-fa63-625a449b00b5@lechnology.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-3-git-send-email-david@lechnology.com>
 <7fc8bd35-0416-216d-8e1e-53a0ec6e8790@ti.com>
 <01fbde0e-36a0-2b19-e385-e63bc4a3ae4a@lechnology.com>
 <eb2b1a63-9c7c-aeca-170f-d38642442438@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eb2b1a63-9c7c-aeca-170f-d38642442438-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/12/2018 10:18 AM, Sekhar Nori wrote:
> On Friday 12 January 2018 08:55 PM, David Lechner wrote:
>>>
>>> PLL output on DA850 must never be below 300MHz or above 600MHz (see
>>> datasheet table "Allowed PLL Operating Conditions"). Does this take care
>>> of that? Thats one of the main reasons I recall I went with some
>>> specific values of prediv, pllm and post div in
>>> arch/arm/mach-davinci/da850.c
>>
>> Apparently, I missed this requirement. It looks like I am going to have to
>> rework things so that there is some coordination between the PLL and the
>> PLLDIV clocks in order to get the < 300MHz operating points.
> 
> Just to make sure we are on the same page. The datasheet
> constraint is 600 >= PLLOUT >= 300. PLLOUT is output of POSTDIV.

Hmm... I am on a different page. It looks to me like PLLOUT is the output
of PLLM, not POSTDIV. The datasheet says nothing at all and the TRM does
not say it explicitly, but footnote 2 on the table "System PLLC Output
Clocks", for example, makes it pretty clear.

> 
> The operating points are defined in terms of ARM frequency (and
> voltage). The OPPs defined in kernel today are here:
> https://git.kernel.org/pub/scm/linux/kernel/git/nsekhar/linux-davinci.git/tree/arch/arm/mach-davinci/da850.c#n1092
> 
> Thanks,
> Sekhar
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
