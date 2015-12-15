From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 3/5] soc: rockchip: add reboot notifier driver
Date: Tue, 15 Dec 2015 21:38:41 +0100
Message-ID: <15127971.1juVbocOjP@wuerfel>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <3759218.6sItdW65UG@wuerfel> <20151215174234.GB24031@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20151215174234.GB24031-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 15 December 2015 18:42:36 Thierry Reding wrote:
> On Tue, Dec 15, 2015 at 05:34:00PM +0100, Arnd Bergmann wrote:
> > On Tuesday 15 December 2015 17:31:22 Thierry Reding wrote:
> > > On Mon, Dec 14, 2015 at 12:39:44PM +0100, Arnd Bergmann wrote:
> > > > On Wednesday 18 November 2015 17:56:22 Andy Yan wrote:
> > > > > rockchip platform have a protocol to pass the kernel reboot
> > > > > mode to bootloader by some special registers when system reboot.
> > > > > By this way the bootloader can take different action according
> > > > > to the different kernel reboot mode, for example, command
> > > > > "reboot loader" will reboot the board to rockusb mode, this is
> > > > > a very convenient way to get the board enter download mode.
> > > > > 
> > > > > Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > > > 
> > > > Adding John Stultz to Cc
> > > > 
> > > > I just saw this thread pop up again, and had to think of John's recent
> > > > patch to unify this across platforms.
> > > > 
> > > > John, can you have a look at this driver too, and see how it fits in?
> > > > I think this is yet another variant, using an MMIO register rather than
> > > > RAM (as HTC / NVIDIA does) or SRAM (as Qualcomm does), but otherwise
> > > > it conceptually fits in with what you had.
> > > 
> > > FWIW, Tegra typically does use an MMIO register as well. See
> > > drivers/soc/tegra/pmc.c:tegra_pmc_restart_notify(). I don't know what
> > > HTC does, but if it's writing somewhere in RAM it isn't using the
> > > standard way of resetting the SoC. There's early boot ROM code which I
> > > think evaluates the PMC_SCRATCH0 register on Tegra to determine which
> > > mode to boot into. That's before even any firmware gets the chance of
> > > doing anything.


I just checked the android lollipop tree, and I could not find a pmc_restart_notify
function, only this file

https://android.googlesource.com/kernel/tegra/+/android-tegra-flounder-3.10-lollipop-release/drivers/htc_debug/stability/reboot_params.c

with the device that stores into RAM. It looks like HTC ported over
a driver that they were already using on some Qualcomm MSM8960 device,
as in 

https://gitlab.com/MaC/android_kernel_htc_msm8960/blob/859977fc723f59a6b707df1d70e80826ee1dccc4/arch/arm/mach-msm/htc/htc_restart_handler.c

On Android marshmallow (Flounder), that file again does not exist, and
I don't see how it's done.

> > HTC apparently uses a separate RAM area to pass the reboot reason,
> > and they have a driver to store that, which is separate from the
> > driver that they use for actually rebooting the machine.
> 
> I wasn't very clear, but the PMC_SCRATCH0 register is used to store the
> reset reason. It supports the recovery mode, which I think is really an
> Android thing, "bootloader" will typically cause the bootloader not to
> boot anything, and "forced-recovery" will go into a recovery mode that
> is used to bootstrap the device (usually by uploading a "miniloader"
> that initializes RAM, downloads a bootloader for booting or flashing an
> operating system, ...).
> 
> The write that resets the SoC is to a different register.

So is this scratch register interpreted by some maskrom code, or by code that
can be provided by the OEM?

	Arnd
