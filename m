From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Thu, 21 Nov 2013 20:44:39 +0000
Message-ID: <20131121204439.BC38AC40753@trevor.secretlab.ca>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail. com> <20131115095717.GC1709@e106331-lin.cambridge.arm.com> <20131115175241. GB27174@quad.lixom.net> <20131119113015.GH5914@e106331-lin.cambridge.arm. com> <20131121162944.F087FC406A3@trevor.secretlab.ca> <20131121175822. GA9590@quad.lixom.net> <20131121185408.GX16735@n2100.arm.linux.org.uk> < CAOesGMgzUSMDy99XojipfRd5OM88UhfbCYO0aoc5m-Q8Fwnddg@mail.gmail.com> < 20131121190126.GZ16735@n2100.arm.linux.org.uk> < CAOesGMgxGq1Zmo+Dq-Rmy2F02-=12yUzB0AKn35yK2j3CacNRQ@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgxGq1Zmo+Dq-Rmy2F02-=12yUzB0AKn35yK2j3CacNRQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 21 Nov 2013 11:31:10 -0800, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Thu, Nov 21, 2013 at 11:01 AM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> > On Thu, Nov 21, 2013 at 10:59:41AM -0800, Olof Johansson wrote:
> >> On Thu, Nov 21, 2013 at 10:54 AM, Russell King - ARM Linux
> >> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> >> > This depends what you want from ACPI, and what market ACPI is being
> >> > targetted at.
> >>
> >> We're talking ACPI on servers here.
> >
> > Now read the rest of my email, thanks.
> 
> Yes, there are use cases for ACPI on embedded, which is what Intel is
> getting into and the standard is changing accordingly. On embedded ARM
> we're quite comfortable with DT for now, so it doesn't make sense to
> consider ACPI there just for the sake of it, as far as I am concerned.
> 
> And, on servers, using the embedded-targeted bindings that expose all
> hardware details (and leaving implementation to the kernel) seems
> counter to the main target of forwards- and backwards compatibility.
> That can only really be achieved by getting rid of hardware diversity
> and reaching standardized hardware platforms with discoverable
> devices. Keeping the complex parts of power management out of the
> kernel on those platforms is going to be important too.

That is something that can definitely push back on. We've got the
collision of what have we been required to do for embedded SoCs with
technology designed for systems that aren't quite as much "fun". The
ACPI team has been investigating what is needed to port existing device
drivers to use ACPI bindings, but it is resonable to say that clocks and
regulators (for example) have no business being described in the ACPI
tree.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
