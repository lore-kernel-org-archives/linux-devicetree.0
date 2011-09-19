From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Appended devicetree with Torvalds' HEAD
Date: Mon, 19 Sep 2011 11:04:23 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1109191102080.20358@xanadu.home>
References: <CACRpkdb1iD2RkpmMkN1d5VNVr-M3KgrkE7Xg-Bxcr-xd2fcuPw@mail.gmail.com>
	<alpine.LFD.2.00.1109061347410.20358@xanadu.home>
	<20110913184207.GA20440@huya.qualcomm.com>
	<CACRpkdbvq2A_eJgCgq5JWgO-VDBd25D0qhrVTf9isnDxZ2k+4g@mail.gmail.com>
	<alpine.LFD.2.00.1109181327000.20358@xanadu.home>
	<CACRpkdZ9K8swOz_SS8LZnXrAUMWis1H5+vifsN3V82eoPhReCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-493788671-1316444664=:20358"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdZ9K8swOz_SS8LZnXrAUMWis1H5+vifsN3V82eoPhReCw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--8323328-493788671-1316444664=:20358
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Sep 2011, Linus Walleij wrote:

> On Sun, Sep 18, 2011 at 7:31 PM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm5QFI55V6+gNQ@public.gmane.org=
g> wrote:
>=20
> > What I do to thest it here is along those lines:
> >
> > =A0 =A0 =A0 =A0make <whatever_foo_defconfig_you_want>
> > =A0 =A0 =A0 =A0make zImage
> > =A0 =A0 =A0 =A0cat foobar.dtb >> arch/arm/boot/zImage
> > =A0 =A0 =A0 =A0make uImage
>=20
> BTW this sequence does not work, and that is why I wrote the patch
> attaching the DTB from a specified file in the first place.

I tell you it works.  You need my full patch series (which is in RMK's=20
devel-stable now).

> After you have issued "cat foobar.dtb >> arch/arm/boot/zImage"
> and you issue "make uImage" the zImage is rebuilt and
> overwrites your zImage, since the timestamp changes.

The zImage timestamp changes to a later time, so there is no reason for=20
it to be rebuilt as its dependencies still are older.  A separate issue=20
caused it to be rebuilt all the time, but I included a patch to fix=20
that.


Nicolas
--8323328-493788671-1316444664=:20358
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--8323328-493788671-1316444664=:20358--
