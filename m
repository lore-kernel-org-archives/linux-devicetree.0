From: Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] dts, kbuild: Implement support for dtb vendor subdirs
Date: Mon, 20 Oct 2014 19:26:32 +0530
Message-ID: <CAM4voakQnY1JMnjrXfTSNTyzA6_f6jtUgJZXXz2N0YRjq3kXRg@mail.gmail.com>
References: <1409899692-1455-1-git-send-email-rric@kernel.org>
	<CAL1qeaGCeRyeKLo70E264bZcamOfBKoN9Y8_NDCjV5j4DoOw1Q@mail.gmail.com>
	<20140919123056.GC20170@rric.localhost>
	<20140919140856.GG2295@e104818-lin.cambridge.arm.com>
	<20140923112619.GG20170@rric.localhost>
	<20141002150804.GP20170@rric.localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141002150804.GP20170-vWBEXY7mpu73kLQC+b9v0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Robert,

On Thu, Oct 2, 2014 at 8:38 PM, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On 23.09.14 13:26:19, Robert Richter wrote:
>> On 19.09.14 15:08:56, Catalin Marinas wrote:
>> > On Fri, Sep 19, 2014 at 01:30:56PM +0100, Robert Richter wrote:
>> > > On 16.09.14 20:49:18, Andrew Bresticker wrote:
>> > > > > Robert Richter (6):
>> > > > >   dts, arm64: Add dtbs_install make target
>> > > > >   dts, kbuild: Factor out dtbs install rules to Makefile.dtbinst
>> > > > >   dts, arm/arm64: Remove dtbs build rules in sub-makes
>> > > > >   dts, kbuild: Implement support for dtb vendor subdirs
>> > > > >   dts, arm64: Move dts files to vendor subdirs
>> > > > >   dts, arm: Remove $(MACHINE) variable from dtbs make recipes
>> > > >
>> > > > I've tested this for arm64 and by adding a vendor sub-directory
>> > > > locally for arm.  This series is also the base for my MIPS DT vendor
>> > > > sub-directory series
>> > > > (http://www.linux-mips.org/archives/linux-mips/2014-09/msg00217.html).
>> > > > So, for the entire series,
>> > > >
>> > > > Tested-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > >
>> > > Andrew, thanks for testing and great this also works on mips.
>> > >
>> > > Anyone willing to take the patches for 3.18? Are any further acks
>> > > needed?
>> >
>> > For the arm64 bits in this series:
>> >
>> > Acked-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
>> >
>> > I think the patches can be merged via arm-soc.
>>
>> Olof,
>>
>> please apply the patches.
>
> Olof, Arnd,
>
> you may want to pull from here alternatively.

I have been using your patchset as the base for my new arm64 SoC
support (http://www.spinics.net/lists/linux-samsung-soc/msg37047.html).
Are you planning to rebase and send this again as some of the patches
did not apply cleanly for me on linux-next.

Regards,
Abhilash
>
> Thanks,
>
> -Robert
>
>
> The following changes since commit a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee:
>
>   Linux 3.16-rc2 (2014-06-21 19:02:54 -1000)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/rric/linux.git tags/dts-subdirs-for-arm-soc-v3.18
>
> for you to fetch changes up to 87bdf4d8625e50d99b56aa2590a2261049a5fd48:
>
>   dts, arm: Remove $(MACHINE) variable from dtbs make recipes (2014-09-03 21:46:49 +0200)
>
> ----------------------------------------------------------------
> dts, kbuild: Implement support for dtb vendor subdirs
>
> ----------------------------------------------------------------
> Robert Richter (6):
>       dts, arm64: Add dtbs_install make target
>       dts, kbuild: Factor out dtbs install rules to Makefile.dtbinst
>       dts, arm/arm64: Remove dtbs build rules in sub-makes
>       dts, kbuild: Implement support for dtb vendor subdirs
>       dts, arm64: Move dts files to vendor subdirs
>       dts, arm: Remove $(MACHINE) variable from dtbs make recipes
>
>  arch/arm/Makefile                                  |  8 +++-
>  arch/arm/boot/dts/Makefile                         | 12 +-----
>  arch/arm64/Makefile                                | 10 ++++-
>  arch/arm64/boot/dts/Makefile                       | 13 +++---
>  arch/arm64/boot/dts/apm/Makefile                   |  5 +++
>  arch/arm64/boot/dts/{ => apm}/apm-mustang.dts      |  0
>  arch/arm64/boot/dts/{ => apm}/apm-storm.dtsi       |  0
>  arch/arm64/boot/dts/arm/Makefile                   |  6 +++
>  arch/arm64/boot/dts/{ => arm}/foundation-v8.dts    |  0
>  arch/arm64/boot/dts/{ => arm}/rtsm_ve-aemv8a.dts   |  0
>  .../boot/dts/{ => arm}/rtsm_ve-motherboard.dtsi    |  0
>  scripts/Kbuild.include                             |  6 +++
>  scripts/Makefile.dtbinst                           | 50 ++++++++++++++++++++++
>  scripts/Makefile.lib                               | 12 ------
>  14 files changed, 88 insertions(+), 34 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/apm/Makefile
>  rename arch/arm64/boot/dts/{ => apm}/apm-mustang.dts (100%)
>  rename arch/arm64/boot/dts/{ => apm}/apm-storm.dtsi (100%)
>  create mode 100644 arch/arm64/boot/dts/arm/Makefile
>  rename arch/arm64/boot/dts/{ => arm}/foundation-v8.dts (100%)
>  rename arch/arm64/boot/dts/{ => arm}/rtsm_ve-aemv8a.dts (100%)
>  rename arch/arm64/boot/dts/{ => arm}/rtsm_ve-motherboard.dtsi (100%)
>  create mode 100644 scripts/Makefile.dtbinst
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
