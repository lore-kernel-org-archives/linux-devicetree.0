From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Turn of_match_node into a static inline when
 CONFIG_OF isn't set
Date: Tue, 11 Feb 2014 17:14:51 -0600
Message-ID: <CAL_JsqJdbBuv0TgN7Okrxa4MmEon6a74hv458VFS=8RpcyX5tw@mail.gmail.com>
References: <1392122211-11422-1-git-send-email-laurent.pinchart@ideasonboard.com>
	<1596542.hkJp71u3OJ@avalon>
	<20140211164825.GC841@joshc.qualcomm.com>
	<6446980.WMjvBYStRY@avalon>
	<20140211180845.GG841@joshc.qualcomm.com>
	<CAMuHMdVkPLe5986hYPApoQr7oJSb6U2P71=nP+9mtvtaskdHXg@mail.gmail.com>
	<CAL_JsqKnsr-9nSjCGvroC0nDK36vQUnwMWj=cPjvUbRymmHFOQ@mail.gmail.com>
	<20140211215519.GJ841@joshc.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140211215519.GJ841-OP5zVEFNDbfdOxZ39nK119BPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 3:55 PM, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On Tue, Feb 11, 2014 at 03:30:33PM -0600, Rob Herring wrote:
>> On Tue, Feb 11, 2014 at 12:29 PM, Geert Uytterhoeven
>> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> > On Tue, Feb 11, 2014 at 7:08 PM, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> >> It sure would be convenient if platform_device had a 'const struct
>> >> of_device_id *of_id_entry' member similar to the existing struct
>> >> platform_device_id one, that was set up during platform device matching.
>> >> Most platform_driver users of of_match_node() would simply go away.
>> >
>> > Can't the entry be shared for both platform_device_id and of_device_id?
>> > Only one of them can be valid at the same time, right?
>> >
> [..]
>>
>> I believe this is the reason drivers have to call of_match_device:
>>
>> commit b1608d69cb804e414d0887140ba08a9398e4e638
>> Author: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Date:   Wed May 18 11:19:24 2011 -0600
>>
>>     drivercore: revert addition of of_match to struct device
>>
>>     Commit b826291c, "drivercore/dt: add a match table pointer to struct
>>     device" added an of_match pointer to struct device to cache the
>>     of_match_table entry discovered at driver match time.  This was unsafe
>>     because matching is not an atomic operation with probing a driver.  If
>>     two or more drivers are attempted to be matched to a driver at the
>>     same time, then the cached matching entry pointer could get
>>     overwritten.
>>
>>     This patch reverts the of_match cache pointer and reworks all users to
>>     call of_match_device() directly instead.
>>
>>     Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> Interesting, thanks for the history!  I'm wondering if this same problem
> exists for the existing platform_device_id cached pointer as well.
>
> Okay, so maybe caching a pointer in the device isn't the best option,
> what if we considered extending the platform_driver callbacks to include
> a set of per-method (?) probe callbacks which do provide a handle to
> matched identifiers.
>
> In the case of a totally contrived platform_driver supporting ACPI, OF,
> and !OF configurations, it might look something like:
>
>         static const struct of_device_id acme_of_table[] = {
>                 /* ... */
>                 { },
>         };
>         MODULE_DEVICE_TABLE(of, acme_of_table);
>
>         static int acme_probe_of(struct platform_device *pdev,
>                                  const struct of_device_id *id)

I don't think this is the right direction. You might want to look at
of_platform_driver in git history...

We still have something like this for macio_bus though.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
