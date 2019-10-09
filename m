From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to y
Date: Wed, 9 Oct 2019 14:18:48 +0530
Message-ID: <CANAwSgSeYTnUkLnjw-RORw76Fyj3_WT0cdM9D0vFsY8g=9L94Q@mail.gmail.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com> <20191007131649.1768-6-linux.amoon@gmail.com>
 <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
 <7hsgo4cgeg.fsf@baylibre.com> <CANAwSgRfcFa6uBNtpqz6y=9Uwsa4gcp_4tDD+Chhg4SynJCq0Q@mail.gmail.com>
 <CAFBinCA6ZoeR4m4bhj08HF1DqxY1qB5mygpaQCGbo3d8M+Wr9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCA6ZoeR4m4bhj08HF1DqxY1qB5mygpaQCGbo3d8M+Wr9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Martin,

Thanks for your inputs.

On Tue, 8 Oct 2019 at 23:11, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Tue, Oct 8, 2019 at 4:39 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Hi Kevin / Martin,
> >
> > On Tue, 8 Oct 2019 at 04:28, Kevin Hilman <khilman@baylibre.com> wrote:
> > >
> > > Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
> > >
> > > > On Mon, Oct 7, 2019 at 3:17 PM Anand Moon <linux.amoon@gmail.com> wrote:
> > > > [...]
> > > >> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > >> index c9a867ac32d4..72f6a7dca0d6 100644
> > > >> --- a/arch/arm64/configs/defconfig
> > > >> +++ b/arch/arm64/configs/defconfig
> > > >> @@ -774,7 +774,7 @@ CONFIG_MPL3115=m
> > > >>  CONFIG_PWM=y
> > > >>  CONFIG_PWM_BCM2835=m
> > > >>  CONFIG_PWM_CROS_EC=m
> > > >> -CONFIG_PWM_MESON=m
> > > >> +CONFIG_PWM_MESON=y
> > > >
> > > > some time ago I submitted a similar patch for the 32-bit SoCs
> > > > it turned that that pwm-meson can be built as module because the
> > > > kernel will run without CPU DVFS as long as the clock and regulator
> > > > drivers are returning -EPROBE_DEFER (-517)
> > >
> > > On 64-bit SoCs, the kernel boots with PWM as a module also, but DVFS
> > > only works sometimes, and making it built-in fixes the problem.
> > > Actually, it doesn't fix, it just hides the problem, which is likely a
> > > race or timeout happening during deferred probing.
> > >
> > > > did you check whether there's some other problem like some unused
> > > > clock which is being disabled at that moment?
> > > > I've been hunting weird problems in the past where it turned out that
> > > > changing kernel config bits changed the boot timing - that masked the
> > > > original problem
> > >
> > > Right, I would definitely prefer to not make this built-in without a lot
> > > more information to *why* this is needed.  In figuring that out, we'll
> > > probably find the race/timeout that's the root cause.
> > >
> > > Kevin
> > >
> > >
> >
> > Kevin,
> >
> > As per my understanding from the kernelci.org logs it seen that
> > pwm-meson driver is requested more than once before it finally load the module.
> >
> > [0] https://storage.kernelci.org/next/master/next-20191008/arm64/defconfig/gcc-8/lab-baylibre/boot-meson-g12b-odroid-n2.txt
> my understanding is that:
> - the PWM regulator driver is built in (=y)
> - the Meson PWM controller driver is built as module (=m)
> - during boot the PWM regulator node is found and it has a matching
> driver (built-in)
> - the PWM regulator driver tries to find the PWM controller but cannot
> find it yet (and reports "Failed to get PWM: -517")
> - (this repeats a few times)
> - then the filesystem / initramfs is loaded where the modules are located
> - now the Meson PWM controller driver is loaded
> - the PWM regulator driver tries to find the PWM controller -> now it found it
>

Thanks of this information.
At my end on archlinux I also tried to update my initramfs to
add support for *pwm-meson* to but it did not work for me.

> > Hi Martin,
> >
> > I have tired your Martin's patch [1] and still the boot fails to move
> > ahead with below logs.
> > [1] https://lore.kernel.org/patchwork/patch/1034186/
> this patch only silences the "Failed to get PWM: -517" message
> Mark didn't apply it back then because without that message it would
> be harder to debug these issues
>
> > [    1.543928] xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0 SuperSpeed
> > [    1.550422] usb usb2: We don't know the algorithms for LPM for this
> > host, disabling LPM.
> > [    1.558702] hub 2-0:1.0: USB hub found
> > [    1.562131] hub 2-0:1.0: 1 port detected
> > [    1.566206] dwc3-meson-g12a ffe09000.usb: switching to Device Mode
> > [    1.573252] meson-gx-mmc ffe05000.sd: Got CD GPIO
> > [    1.607405] hctosys: unable to open rtc device (rtc0)
> >
> > I have put some more prints in pwm-meson.c it fails to load the module
> > as microsSD card is not completely initialized.
> what makes you think that there's a problem with pwm-meson?
>
> can you please share a boot log with the command line parameter
> "initcall_debug" [0]?
> from Documentation/admin-guide/kernel-parameters.txt:
>  initcall_debug [KNL] Trace initcalls as they are executed.  Useful
>  for working out where the kernel is dying during
>  startup.
>

Well I have tied to add this command  *initcall_debug* to kernel command prompt.
Here is the console log,  but I did not see any init kernel timer logs

Kernel command line: console=ttyAML0,115200n8
root=PARTUUID=45d7d61e-01 rw rootwait
earlyprintk=serial,ttyAML0,115200 initcall_debug printk.time=y

[0] https://pastebin.com/eBgJrSKe

> you can also try the command line parameter "clk_ignore_unused" (it's
> just a gut feeling: maybe a "critical" clock is being disabled because
> it's not wired up correctly).
>

It look like some clk issue after I added the *clk_ignore_unused* to
kernel command line
it booted further to login prompt and cpufreq DVFS seem to be loaded.
So I could conclude this is clk issue.below is the boot log

Kernel command line: console=ttyAML0,115200n8
root=PARTUUID=45d7d61e-01 rw rootwait
earlyprintk=serial,ttyAML0,115200 initcall_debug printk.time=y
clk_ignore_unused

[1] https://pastebin.com/Nsk0wZQJ

> back when I was working out the CPU clock tree for the 32-bit SoCs I
> had a bad parent clock in one of the muxes which resulted in sporadic
> lockups if CPU DVFS was enabled.
> you can try to disable CPU DVFS by dropping the OPP table and it's
> references from the .dtsi
>

Yep yesterday my focus was to disable PWM feature and get boot up-to
login prompt
But not I have to look into clk feature.

*Many thanks for your valuable inputs, I learned a lot of things.*

>
> Martin
>
>
> [0] https://elinux.org/Initcall_Debug

Best Regards
-Anand
