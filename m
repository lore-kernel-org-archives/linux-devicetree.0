From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V8 1/2] clocksource: add gx6605s SOC system timer
Date: Fri, 21 Sep 2018 19:24:43 +0800
Message-ID: <20180921112443.GA17701@guoren>
References: <cover.1537412072.git.ren_guo@c-sky.com>
 <4d409a1fdecf1c376e8cc6b55308cd3c522047b0.1537412072.git.ren_guo@c-sky.com>
 <6c31f9b2-d536-1cee-8024-b52eb862fd9d@linaro.org>
 <20180920233103.GA8891@guoren-Inspiron-7460>
 <271900ce-0019-b96d-7833-4ea5ae0721a6@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <271900ce-0019-b96d-7833-4ea5ae0721a6@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, c-sky_gcc_upstream@c-sky.com, green.hu@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 21, 2018 at 01:57:27AM +0200, Daniel Lezcano wrote:
> On 21/09/2018 01:31, Guo Ren wrote:
> > On Thu, Sep 20, 2018 at 06:06:19PM +0200, Daniel Lezcano wrote:
> >> On 20/09/2018 10:03, Guo Ren wrote:
> >>> Changelog:
> >>>  - Add License and Copyright
> >>>  - Use timer-of framework
> >>>  - Change name with upstream feedback
> >>>  - Use clksource_mmio framework
> >>>
> >>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> >>> ---
> >>>  drivers/clocksource/Kconfig         |   8 ++
> >>>  drivers/clocksource/Makefile        |   1 +
> >>>  drivers/clocksource/timer-gx6605s.c | 150 ++++++++++++++++++++++++++++++++++++
> >>>  3 files changed, 159 insertions(+)
> >>>  create mode 100644 drivers/clocksource/timer-gx6605s.c
> >>>
> >>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> >>> index a11f4ba..6d0f18d 100644
> >>> --- a/drivers/clocksource/Kconfig
> >>> +++ b/drivers/clocksource/Kconfig
> >>> @@ -620,4 +620,12 @@ config RISCV_TIMER
> >>>  	  is accessed via both the SBI and the rdcycle instruction.  This is
> >>>  	  required for all RISC-V systems.
> >>>  
> >>> +config GX6605S_TIMER
> >>> +	bool "Gx6605s SOC system timer driver"
> >>> +	depends on CSKY
> >>> +	select CLKSRC_MMIO
> >>> +	select TIMER_OF
> >>> +	help
> >>> +	  This option enables support for gx6605s SOC's timer.
> >>> +
> >>>  endmenu
> >>
> >> Please make the option not visible as default. There are currently two
> >> approaches look at MTK_TIMER and SPRD_TIMER.
> > Em ... (ot sure why COMPILE_TEST?):
> > 	bool "Gx6605s SOC system timer driver" if COMPILE_TEST
> > Hmm?
> 
> Because by enabling the COMPILE_TEST, you give the opportunity to
> someone without the hardware to cross-compile test your driver and catch
> errors very soon before the changes hit your tree.
> 
> There are several Continuous Integration loop around running the latest
> changes in the kernel (kernelci, 01.org, etc ...) and all drivers with
> this flag are compiled tested.
> 
> If the option is not set, the timer is silently selected by your
> platform's Kconfig only, without giving the opportunity to an non-expert
> user to unselect the timer leading to, maybe, an unbootable board.
> 
I got it, thx for the reply.

Best Regards
 Guo Ren
