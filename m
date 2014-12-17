From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
Date: Tue, 16 Dec 2014 17:03:58 -0800
Message-ID: <20141217010358.GM9759@ld-irv-0074>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <20141130090853.GG3608@norris-Latitude-E6410>
 <548987D3.3060407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <548987D3.3060407-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yubingxu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 11, 2014 at 08:02:27PM +0800, Zhou Wang wrote:
> On 2014=E5=B9=B411=E6=9C=8830=E6=97=A5 17:08, Brian Norris wrote:
> >Have you tested on the MTD test modules (drivers/mtd/tests/*)? This =
is
> >important, as we seem to regularly get UBIFS bug reports from users
> >whose drivers have not even passed some of the simple tests.
> >
> >Also, it might be worth testing out the UBI tests found in the mtd-u=
tils
> >package.
>=20
> I have tested this NAND controller driver on the MTD test modules
> (drivers/mtd/tests/*). All tests passed except mtd_nandbiterrs.ko.
>=20
> Here is the test log for mtd_nandbiterrs:
> /home # insmod mtd_nandbiterrs.ko dev=3D2 page_offset=3D1 seed=3D110 =
mode=3D0
> [  100.484995]
> [  100.490082] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [  100.509657] mtd_nandbiterrs: MTD device: 2
> [  100.523413] mtd_nandbiterrs: MTD device size 8388608,
> eraseblock=3D131072, page=3D2048, oob=3D64
> [  100.551134] mtd_nandbiterrs: Device uses 2 subpages of 1024 bytes
> [  100.571585] mtd_nandbiterrs: Using page=3D1, offset=3D2048, eraseb=
lock=3D0
> [  104.431136] mtd_nandbiterrs: incremental biterrors test
> [  104.448872] mtd_nandbiterrs: write_page
> [  104.463193] mtd_nandbiterrs: rewrite page
> [  104.477620] mtd_nandbiterrs: read_page
> [  104.490898] mtd_nandbiterrs: verify_page
> [  104.504338] mtd_nandbiterrs: Successfully corrected 0 bit errors
> per subpage
> [  104.527985] mtd_nandbiterrs: Inserted biterror @ 0/5
> [  104.544673] mtd_nandbiterrs: Inserted biterror @ 1024/2
> [  104.562197] mtd_nandbiterrs: rewrite page
> [  104.576766] mtd_nandbiterrs: read_page
> [  104.590052] mtd_nandbiterrs: verify_page
> [  104.603252] mtd_nandbiterrs: Error: page offset 0, expected 23, go=
t 03
> [  104.625203] mtd_nandbiterrs: Error: page offset 1024, expected 06,=
 got 02
> [  104.648056] mtd_nandbiterrs: ECC failure, read data is incorrect
> despite read success
> insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
>=20
> The reason for above failure is that:
> In ECC mode, when rewriting page data to NAND flash, the NAND
> controller will also produce ECC code and write them to NAND flash
> as well. So when we read data from NAND flash, there is no need to
> correct the error bit. We read what we write to the flash.
>=20
> In mtd_nandbiterrs test, We call nand_write_page_raw indeed to perfor=
m
> rewrite operation. My question is that: in this NAND controller hardw=
are
> design, it is hard to implement hardware specific write_page_raw to
> write page data without producing ECC code, will this bring some bad
> effects somewhere? It will be very nice if you and anyone can give
> me some advice.

As of now, read_page_raw()/write_page_raw() are not required for any
normal operation. They are useful for debugging and testing though, wit=
h
tests like this one.

In the future, we might use read_page_raw() for implementing (optional)
software-based detection of blank/erased pages that have bitflips in
them -- i.e., all 0xff but with a few bitflips. See:

  http://lists.infradead.org/pipermail/linux-mtd/2014-December/056749.h=
tml
  http://article.gmane.org/gmane.linux.drivers.mtd/52183/

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
