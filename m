From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to y
Date: Wed, 9 Oct 2019 19:05:46 +0200
Message-ID: <CAFBinCCHrvjNTruVk7qr+7Y_m7mP2BJ-0HxftJpiPXpvoD=-QQ@mail.gmail.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com> <20191007131649.1768-6-linux.amoon@gmail.com>
 <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
 <7hsgo4cgeg.fsf@baylibre.com> <CANAwSgRfcFa6uBNtpqz6y=9Uwsa4gcp_4tDD+Chhg4SynJCq0Q@mail.gmail.com>
 <CAFBinCA6ZoeR4m4bhj08HF1DqxY1qB5mygpaQCGbo3d8M+Wr9Q@mail.gmail.com> <CANAwSgSeYTnUkLnjw-RORw76Fyj3_WT0cdM9D0vFsY8g=9L94Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgSeYTnUkLnjw-RORw76Fyj3_WT0cdM9D0vFsY8g=9L94Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Anand,

On Wed, Oct 9, 2019 at 10:49 AM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > can you please share a boot log with the command line parameter
> > "initcall_debug" [0]?
> > from Documentation/admin-guide/kernel-parameters.txt:
> >  initcall_debug [KNL] Trace initcalls as they are executed.  Useful
> >  for working out where the kernel is dying during
> >  startup.
> >
>
> Well I have tied to add this command  *initcall_debug* to kernel command prompt.
> Here is the console log,  but I did not see any init kernel timer logs
I don't remember from the top of my head if any additional Kconfig
setting is needed

> Kernel command line: console=ttyAML0,115200n8
> root=PARTUUID=45d7d61e-01 rw rootwait
> earlyprintk=serial,ttyAML0,115200 initcall_debug printk.time=y
>
> [0] https://pastebin.com/eBgJrSKe
>
> > you can also try the command line parameter "clk_ignore_unused" (it's
> > just a gut feeling: maybe a "critical" clock is being disabled because
> > it's not wired up correctly).
> >
>
> It look like some clk issue after I added the *clk_ignore_unused* to
> kernel command line
> it booted further to login prompt and cpufreq DVFS seem to be loaded.
> So I could conclude this is clk issue.below is the boot log
interesting - as Jerome suggested: the next step is to find out which
clock is causing problems
last time I checked there was no debug print in the code which
disables unused clocks so I had to add that myself

> Kernel command line: console=ttyAML0,115200n8
> root=PARTUUID=45d7d61e-01 rw rootwait
> earlyprintk=serial,ttyAML0,115200 initcall_debug printk.time=y
> clk_ignore_unused
>
> [1] https://pastebin.com/Nsk0wZQJ
>
> > back when I was working out the CPU clock tree for the 32-bit SoCs I
> > had a bad parent clock in one of the muxes which resulted in sporadic
> > lockups if CPU DVFS was enabled.
> > you can try to disable CPU DVFS by dropping the OPP table and it's
> > references from the .dtsi
> >
>
> Yep yesterday my focus was to disable PWM feature and get boot up-to
> login prompt
> But not I have to look into clk feature.
>
> *Many thanks for your valuable inputs, I learned a lot of things.*
you're welcome :-)


Martin
