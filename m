From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing-djzkFPsfvsizQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: meson8b: add reserved memory zone to fix
 silent freezes
Date: Sat, 28 Oct 2017 22:27:30 +0200
Message-ID: <20171028202730.GO2750@otheros>
References: <20171002155903.19511-1-linus.luessing@c0d3.blue>
 <CAFBinCCde249b0o9aKMErEbKznM7UQrg1FzhLQ2whej0x_XLAg@mail.gmail.com>
 <20171002234755.GA18646@ingrassia.epigenesys.com>
 <20171003072703.GY6726@otheros>
 <20171003082310.GA15501@ingrassia.epigenesys.com>
 <20171003105427.GZ6726@otheros>
 <20171004201645.GA23053@ingrassia.epigenesys.com>
 <20171023074721.GB2049@otheros>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171023074721.GB2049@otheros>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Emiliano Ingrassia <ingrassia-rBIjXPeIPFWU+1/U8MakDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 23, 2017 at 09:47:21AM +0200, Linus Lüssing wrote:
> I'm currently continuing to bisect which difference in Emiliano's
> and my kernel image makes mine boot successfully but not
> Emiliano's. (And I'm continuing reading and testing with the
> filter-range option to better understand what it's presence - or
> absence - does exactly)

I found the difference between Emiliano's and my kernel image and
could narrow it down to this particular difference via bisecting:

Using the multi_v7_defconfig target, but with the following
two options unselected:

* System Type
  -> Qualcomm Support
     - Enable support for MSM8X60 (disabled)
     - Enable support for MSM8960 (disabled)

Results in the following diff, according to ./scripts/diffconfig:

-CLKSRC_QCOM y
-MSM_IOMMU n
 ARCH_MSM8960 y -> n
 ARCH_MSM8X60 y -> n

Once this is unselected, the kernel hangs for me on boot, too.
Both with or without this 2MB reserved memory region patch.

Removing the "arm,filter-ranges" as tried by Emiliano makes it
boot again.

Finally, what also helps booting again is this diff from the
pending SMP support patch series from Carlo/Martin [0]:

~~~~~
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 47d3a1ab08d2..82faa958ab88 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -147,6 +147,7 @@  textofs-$(CONFIG_SA1111) := 0x00208000
 endif
 textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
 textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
+textofs-$(CONFIG_ARCH_MESON) := 0x00208000
 textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
 
 # Machine directory name.  This list is sorted alphanumerically
~~~~~

Note the $(CONFIG_ARCH_MSM8X60) and $(CONFIG_ARCH_MSM8960) just
above. Sounds familiar :-)?

With this textofs diff alone, stress-ng still hangs though. Only
with the 2MB memory zone reserved via DT or the "arm,filter-ranges"
removed, stress-ng succeeds, too.

Regards, Linus

[0]: "[v7,4/6] ARM: meson: Add SMP bringup code for Meson8 and Meson8b"
     -> https://patchwork.kernel.org/patch/9954935/


On Mon, Oct 23, 2017 at 09:47:21AM +0200, Linus Lüssing wrote:
> Subject: Re: [PATCH] ARM: dts: meson8b: add reserved memory zone to fix silent freezes
> To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Emiliano Ingrassia <ingrassia-rBIjXPeIPFWU+1/U8MakDg@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> 
> Hi Kevin,
> 
> Just wanted to let you know that Emiliano and I are currently
> debugging further off-list.
> 
> So far I can reproduce that:
> 
> a) For the binary kernel image Emiliano sent me I can reproduce
> his hang ups during boot on my Odroid C1+.
> b) The 2MB reserved memory region this patch adds does not help
> for this image.
> c) Removing the "arm,filter-range" as proposed by Emiliano back
> then instead of adding this reserved memory zone fixes my freezes
> during boot in Emiliano's image and during stress-ng for my kernel
> image, too.
> 
> I'm currently continuing to bisect which difference in Emiliano's
> and my kernel image makes mine boot successfully but not
> Emiliano's. (And I'm continuing reading and testing with the
> filter-range option to better understand what it's presence - or
> absence - does exactly)
> 
> 
> If these observations ring a bell for anyone here, I'd be curious
> to hear what they think.
> 
> Regards, Linus
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
