From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: dts: sama5d3/sama5d4: reduce NFC command
 registers memory region
Date: Thu, 15 Jan 2015 11:05:01 +0100
Message-ID: <20150115110501.53b4584c@bbrezillon>
References: <1421305683-8739-1-git-send-email-josh.wu@atmel.com>
	<20150115094527.3fde882a@bbrezillon>
	<54B78F73.9000504@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B78F73.9000504-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Josh,

On Thu, 15 Jan 2015 17:59:15 +0800
Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:

> Hi=EF=BC=8C Boris
>=20
> Thanks for the review.
>=20
> On 1/15/2015 4:45 PM, Boris Brezillon wrote:
> > Hi Josh,
> >
> > On Thu, 15 Jan 2015 15:08:03 +0800
> > Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
> >
> >> To get NFC status, we need to read the NFC command registers, whic=
h is a
> >> 256M memory mapping address. To check the status, you just read su=
ch
> >> address from NFC command registers.
> >> For example, to check NFCBUSY (bit 27), you need to read 0x0800000=
0
> >> (bit 27 is set to 1) of the NFC command register.
> >> If you want to check NFCBUSY (bit 27) and NFCWR (bit 26) in same t=
ime,
> >> you need to read 0x0c000000 (bit 27 and bit 26 are set to 1).
> > Are NFCBUSY and NFCWR found in NFCDATA_STATUS and those found in HS=
MC_SR
> > representing the same thing.
> yes. it is. I just check with IP team. The NFCBUSY of NFCDATA_STATUS =
is=20
> also refer to NFC_BUSY of HSMC_SR.
>=20
> > If they are, I think you can just use HSMC_SR instead of NFCDATA_ST=
ATUS
> > to check the status [1] and drop the last bit in the NFC Command
> > Resgiters range.
> Thank you. your code works (just need some typo change).
> I want to send [1] code with your signed-off and my acked to mtd list=
=2E
> Is it okay for you?

Sure, no problem.



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
