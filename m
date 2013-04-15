From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] video: imxfb: Add DT support
Date: Mon, 15 Apr 2013 21:47:38 +0200
Message-ID: <20130415194738.GE1906@pengutronix.de>
References: <1365157876-1757-1-git-send-email-mpa@pengutronix.de>
 <1365157876-1757-3-git-send-email-mpa@pengutronix.de>
 <20130408075742.GR20693@game.jcrosoft.org>
 <20130414143132.GD27394@pengutronix.de>
 <20130415124321.GB15139@game.jcrosoft.org>
 <20130415151316.4d49e9b2@e6520eb>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130415151316.4d49e9b2@e6520eb>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Eric =?iso-8859-15?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Tobias Schandinat <FlorianSchandinat-Mmb7MZpHnFY@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 15, 2013 at 03:13:16PM +0200, Eric B=E9nard wrote:
> Hi,
> =

> =

> I didn't follow the thread but dmacr is not specific to our boards :
> $ grep -rn dmacr arch/arm/mach-imx/
> arch/arm/mach-imx/mach-mx27_3ds.c:446:	.dmacr		=3D 0x00020010,
> arch/arm/mach-imx/mach-mx21ads.c:231:	.dmacr		=3D 0x00020008,
> arch/arm/mach-imx/mach-mxt_td60.c:210:	.dmacr		=3D 0x00020010,
> arch/arm/mach-imx/eukrea_mbimx27-baseboard.c:192:	.dmacr		=3D 0x00040060,
> arch/arm/mach-imx/eukrea_mbimxsd25-baseboard.c:165:	.dmacr		=3D 0x0004006=
0,
> arch/arm/mach-imx/mach-mx27ads.c:241:	.dmacr		=3D 0x00020010,
> arch/arm/mach-imx/mach-pca100.c:351:	.dmacr		=3D 0x00020010,
> arch/arm/mach-imx/pcm970-baseboard.c:185:	.dmacr		=3D 0x00020010,
> arch/arm/mach-imx/mach-mx25_3ds.c:173:	.dmacr		=3D 0x00020010,

The reference manual has this about the dmacr register:

The dynamic mode is recommend, and also the TM and HM reset value are
recommend in the dynamic mode. The same recommendation is for the
graphic DMA control.

So maybe we should ask whether the boards really have to change this
value or if the reset value is suitable for all.

Sascha

-- =

Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
