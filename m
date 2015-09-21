From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/3] mfd: tps65912: Rewrite driver adding DT support and
 using regmap
Date: Mon, 21 Sep 2015 14:59:59 -0500
Message-ID: <560061BF.3040903@ti.com>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-3-git-send-email-afd@ti.com>
 <20150919184021.GQ30445@sirena.org.uk> <56003365.8030803@ti.com>
 <20150921192645.GA30445@sirena.org.uk> <56005EAA.3000208@ti.com>
 <20150921195457.GD30445@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150921195457.GD30445-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/21/2015 02:54 PM, Mark Brown wrote:
> On Mon, Sep 21, 2015 at 02:46:50PM -0500, Andrew F. Davis wrote:
>> On 09/21/2015 02:26 PM, Mark Brown wrote:
>
>>> So split that interface change between the MFD and the function drivers
>>> out into a separate change - you've got way more than just an interface
>>> change in here (and you've not enumerated the various things that are
>>> being changed in the changelog).
>
>> I'm not really "changing" anything, this is a ground-up re-write. This
>> fundamentally changes the way the MFD core and the function drivers interact,
>> I would consider this a whole new driver that just happens to replace an older
>> driver, not a bunch of incremental changes although I kept the same filenames.
>
> So split out the deletion then add the new driver like you'd add any
> other new driver.  If there were in tree users even that would be really
> problematic but it does seem like we don't have any so perhaps people
> will be OK with this.
>

OK, I'll split that in v2.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
