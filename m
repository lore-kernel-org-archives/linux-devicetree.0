From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RFC 0/2] simplefb: Add regulator handling support
Date: Mon, 19 Oct 2015 09:59:25 +0200
Message-ID: <5624A2DD.4020101@redhat.com>
References: <1444669458-5588-1-git-send-email-wens@csie.org>
 <561CAFE8.9080506@redhat.com> <20151014105556.GT14956@sirena.org.uk>
 <561E3D28.2090901@redhat.com> <20151018195719.GC14956@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151018195719.GC14956-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 18-10-15 21:57, Mark Brown wrote:
> On Wed, Oct 14, 2015 at 01:31:52PM +0200, Hans de Goede wrote:
>
>> I like your idea in your other mail where you suggest to actually
>> use foo-supply and bar-supply names in the simplefb node, and then have
>> some code simple iterate over all the properties and check for *-supply
>> properties, so that the proper, schematic matching names can be used.
>
>> But surely if we go this way having a helper for this so that others
>> can re-use that likely not entirely trivial code is a good idea ?
>
> Yeah.  It's trying to come up with a way to do this that is easy to
> avoid abuse that's tricky.
>
>> One user which comes to mind immediately here is the generic mmc-pwrseq
>> driver.
>
>> I agree that we need to be careful to not use a helper like this too
>> much, but I do believe it will make sense to have it in some rare cases.
>> We can put a big warning in both the header declaring it and above
>> the implementation to use it scarcely.
>
> I'd rather have something that was visible in the code, not everyone
> reads the documentation especially not subsystem maintainers reviewing
> drivers that use APIs they're not familiar with.

I'm afraid there is not really a good way to do this though, so a big fat
warning in the header declaring the function is really the bets we can
do IMHO.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
