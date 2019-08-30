From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv1 0/3] Odroid c2 missing regulator linking
Date: Fri, 30 Aug 2019 15:04:31 +0530
Message-ID: <CANAwSgQwZg_AXAnAY4KwDzHpwcSA9up7SrR6jyv5Bem24wtaJg@mail.gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com> <8c40f334-c723-b524-857c-73734b7d0827@baylibre.com>
 <CANAwSgShr-K-44UzdxFC7pvpTye_pbEMdS6ug1eWwYhnsVNGdQ@mail.gmail.com> <101a12ac-1464-8864-4f8c-56bb46034a08@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <101a12ac-1464-8864-4f8c-56bb46034a08@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Fri, 30 Aug 2019 at 13:01, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 29/08/2019 20:35, Anand Moon wrote:
> > Hi Neil,
> >
> > On Thu, 29 Aug 2019 at 13:58, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> On 28/08/2019 22:27, Anand Moon wrote:
> >>> Below small changes help re-configure or fix missing inter linking
> >>> of regulator node.
> >>>
> >>> Changes based top on my prevoius series.
> >>
> >> For the serie:
> >> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> >>
> >
> > Thanks for your review.
> >
> >>>
> >>> [0] https://patchwork.kernel.org/cover/11113091/
> >>>
> >>> TOOD: Add support for DVFS GXBB odroid board in next series.
> >>
> >> I'm curious how you will do this !
> >
> > I was just studying you previous series on how you have implemented
> > this feature for C1, N2 and VIM3 boards.
> >
> > [0] https://patchwork.kernel.org/cover/11114125/
> >
> > I started gathering key inputs needed for this ie *clk / pwm*
> > like VDDCPU and VDDE clk changes.
> >
> > But it looks like of the complex clk framework needed, so I leave this to the
> > expert like your team of developers to do this much quick and efficiently.
>
> On GXBB, GXL, GXM and AXG SoCs, CPU Frequency setting and PWM Regulator setup is
> done by the SCPI Co-processor via the SCPI protocol.
>
> Thus, we should not handle it from Linux, and even if we could, we don't have the
> registers documentation of the CPU clusters clock tree.
>

Ok thanks.

> SCPI works fine on all tested devices, except Odroid-C2, because Hardkernel left
> the > 1.5GHz freq in the initial SCPI tables loaded by the BL2, i.e. packed with U-Boot.
> Nowadays they have removed the bad frequencies, but still some devices uses the old
> bootloader.
>
> But in the SCPI case we trust the table returned by the firmware and use it as-in,
> and there is no (simple ?) way to override the table and set a max frequency.
>
> This is why we disabled SCPI.
>
> See https://patchwork.kernel.org/patch/9500175/

I have quickly enable this on my board and here the cpufreq info

[alarm@alarm ~]$  cpupower frequency-info
analyzing CPU 0:
  driver: scpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1 2 3
  CPUs which need to have their frequency coordinated by software: 0 1 2 3
  maximum transition latency: 200 us
  hardware limits: 100.0 MHz - 1.54 GHz
  available frequency steps:  100.0 MHz, 250 MHz, 500 MHz, 1000 MHz,
1.30 GHz, 1.54 GHz
  available cpufreq governors: conservative ondemand userspace
powersave performance schedutil
  current policy: frequency should be within 100.0 MHz and 1.54 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 250 MHz (asserted by call to kernel)

I did some simple stress testing and observed the freq scaling is
working fine when cpufreq governor is set to ondemand.

Powertop output.
            Package |            CPU 0
 100 MHz     5.2%   |  100 MHz     1.6%
 250 MHz     4.4%   |  250 MHz     4.3%
 500 MHz     2.6%   |  500 MHz     2.4%
1000 MHz     0.5%   | 1000 MHz     0.3%
1296 MHz     0.2%   | 1296 MHz     0.1%
1.54 GHz     0.2%   | 1.54 GHz     0.1%
Idle        86.9%   | Idle        91.2%

Here the output on the linaro's pm-qa testing for cpufreq.

[1] https://pastebin.com/h880WATn
Almost all the test case pass with this one as off now.

Best Regards
-Anand
