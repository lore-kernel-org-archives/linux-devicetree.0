From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 1/2] video: ARM CLCD: Add DT support
Date: Mon, 23 Jun 2014 12:56:34 -0500
Message-ID: <CAL_JsqLQTT5N8D_GTDd5YVgr2SSCXtC6EcRQxW2=_-J8Wmsf0g@mail.gmail.com>
References: <1403018494-10264-1-git-send-email-pawel.moll@arm.com>
 <20140620170901.GA12059@leverpostej> <1403532837.3804.29.camel@hornet>
 <CAL_Jsq+6SveWhzWPrtziTJ-tDOFaJV4sXO+r_CEhAZf=tQE6FA@mail.gmail.com> <1403539186.3804.46.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403539186.3804.46.camel@hornet>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 23, 2014 at 10:59 AM, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> wrote:
> On Mon, 2014-06-23 at 16:43 +0100, Rob Herring wrote:
>> On Mon, Jun 23, 2014 at 9:13 AM, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> wrote:
>> > On Fri, 2014-06-20 at 18:09 +0100, Mark Rutland wrote:

>> >> > +- max-memory-bandwidth: maximum bandwidth in bytes per second that the
>> >> > +   cell's memory interface can handle
>> >>
>> >> When should I set this, given it is optional?
>> >
>> > When there is a (significant) limitation of the bandwidth available for
>> > the cell's memory interface. One will either be told by the soc guys or
>> > will figure it out in the hard way, as we did :-(
>>
>> What are you going to do with this information? b/w is a function of
>> screen size and pixel depth. Are you going to refuse certain configs
>> based on that? Seems like someone doing their own modes should know
>> what they are doing and the limitations.
>>
>> Again, drop it until there is a defined need for this.
>
> Yes, there is. Use case: PL111 is wired up to a HDMI formatter, which
> will take everything up to 1080p. This is what a DRM driver (what/if
> it's ready) will get from the encoder driver (and rightly so). But the
> chip interconnect limitations is make the chip being able to get 480p at
> 60Hz tops.
>
> Or do you want me to add a subnode with timings for all achievable modes
> instead?

I want this solved in a generic way and not something pl111 specific.
If this is already defined then use it. If not, I would drop this for
now and get a pl111 binding in place finally.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
