From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] TTY: add slave driver to power-on device via a regulator.
Date: Fri, 12 Dec 2014 06:59:39 -0500
Message-ID: <548AD8AB.4090400@hurleysoftware.com>
References: <20141211214801.4127.93914.stgit@notabene.brown>	<20141211215944.4127.4186.stgit@notabene.brown>	<548A29A4.7060908@hurleysoftware.com> <20141212162714.3a2378df@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141212162714.3a2378df-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/12/2014 12:27 AM, NeilBrown wrote:
> On Thu, 11 Dec 2014 18:32:52 -0500 Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
> wrote:
> 
>> On 12/11/2014 04:59 PM, NeilBrown wrote:
>>> The regulator is identified in devicetree as 'vdd-supply'
>>>
>>> Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
>>
>> tty_* is only for tty core functions/data.
> 
> I think you are just objecting to the function and type names - is that
> correct?

Yeah, exactly.

>  I suspect I can come up with something different.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
