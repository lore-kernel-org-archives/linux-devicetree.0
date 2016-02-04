From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 10/11] ARM: dts: sun9i: a80-optimus: Disable
 dummy regulators vcc3v0, vcc3v3, vcc5v0
Date: Thu, 4 Feb 2016 17:44:38 +0100
Message-ID: <20160204164438.GJ4270@lukather>
References: <1454408864-24112-1-git-send-email-wens@csie.org>
 <1454408864-24112-11-git-send-email-wens@csie.org>
 <20160202162136.GX4652@lukather>
 <CAGb2v66xjgsoVEBocUfDk6DDx4QcH-4pP94v+4FHLTJ=rii09Q@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I/5syFLg1Ed7r+1G"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBE56Z22QKGQEJBRWHPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66xjgsoVEBocUfDk6DDx4QcH-4pP94v+4FHLTJ=rii09Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--I/5syFLg1Ed7r+1G
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Feb 03, 2016 at 12:41:37AM +0800, Chen-Yu Tsai wrote:
> On Wed, Feb 3, 2016 at 12:21 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi,
> >
> > On Tue, Feb 02, 2016 at 06:27:43PM +0800, Chen-Yu Tsai wrote:
> >> These 3 regulators are provided in sunxi-common-regulators.dtsi.
> >> 3.0V/3.3V and 5.0V are commonly used voltages in Allwinner devices.
> >> These dummy regulators provide a stand-in when bindings that require
> >> one, but the real regulator is not supported yet.
> >>
> >> Since these are no longer needed, we can disable them.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >
> > Why not remove the include entirely then?
> 
> reg_vbus* are still used. Or should we move them as well?

I think so yeah. It's totally fine to disable per-boards regulators.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--I/5syFLg1Ed7r+1G--
