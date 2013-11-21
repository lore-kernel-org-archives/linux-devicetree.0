From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Thu, 21 Nov 2013 18:38:02 +0000
Message-ID: <20131121183802.3A4B5C40753@trevor.secretlab.ca>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail. com> <20131115095717.GC1709@e106331-lin.cambridge.arm.com> <20131115175241. GB27174@quad.lixom.net> <20131119113015.GH5914@e106331-lin.cambridge.arm. com> <20131121162944.F087FC406A3@trevor.secretlab.ca> <20131121170122. GB22960@srcf.ucam.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131121170122.GB22960-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 21 Nov 2013 17:01:22 +0000, Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org> wrote:
> On Thu, Nov 21, 2013 at 04:29:44PM +0000, Grant Likely wrote:
> 
> > Personally, I think the issue of ACPI support should be taken on a
> > patch-by-patch basis. A lot of the things that need to be done are quite
> > discrete and fairly well contained. If the patches don't look that way
> > then push back on them. For the parts that look ready, go ahead and
> > merge it. Push back on the ones that don't.
> 
> I think the most valuable thing in ACPI is the static data tables. 
> Things like BERT, EINJ, HEST, MPST and the various other bits of RAS 
> functionality have value in the ARM world, and being able to share the 
> implementation is a benefit. But that can be implemented without 
> worrying about using ACPI for device discovery or interfacing.

/complete digression.../ As far as static tables are concerned, it would
be trivial to pull those into a DT system.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
