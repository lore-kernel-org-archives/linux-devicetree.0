From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Tue, 14 Apr 2015 17:48:48 -0400
Message-ID: <CAF6AEGtoxNrCoxT5n0CXmKMnL-YprJ3DkAuM4Myi87WMxPqBGw@mail.gmail.com>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
	<20150410100529.GA6854@e104818-lin.cambridge.arm.com>
	<20150414163613.GM28709@leverpostej>
	<07185B2C-3F37-4E70-9096-1EF5EA8D68CE@codeaurora.org>
	<20150414211720.GA56647@MBP>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150414211720.GA56647@MBP>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 14, 2015 at 5:17 PM, Catalin Marinas
<catalin.marinas-5wv7dgnIgG8@public.gmane.org> wrote:
> On Tue, Apr 14, 2015 at 02:49:04PM -0500, Kumar Gala wrote:
>> On Apr 14, 2015, at 11:36 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wr=
ote:
>> > On Fri, Apr 10, 2015 at 11:05:29AM +0100, Catalin Marinas wrote:
>> >> On Thu, Apr 09, 2015 at 12:37:06PM -0500, Kumar Gala wrote:
>> >>> This patch set adds support for SMP boot on the MSM8x16 family o=
f Qualcomm SoCs.
>> >>>
>> >>> To support SMP on the MSM8x16 SoCs we need to add ARMv8/64-bit S=
CM interfaces to
>> >>> setup the boot/release addresses for the secondary CPUs.  In add=
ition we need
>> >>> a uniquie set of cpu ops.  I'm aware the desired methods for boo=
ting secondary
>> >>> CPUs is either via spintable or PSCI.  However, these SoCs are s=
hipping with a
>> >>> firmware that does not support those methods.
>> >>
>> >> And the reason is? Some guesses:
>> >>
>> >> a) QC doesn't think boot interface (and cpuidle) standardisation =
is
>> >>   worth the effort (to put it nicely)
>> >> b) The hardware was available before we even mentioned PSCI
>> >> c) PSCI is not suitable for the QC's SCM interface
>> >> d) Any combination of the above
>> >>
>> >> I strongly suspect it's point (a). Should we expect future QC har=
dware
>> >> to do the same?
>> >>
>> >> You could argue the reason was (b), though we've been discussing =
PSCI
>> >> for at least two years and, according to QC press releases, MSM89=
16
>> >> started sampling in 2014.
>> >>
>> >> The only valid reason is (c) and if that's the case, I would expe=
ct a
>> >> proposal for a new firmware interface protocol (it could be PSCI-=
based),
>> >> well documented, that can be shared with others that may encounte=
r the
>> >> same shortcomings.
>> >
>> > There's no need to even fork PSCI. The PSCI specification will evo=
lve
>> > over time as vendors request changes and we try to accomodate them=
=2E
>> >
>> > If there's something that PSCI doesn't do that you need it to, con=
tact
>> > ARM. Other vendors already have.
>
> Mostly yes but there may be valid reasons for not being able to use
> PSCI. The spin-table method is still a firmware interface, though not
> necessarily secure (a.k.a. SMC-based). The ACPI parking protocol is
> another and, who knows, maybe we define a way to park CPUs back to
> firmware without SMC calls (when EL3 is not available).
>
>> But what is someone to do between the period of getting PSCI spec
>> updated and needing to ship a product with firmware?
>>
>> The take still sounds like if you don=E2=80=99t implement an exact v=
ersion of
>> PSCI you are screwed from being supported in the upstream ARM64
>> kernel.
>
> These are silly arguments. There is a big difference between "we
> couldn't get the firmware implementing the standard for the early
> silicon but we are working on fixing it for future revisions" vs. "we
> don't give a s**t about these standards, the kernel must be inclusive=
".
> So please make up your mind on which direction you want to pursue.
>

Just speaking as an outsider to this topic, but seems like most/all
tablets/phones/etc ship with signed firmware.  Which means for most of
the population, upgrading the firmware to a new version which did
support the standard (assuming it existed), isn't really an option on
our devices, any more than fixing buggy acpi tables is on our
laptops..

BR,
-R


> --
> Catalin
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
