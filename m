From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 00/31] Armada 370/XP NAND support
Date: Sun, 10 Nov 2013 20:24:07 -0300
Message-ID: <20131110232406.GB15892@localhost>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383837455-30721-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Nikita Kiryanov <nikita-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, Nov 07, 2013 at 12:17:04PM -0300, Ezequiel Garcia wrote:
> Another version of the Armada 370/XP SoCs v3 patchset, addressing
> all the feedback provided by Brian Norris.
>=20
> Please see Documentation/mtd/nand/pxa3xx-nand.txt for specific detail=
s
> about the controller and the driver.
>=20
> Just as the last version, the bad block factory initial detection iss=
ue
> is not addressed by this patchset, but support for it will be added i=
n
> a near future once we decide the proper roadmap. See here the discuss=
ion
> about it:
>=20
>   http://permalink.gmane.org/gmane.linux.drivers.mtd/49401
>=20
> As usual patches 1-4, adding the clock infrastructure have already be=
en merged
> and will be dropped once this series can be based on v3.13-rc1.
> I'm including them just for completeness.
>=20
> Based in l2-mtd's master branch. Also, I've pushed a branch to our gi=
thub
> in case anyone wants to test it:
>=20
>   https://github.com/MISL-EBU-System-SW/mainline-public/tree/l2-mtd/u=
pstream-nand-v4
>=20
> As per Jason Cooper's suggestion I'm Ccing devicetree mailing list, t=
o get a review
> on the small binding changes this patchset contains. If the devicetre=
e people wants
> us to just Cc you on the relevant patches, just let us know.
>=20
> Of course, there's some room for improvements in this driver, and I'l=
l probably
> continue working on it. However, for now I'd like to focus in adding =
the strict
> minimum amount of changes required to support the new SoC family and =
pospone any
> improvements.
>=20

After some powering issues, I could boot my PXA3xx board (CM-X300 from
Compulab) and I've tested this patchset on it. In other words: no
regression on PXA! both DMA and non-DMA works.

Daniel: feel free to confirm my check, but it's no longer required,
in case you are too busy at the moment. I'll be able to test your
dmaengine work on this board, so feel free to Cc me on it.

Big thanks to Compulab for sending me the board, and specially
to Igor and Nikita!
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
