From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
Date: Mon, 12 Jan 2015 20:17:01 -0800
Message-ID: <20150113041701.GM9759@ld-irv-0074>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <20141130090853.GG3608@norris-Latitude-E6410>
 <548987D3.3060407@gmail.com>
 <20141217062333.GD7112@brian-ubuntu>
 <5491638B.5090403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5491638B.5090403-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yubingxu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Iwo Mergler <Iwo.Mergler-/K5RfY/kUqoaXkdz0Xzl5EEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=46ollowing up on this last comment from last year's thread:

On Wed, Dec 17, 2014 at 07:05:47PM +0800, Zhou Wang wrote:
> On 2014=E5=B9=B412=E6=9C=8817=E6=97=A5 14:23, Brian Norris wrote:
[...]
> >>[  104.648056] mtd_nandbiterrs: ECC failure, read data is incorrect
> >>despite read success
> >>insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
> >>
> >>The reason for above failure is that:
> >>In ECC mode, when rewriting page data to NAND flash, the NAND
> >>controller will also produce ECC code and write them to NAND flash
> >>as well. So when we read data from NAND flash, there is no need to
> >>correct the error bit. We read what we write to the flash.
> >
> >BTW, your explanation doesn't seem quite right. The problem is that
> >even though mtd_read() didn't report errors, the data doesn't match
> >what's written. It's not that there was "no need to correct the erro=
r
> >bit".
>=20
> Maybe I did not express clearly. In the nandbiterrs test, firstly
> write data to flash with ECC code in oob area, then change some bits
> and rewrite data to flash with old ECC code in oob area, at last read
> data out with ECC to test if the "error bits" can be corrected. My
> explanation is that in rewriting process NAND controller also produce=
s
> new ECC code of the data and write both data and new ECC code to flas=
h.
> So in next step we will get what was writen without "correction".

But we should at least get an -EBADMSG return status, right? If you're
"rewriting" the data, this should result in two sets of data written on
top of each other, which (depending on the flash layout charecteristics=
)
might turn up as a kind of logical AND of all the data+OOB. This is
"probably" not correctable.

But that last "probably" leaves room for the possibility you mentioned,
I guess; that the ECC code is just correcting the data to look like the
second set of (intentionally) erroneous data.

> >I'd recommend digging a little more to figure out what's wrong here.=
 You
> >might need to instrument the nandbiterrs test. This is possibly
>=20
> Thanks, I will do it.
>=20
> >highlighting a driver bug [1].
> >
> >Brian
> >
> >[1] Besised simply that you didn't implement write_page_raw(). The
> >default nand_write_page_raw() implementation looks just like your
> >non-raw version.
>=20
> Yes. In ECC mode, as the NAND controller must write page as a whole
> with ECC code, the default nand_write_page_raw() looks just like
> non-raw version.

Are you saying you cannot implement the raw() hooks for this IP? Or jus=
t
that you haven't yet? The latter is probably OK for now (I'd recommend
doing this, or at least mark a TODO in the code), but the former is a
little disturbing.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
