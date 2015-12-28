From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 3/5] soc: rockchip: add reboot notifier driver
Date: Mon, 28 Dec 2015 16:35:46 +0100
Message-ID: <2250962.OgUpqMgY4k@wuerfel>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <15127971.1juVbocOjP@wuerfel> <20151228092054.GA29195@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20151228092054.GA29195-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
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

On Monday 28 December 2015 10:20:56 Thierry Reding wrote:
> > > > HTC apparently uses a separate RAM area to pass the reboot reason,
> > > > and they have a driver to store that, which is separate from the
> > > > driver that they use for actually rebooting the machine.
> > > 
> > > I wasn't very clear, but the PMC_SCRATCH0 register is used to store the
> > > reset reason. It supports the recovery mode, which I think is really an
> > > Android thing, "bootloader" will typically cause the bootloader not to
> > > boot anything, and "forced-recovery" will go into a recovery mode that
> > > is used to bootstrap the device (usually by uploading a "miniloader"
> > > that initializes RAM, downloads a bootloader for booting or flashing an
> > > operating system, ...).
> > > 
> > > The write that resets the SoC is to a different register.
> > 
> > So is this scratch register interpreted by some maskrom code, or by code that
> > can be provided by the OEM?
> 
> My understanding is that its interpreted both by what's called BootROM
> on Tegra (I guess that's what you call "maskrom code") and the system's
> bootloader. The BootROM cannot typically be replaced by the OEM, but it
> is quite typical for the bootloader to differ between devices.

Ok, so not maskrom (which would not be OEM specific, but hardcoded for
the chip) but rather some form of PROM. This means we can only guess
that all OEMs use the same protocol but in theory someone could have
implemented an incompatible BootROM, but it's also possible that HTC
just ignore the register entirely and implement the same thing separately.

> The BootROM will interpret a subset of the bits in that register. Most
> notable the "force recovery" bit. That will cause the BootROM to go into
> a mode which can be used to bootstrap the device. It implements a simple
> protocol (RCM) which can be used to upload a loader (usually referred to
> as mini-loader) to the device's IRAM which in turn will initialize the
> memory and which can download a proper bootloader (such as U-Boot) to
> memory using a slightly more complex protocol (the standard protocol is
> called nv3p, but the particular choice of protocol no longer matters at
> this point).
> 
> The bootloader can also access this register and will interpret the
> "bootloader" and "recovery" bits. On the, argueably small, sample of
> Android devices I've worked with, the "bootloader" bit will make the
> bootloader go into fastboot mode, whereas the "recovery" bit will make
> it initiate the RCK mode, which is used to update through OTA.
> 
> There are a couple of other bits in this register, but they are badly
> documented and don't seem to relate to reboot.

Ok.

	Arnd
