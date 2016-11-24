From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: Re: [RFC PATCH 0/5] arm64: Allwinner H5 support
Date: Thu, 24 Nov 2016 17:03:46 +0000
Message-ID: <1480007026.4509.69.camel@hellion.org.uk>
References: <1479950235-26821-1-git-send-email-andre.przywara@arm.com>
	 <20161124105958.xzp4fr2fs4p42upx@lukather>
	 <560f873c-7ad9-5614-21f6-489879380ebe@arm.com>
Reply-To: ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBC4Y5F6PT4PBB6F23TAQKGQER5YIQWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <560f873c-7ad9-5614-21f6-489879380ebe-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: andre.przywara-5wv7dgnIgG8@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-11-24 at 11:05 +0000, Andre Przywara wrote:
>=20
> > I don't have any major comments but I guess it all depends on the DT
> > maintainers view on the symbolic link to share the DTSI.
>=20
> I am curious too ;-)
> But I saw symlinks for the RaspberryPi 3 (check
> arch/arm64/boot/dts/broadcom) and VExpress, so I picked that low hanging
> fruit ;-)

See http://git.kernel.org/torvalds/linux/c/8ee57b8182c4=C2=A0and the ML
discussion around the posting of that for some background on why the
symlinks are being used in preference to #include or /include/.

IIRC there was some further discussion on some lists when=C2=A0http://git.k=
e
rnel.org/torvalds/linux/c/76aa75916880=C2=A0was posted too.

Ian.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
