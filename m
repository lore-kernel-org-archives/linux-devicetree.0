From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [resend PATCH v3 4/4] usb: phy: add phy-hi6220-usb
Date: Mon, 23 Feb 2015 09:30:19 -0600
Message-ID: <20150223153019.GE32701@saruman.tx.rr.com>
References: <1423559404-13058-1-git-send-email-zhangfei.gao@linaro.org>
 <1423559404-13058-5-git-send-email-zhangfei.gao@linaro.org>
 <20150210144807.GC16711@saruman.tx.rr.com>
 <BN3PR0301MB0849FB28B1DAF7BEB5F3BE7881250@BN3PR0301MB0849.namprd03.prod.outlook.com>
 <20150211091031.GR16955@sapphire.tkos.co.il>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150211091031.GR16955-MwjkAAnuF3khR1HGirfZ1z4kX+cae0hd@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2015 at 11:10:31AM +0200, Baruch Siach wrote:
> Hi Peter, Felipe,
>=20
> > > new drivers only on drivers/phy/, sorry.
> >=20
> > This driver has many USB dependencies, like otg, gadget. I don't know it
> > can use generic phy currently.
>=20
> I would like to remind you the thread at=20
> http://thread.gmane.org/gmane.linux.kernel/1858137. I have a USB PHY driv=
er=20
> here that depends on notify_connect/notify_disconnect, which are not curr=
ently=20
> provided by the generic phy infrastructure (drivers/phy/). What would be=
=20
> acceptable solution for this case?

work with Kishon (generic phy maintainer) to add missing pieces you
need.

--=20
balbi

--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU60eLAAoJEIaOsuA1yqREK+EP/A06rIlrMHhI4sWz8lQDLckp
NNfCscitZp78y5DZq/mGDWXPv301e6HVVXuIJvwwp4T8+uc8W4gKGmYA1n62Bt/O
vUk9vCfDn0/byo8qGptoB82fq8zx/DbXlIhmpyWEmjDGLovgIPkqfy+2mJWXuqCE
R1rzKDKGQpqX9XBiSSvjXsTmjcLtXyAwsAgggN1IKP/T/8YesCNPpZ2rAHVzNT27
i13ZFveDlFcfPHg1UX5Nr4cW6n2rRRmLbGB07RY5c2MCQ1YWmZgsT3UAFN0G37a0
bnbOMkCk2hoGyEMS8bH1ftYTtrWaoIG9+AmPbRAlhSL43Z8ggusb+E6eibHfm+U8
IVmB+pYefuhcbpWSOxna9t8HFXFlFrqiVijcJG7r5gxhIM7AYEtAZ1pmU5cpYiA5
A8YJxrW5pyYbg7MOmd+wINDoF3/s8A7MZqja/d4GKyvOzxMxIp/rfZTDfYySUufM
5rjoT8YEJniZVtbhHv5UEiDhE4PbuXQngJ9pphxyPQMoNk19JizzQQMXEz2KRWks
jGiTBng3eytMFujx/qD0UDBITuYhroT6qa/GxQ8z9KYJJLT9O8xAgFCem9FK1CLO
q8y3wr2mJlYJEtGI/QgEXlEWWN4be7OGiRJM6DJYX6hSOt/ASAG9KFW8OdrkFUyN
O08NwHE1/1FFc8cGEggs
=UkOA
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
