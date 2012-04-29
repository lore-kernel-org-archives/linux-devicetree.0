From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 00/10] allow mxc_nand to be probed via device tree
Date: Sun, 29 Apr 2012 11:27:01 +0200
Message-ID: <20120429092701.GS20039@pengutronix.de>
References: <20120423092240.GA18013@pengutronix.de>
 <1335615654.1937.20.camel@koala>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335615654.1937.20.camel@koala>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Artem,

On Sat, Apr 28, 2012 at 03:20:54PM +0300, Artem Bityutskiy wrote:
> On Mon, 2012-04-23 at 11:22 +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> > =

> > this series aims to be able to probe mxc_nand devices via device tree.
> > Most of its patches reorganize the driver to only use cpu_is_mxYZ for
> > the case that the device is not probed via device tree.
> > =

> > I split this conversion in several patches to allow easier review. IMHO
> > it makes sense to keep this splitting for an eventual bisection.
> > =

> > This is tested on an i.MX27 based machine and works fine including
> > passing of partition data.
> =

> Applied all 11 patches from your git tree to l2-mtd.git. Note, you have
> one checkpatch.pl warning:
> =

> WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probabl=
y be static const char * const
> #69: FILE: drivers/mtd/nand/mxc_nand.c:274:
> +static const char *part_probes[] =3D { "RedBoot", "cmdlinepart", "ofpart=
", NULL };
I noticed that, too. This is not new though and as
mtd_device_parse_register takes a const char **types applying
checkpatch's advice would yield another warning. But probably fixing
both would work. I wouldn't address this as part of this series.

> Also there are still several sparse warnings, e.g.
> =

> +drivers/mtd/nand/mxc_nand.c:1249:26: warning: incorrect type in initiali=
zer (different modifiers) [sparse]
> +drivers/mtd/nand/mxc_nand.c:1249:26:    expected void *data [sparse]
> +drivers/mtd/nand/mxc_nand.c:1249:26:    got struct mxc_nand_devtype_data=
 static const [toplevel] *<noident> [sparse]
> =

> And you added few gcc warnings, e.g.:
> =

> +drivers/mtd/nand/mxc_nand.c:1252:3: warning: initialization discards 'co=
nst' qualifier from pointer target type [enabled by default]
This is the same problem, i.e. casting away several consts. Hmm, and for
me neither gcc nor sparse provide that warning but I wonder why. At some
point I saw this warning, so I sent a patch:

http://mid.gmane.org/1335171381-24869-1-git-send-email-u.kleine-koenig@peng=
utronix.de

(I developed my series on top of that and rebased on linus/master for
posting.) Sparse only tells me:

	include/asm-generic/bitops/ffs.h:19:23: warning: right shift by bigger tha=
n source value

(using gcc 4.3.2 and sparse (from Debian) 0.4.3+20110419-1)

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
