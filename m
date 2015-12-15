From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 3/5] soc: rockchip: add reboot notifier driver
Date: Tue, 15 Dec 2015 18:27:07 +0100
Message-ID: <1501971.Yf5m5Xb3Zg@diego>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com> <20151215163120.GA24031@ulmo.nvidia.com> <3759218.6sItdW65UG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3759218.6sItdW65UG@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 15. Dezember 2015, 17:34:00 schrieb Arnd Bergmann:
> On Tuesday 15 December 2015 17:31:22 Thierry Reding wrote:
> > On Mon, Dec 14, 2015 at 12:39:44PM +0100, Arnd Bergmann wrote:
> > > On Wednesday 18 November 2015 17:56:22 Andy Yan wrote:
> > > > rockchip platform have a protocol to pass the kernel reboot
> > > > mode to bootloader by some special registers when system reboot.
> > > > By this way the bootloader can take different action according
> > > > to the different kernel reboot mode, for example, command
> > > > "reboot loader" will reboot the board to rockusb mode, this is
> > > > a very convenient way to get the board enter download mode.
> > > > 
> > > > Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > > 
> > > Adding John Stultz to Cc
> > > 
> > > I just saw this thread pop up again, and had to think of John's recent
> > > patch to unify this across platforms.
> > > 
> > > John, can you have a look at this driver too, and see how it fits in?
> > > I think this is yet another variant, using an MMIO register rather than
> > > RAM (as HTC / NVIDIA does) or SRAM (as Qualcomm does), but otherwise
> > > it conceptually fits in with what you had.
> > 
> > FWIW, Tegra typically does use an MMIO register as well. See
> > drivers/soc/tegra/pmc.c:tegra_pmc_restart_notify(). I don't know what
> > HTC does, but if it's writing somewhere in RAM it isn't using the
> > standard way of resetting the SoC. There's early boot ROM code which I
> > think evaluates the PMC_SCRATCH0 register on Tegra to determine which
> > mode to boot into. That's before even any firmware gets the chance of
> > doing anything.
> 
> HTC apparently uses a separate RAM area to pass the reboot reason,
> and they have a driver to store that, which is separate from the
> driver that they use for actually rebooting the machine.

same on Rockchip. The general restart handling doesn't care about any reason, 
it is merely an agreement between kernel and bootloader to store a reason 
value in some reboot-safe register of the soc.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
