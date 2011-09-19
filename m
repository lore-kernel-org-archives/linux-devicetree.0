From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Appended devicetree with Torvalds' HEAD
Date: Mon, 19 Sep 2011 09:48:23 +0200
Message-ID: <CACRpkdZ9K8swOz_SS8LZnXrAUMWis1H5+vifsN3V82eoPhReCw@mail.gmail.com>
References: <CACRpkdb1iD2RkpmMkN1d5VNVr-M3KgrkE7Xg-Bxcr-xd2fcuPw@mail.gmail.com>
	<alpine.LFD.2.00.1109061347410.20358@xanadu.home>
	<20110913184207.GA20440@huya.qualcomm.com>
	<CACRpkdbvq2A_eJgCgq5JWgO-VDBd25D0qhrVTf9isnDxZ2k+4g@mail.gmail.com>
	<alpine.LFD.2.00.1109181327000.20358@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1109181327000.20358-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 18, 2011 at 7:31 PM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> w=
rote:

> What I do to thest it here is along those lines:
>
> =A0 =A0 =A0 =A0make <whatever_foo_defconfig_you_want>
> =A0 =A0 =A0 =A0make zImage
> =A0 =A0 =A0 =A0cat foobar.dtb >> arch/arm/boot/zImage
> =A0 =A0 =A0 =A0make uImage

BTW this sequence does not work, and that is why I wrote the patch
attaching the DTB from a specified file in the first place.

After you have issued "cat foobar.dtb >> arch/arm/boot/zImage"
and you issue "make uImage" the zImage is rebuilt and
overwrites your zImage, since the timestamp changes.

So they mkimage command creating the uImage has to be
issued outside of the kernel build with

mkimage <various parameters> zImage uImage

Which is very inconvenient, but as I understood it, this was
intended.

Just making sure it is as inconvenient as you'd want it, and not
overly inconvenient...

For testing uImage I'm using my patch, of course, it's the easiest
way to get a uImage with attached device tree out. I guess
most people wanting to use uImages with attached trees will
use that out-of-tree patch too...

Linus Walleij
