From: =?iso-8859-1?Q?T=FCrk=2C_Jan?= <Jan.Tuerk@emtrion.de>
Subject: AW: [PATCH v4 0/7] Add basic support for emtrion emCON-MX6 modules
Date: Thu, 3 May 2018 12:01:38 +0200
Message-ID: <95F51F4B902CAC40AF459205F6322F01B83109E5C4@BMK019S01.emtrion.local>
References: <20180420125108.14197-1-jan.tuerk@emtrion.com>
 <20180427132445.3458-1-jan.tuerk@emtrion.com> <20180428023445.GA3693@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180428023445.GA3693@dragon>
Content-Language: de-DE
Sender: linux-kernel-owner@vger.kernel.org
To: 'Shawn Guo' <shawnguo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, LinuxArmKernelMailingListe <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Ursprüngliche Nachricht-----
> Von: Shawn Guo [mailto:shawnguo@kernel.org]
> Gesendet: Samstag, 28. April 2018 04:35
> An: Türk, Jan
> Cc: Rob Herring; Mark Rutland; Thierry Reding; David Airlie; Sascha Hauer;
> Pengutronix Kernel Team; Fabio Estevam; Russell King;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; dri-
> devel@lists.freedesktop.org; LinuxArmKernelMailingListe
> Betreff: Re: [PATCH v4 0/7] Add basic support for emtrion emCON-MX6
> modules
> 
> On Fri, Apr 27, 2018 at 03:24:35PM +0200, jan.tuerk@emtrion.com wrote:
> > From: Jan Tuerk <jan.tuerk@emtrion.com>
> >
> > Changes for v4:
> >   - re-arrange the Patch-series to match the DT-submitting-patches
> >   - Additional patch for the Documentation of the new DT-bindings
> >
> > [PATCH v4 1/7] dt-bindings: display: Document the EDT et* displays in one
> file.
> >   - no change (re-arranged 3/6 => 1/7)
> >
> > [PATCH v4 2/7] drm/panel: Add support for the EDT ETM0700G0BDH6
> >   - no change (re-arranged 1/6 => 2/7)
> >
> > [PATCH v4 3/7] drm/panel: Add support for the EDT ETM0700G0EDH6
> >   - no change (re-arranged 2/6 => 3/7)
> 
> Please split the series into two, DRM driver (above) and platform part
> (below), to avoid posting one part over and over again with zero changes,
> but only because the other part needs update.
> 
> Shawn
Ok I'll split them. 
> 
> >
> > [PATCH v4 4/7] ARM: dts: imx: Add an cpu0 label for imx6dl devices.
> >   - no change
> >
> > [PATCH v4 5/7] dt-bindings: arm: Document emtrion emCON-MX6 bindings
> >   - separate patch for the emtrion emCON-MX6 DT-bindings
> >
> > [PATCH v4 6/7] ARM: dts: Add support for emtrion emCON-MX6 series
> >   - alphabetically sort the DT
> >   - moved duplicated Avari baseboard code into separate file.
> >
> > [PATCH v4 7/7] ARM: imx_v6_v7_defconfig: Enable DA0963 PMIC support.
> >   - unchaged
