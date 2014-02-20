From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RFC v1 2/3] of: Add definition of maximum length of a
 property name
Date: Thu, 20 Feb 2014 16:02:40 +0100
Message-ID: <53061910.6040701@samsung.com>
References: <1392829124-25705-1-git-send-email-s.nawrocki@samsung.com>
 <1392829124-25705-3-git-send-email-s.nawrocki@samsung.com>
 <CAL_Jsq+0pmLHC2Xo=i3kvQMo+uukraK1nRyPZReKtwE_GEaGFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAL_Jsq+0pmLHC2Xo=i3kvQMo+uukraK1nRyPZReKtwE_GEaGFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 19/02/14 22:42, Rob Herring wrote:
> On Wed, Feb 19, 2014 at 10:58 AM, Sylwester Nawrocki
> <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> > Maximum length of a property name is defined by ePAPR (2.2.4.1) as
>> > 31 characters. Add a corresponding definition, including the trailing
>> > null space.
>
> Does dtc enforce this? It would be good to add if not.

As far as I can see there is nothing currently enforcing this in dtc.
There is no related check and too long property names are accepted
silently.
I'll try and see if I can prepare a patch for this, until someone more
familiar with dtc does it.

--
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
