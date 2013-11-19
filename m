From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Tue, 19 Nov 2013 11:57:44 +0000
Message-ID: <20131119115744.GK16735@n2100.arm.linux.org.uk>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com> <20131115095717.GC1709@e106331-lin.cambridge.arm.com> <20131115175241.GB27174@quad.lixom.net> <20131119113015.GH5914@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131119113015.GH5914-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 19, 2013 at 11:30:15AM +0000, Mark Rutland wrote:
> I'm not sure it's entirely reasonable to assume that Microsoft will
> swoop in and develop standards that are useful to us or even applicab=
le
> to the vast majority of the systems that are likely to exist.

It's not in their interest to do this, so it won't happen.

> Outside of the ARM Linux community there is work ongoing to change AC=
PI
> to better suit the level of variation we seem in the ARM space (see
> Darren Hart's presentation from ELCE [1]). We need to be involved now=
 in
> order to make sure that this is actually generally applicable.

It may have been interesting to have attended some of these talks, but
because the LF botched up and never told the KSummit invitees that they
had free access to ELCE until after ELCE had finished...

> I think that we need to be involved in ACPI from today if we have any
> hope of having something sane in future.

I fully agree with that.  If we're not involved now, we're going to end
up with something that's already designed and implemented on systems
which we'll then _have_ no option but to accept or just not be able to
run mainline kernels on such systems.

To ignore ACPI now would be extremely n=E4ieve.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
