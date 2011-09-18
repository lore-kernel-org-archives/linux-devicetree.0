From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Appended devicetree with Torvalds' HEAD
Date: Sun, 18 Sep 2011 13:31:45 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1109181327000.20358@xanadu.home>
References: <CACRpkdb1iD2RkpmMkN1d5VNVr-M3KgrkE7Xg-Bxcr-xd2fcuPw@mail.gmail.com>
	<alpine.LFD.2.00.1109061347410.20358@xanadu.home>
	<20110913184207.GA20440@huya.qualcomm.com>
	<CACRpkdbvq2A_eJgCgq5JWgO-VDBd25D0qhrVTf9isnDxZ2k+4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-831886855-1316367107=:20358"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdbvq2A_eJgCgq5JWgO-VDBd25D0qhrVTf9isnDxZ2k+4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-831886855-1316367107=:20358
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, 18 Sep 2011, Linus Walleij wrote:

> On Tue, Sep 13, 2011 at 8:42 PM, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wr=
ote:
> > On Tue, Sep 06, 2011 at 01:52:43PM -0400, Nicolas Pitre wrote:
> >
> >> My latest patchset is here:
> >>
> >> =A0 git://git.linaro.org/people/nico/linux zImage_DTB_append
> >>
> >> I'm not fully satisfied to send them upstream yet though.
> >
> > These patches do appear to still work on MSM.
>=20
> Hm I wonder what is wrong on our end, probably our own fault :-/
>=20
> Arey you encapsulating the zImage+DTB in a uImage like I do
> (so as to use with elder U-Boot) or are you using some other
> method to get the zImage+DTB into the system?

What I do to thest it here is along those lines:

	make <whatever_foo_defconfig_you_want>
	make zImage
	cat foobar.dtb >> arch/arm/boot/zImage
	make uImage


Nicolas
--8323328-831886855-1316367107=:20358
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--8323328-831886855-1316367107=:20358--
