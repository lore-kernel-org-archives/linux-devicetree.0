From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 0/3] Overlay manager for predefined DT overlay fragments
Date: Fri, 13 Oct 2017 16:51:03 -0700
Message-ID: <CALAqxLWcK-wbmQxtX4RziQsvQ26DmixC=gEPojFVHruFrpBnjw@mail.gmail.com>
References: <1507613660-27236-1-git-send-email-john.stultz@linaro.org> <20171013214103.mv6wcemzcl36nnvs@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171013214103.mv6wcemzcl36nnvs@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Dmitry Shmidt <dimitrysh@google.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 13, 2017 at 2:41 PM, Rob Herring <robh@kernel.org> wrote:
> On Mon, Oct 09, 2017 at 10:34:17PM -0700, John Stultz wrote:
>> In working with the HiKey and HiKey960 as targets for AOSP,
>> Dmitry developed the following overlay manager driver, which
>> allows a number of pre-determined DT overlay configurations to
>> be defined, and the configurations to be enabled at boot time
>> via a kernel boot argument.
>>
>> This has been submitted before, but while the earlier discussion
>> didn't really resolve to any sort of actionable direction, this
>> issue cropped up again and was a major discussion topic at the
>> Linux Plumbers Conference Android Microconference, so I suspect
>> it is worth revisiting this solution again.
>
> The Treble way to handle this is it is the bootloader's problem, right?

I believe so, though with the treble approach, the device
configuration is still somewhat fixed. Just that configuration is
spread out between multiple partitions. Its a bit of a separate issue.

>> The overall use case is being able to configure devboards that
>> support a number of different mezzanine peripherals which
>> unfortunately cannot be probed. Some example mezzanines are
>> LCD panels or sensor hubs, as well as other options.
>
> There's probably some usecases for putting the overlay into the base
> DT, but I don't think mezzanine boards is one of them especially for dev
> boards where we may want to share overlays.
>
> I could see it in cases where you have 2nd source components for a
> product and want to select one.
>
>> The new functionality this driver provides is a mechanism to
>> specify multiple pre-determined dt overlay fragments in a
>> dtb file, and providing a way to select which dt fragments
>> should be applied via the kernel boot argument.
>>
>> The desire to use a kernel boot-argument as the selection
>> mechanism, comes from the Android Boot Image format not handling
>> dtbs independently. Usually with Android, the dtb is appended
>> to the kernel image, and modifying that is much more difficult
>> then changing the boot argugments. There is also a usability
>> argument that using a kernel command option to select
>> pre-defined entries is simpler for users to navigate.
>
> Doesn't Treble address the handling of overlays? Of course, none of what
> has been outlined for Treble has been reviewed upstream either... The
> concept seems fine, it's the vendor implementations that worry me.

Again, I'm not sure how that connects to the proposal here. Having
treble's multiple overlays being picked up in a standard fashion is
nice, but how does that translate into a user booting a board with one
mezzanine and then change the mezzanine and be able to get the new
mezzanine to work with a minimal amount of fuss.

> As far as usability, a RPi user would probably say listing
> overlays in a text file is easiest as that's how the RPi firmware works.

Right, and I agree that usability wise, its very similar to the
cmdline arguments. But that requires firmware that keeps track of
various overlays and has some small filesystem where that config file
can be stored and easily updated.

>> Also, since the mezzanines are unable to be probed, we cannot
>> use other solutions, like having the bootloader specify
>> additional dtb overlays to the kernel.
>
> Not sure I follow.
>
> Someone has to decide what to put on the kernel command line. If you are
> setting the overlay in the command line at bootimage build time or in
> the bootloader, then you could just apply the overlay at that point in
> time. Maybe it's slightly easier to change the kernel command line than
> change the dtb.

Not, its not slightly easier, its much *much* easier to tweak the boot
arguments. Since the dtb is appended to the kernel image w/ the
abootimg format, its not simple at all to cut one out and replace it.

While the cmdline is trivial to do with the abootimg command:
abootimg -x boot.img
vi bootimg.cfg
abootimg -u boot.img -f ./bootimg.cfg

and re-flash.  This doesn't require access to the kernel source or
rebuilding anything.

It seems you're suggesting that there be some sort of special overlay
partition which users have to flash with pre-built images containing
the appropriate overlay dtbs, so that something like the treble
overlay-per-partition approach could be used.

And in the case with hikey/hikey960, this may be doable, as we can
modify the UEFI source, but it would also require users to have all
the various overlay images to flash as well, which adds complexity.
Additionally on other boards which don't have open firmware, such a
solution may not be feasible. The benefit to this approach is it
doesn't require such standardized firmware behavior.

I really do think there is value in the simplicity of this approach.

thanks
-john
