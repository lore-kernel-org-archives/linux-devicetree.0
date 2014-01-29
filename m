From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH v2 08/14] mtd: nand: add sunxi NAND
 flash controller support
Date: Wed, 29 Jan 2014 15:46:20 -0300
Message-ID: <20140129184619.GC27143@localhost>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
 <1391006064-28890-9-git-send-email-b.brezillon.dev@gmail.com>
 <20140129175641.GF1427@obsidianresearch.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDO2JZM64ELRBA4ZUWLQKGQECA3U3WY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140129175641.GF1427-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 29, 2014 at 10:56:42AM -0700, Jason Gunthorpe wrote:
> On Wed, Jan 29, 2014 at 03:34:18PM +0100, Boris BREZILLON wrote:
>=20
> [..]
>=20
> > +static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *=
nfc,
> [..]
> > +       ret =3D sunxi_nand_chip_init_timings(chip, np);
> > +       if (ret)
> > +               return ret;
> [..]
> > +       ret =3D nand_scan_ident(mtd, nsels, NULL);
>=20
> This ordering looks a bit problematic, will onfi_get_async_timing_mode
> ever return anything other than ONFI_TIMING_MODE_UNKNOWN if it is
> called before nand_scan_ident ? What sets clk_rate to non-zero if there
> is no DT property?
>=20
> For a flow that uses onfi_get_async_timing_mode rather than DT the
> driver should set the interface to timing mode 0 (slowest) and then
> call nand_scan_ident, and then reset the interface to the detected
> timing mode.
>=20

Yes. And I believe this is a requirement from the ONFI 2.1 spec:

"""
4.1.4.3. Source Synchronous to Asynchronous
[..]

The host shall transition to the asynchronous data interface. Then the
host shall issue the Reset (FFh) command described in the previous paragrap=
h
using asynchronous timing mode 0, thus the host transitions to the asynchro=
nous
data interface prior to issuing the Reset (FFh). A device in any timing mod=
e is
required to recognize a Reset (FFh) command issued in asynchronous timing
mode 0.

[..]

After CE# has been pulled high and then transitioned low again, the host
should issue a Set Features to select the appropriate asynchronous timing m=
ode.
"""

--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
