From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Tue, 26 Aug 2014 09:57:28 -0700
Message-ID: <CAD=FV=UYXmFBc3j2TdOGVwp_6oWkQ+84DvWr_X+XoZkvsQ=3gA@mail.gmail.com>
References: <1408973516-21395-1-git-send-email-zyw@rock-chips.com>
	<CAD=FV=Wz1yssGvB05ExPaYxsiizcPRYrfP9OWE+HdoSDKVc_Tw@mail.gmail.com>
	<20140826083206.GD9574@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140826083206.GD9574@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao@chr>
List-Id: devicetree@vger.kernel.org

Lee,

On Tue, Aug 26, 2014 at 1:32 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, 25 Aug 2014, Doug Anderson wrote:
>> On Mon, Aug 25, 2014 at 6:31 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>> > The RK808 chip is a power management IC for multimedia and handheld
>> > devices. It contains the following components:
>> >
>> > - Regulators
>> > - RTC
>> >
>> > The RK808 core driver is registered as a platform driver and provides
>> > communication through I2C with the host device for the different
>> > components.
>> >
>> > Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> You need a Signed-off-by: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> > ---
>
> [...]
>
>> > +static struct rk808 *g_rk808;
>>
>> I think Lee's "Grim" comment here was that prefixing globals with "g_"
>> is not consistent with the Linux coding style.  Just remove the "g_".
>
> That and the seemingly unavoidable use of a global pointer.
>
> [...]
>
>> > +static const struct i2c_device_id rk808_ids[] = {
>> > +        { "rk808", 0 },
>>
>> I think Lee wanted the above to be:
>>
>>        { "rk808", },
>
> Right, but the ',' is now superfluous.

Yeah, I debated that.  Generally I like to have commas at the end just
like a like a semicolon at the end of the final statement (C requires
this, but other languages don't).  Anyway, neither here nor there.  ;)
 I'm happy having the comma removed.


> [...]
>
>> I didn't do a thorough review, just compared to Lee's old feedback.
>> Maybe a good idea to get in the habit to responding to others comments
>> with "Done" so others know you have addressed each comment?
>
> Please only do this locally or in your head.  Reading replies to
> reviews containing only a break-down of what has been fixed is a waste
> of everyone's time.  If/when replying to comments/observations that
> you do _not_ agree with, please snip out all of the ones that you _do_
> agree with.

Sorry for suggesting.  I actually find even an email filled with
nothing but "Done" helpful.  It give me a warm fuzzy that the person
spinning the code _actually_ looked at all the comments (and didn't
miss something).

...but it's really up to you.  If you hate the "Done"s then Chris
certainly shouldn't send them.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
