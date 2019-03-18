From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/6] nvmem: sunxi_sid: Read out data in
 native format
Date: Mon, 18 Mar 2019 09:57:51 +0100
Message-ID: <20190318085751.kziqzxnadtho4kdb@flea>
References: <20190318073354.12151-1-wens@kernel.org>
 <20190318073354.12151-5-wens@kernel.org>
 <20190318084212.lv2lorskizl65uzg@flea>
 <CAGb2v67H9FkjKjSE5a7fUCb_t95Zfuk1p0bjWYJxjMqhMN-hfg@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="la2n7sufjnrgak3p"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBEV3XXSAKGQEFXJ645Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v67H9FkjKjSE5a7fUCb_t95Zfuk1p0bjWYJxjMqhMN-hfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--la2n7sufjnrgak3p
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Mar 18, 2019 at 04:45:19PM +0800, Chen-Yu Tsai wrote:
> On Mon, Mar 18, 2019 at 4:42 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > Hi,
> >
> > On Mon, Mar 18, 2019 at 03:33:52PM +0800, Chen-Yu Tsai wrote:
> > > From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > >
> > > Originally the SID e-fuses were thought to be in big-endian format.
> > > Later sources show that they are in fact native or little-endian.
> > > The most compelling evidence is the thermal sensor calibration data,
> > > which is a set of one to three 16-bit values. In native-endian they
> > > are in 16-bit cells with increasing offsets, whereas with big-endian
> > > they are in the wrong order, and a gap with no data will show if there
> > > are one or three cells.
> > >
> > > Switch to a native endian representation for the nvmem device. For the
> > > H3, the register read-out method was already returning data in native
> > > endian. This only affects the other SoCs.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >
> > I thought only the newer SoCs were impacted by this issue?
>
> It is noticable on the newer SoCs. The old ones only have the 128-bit SID,
> which could be read either way, as AFAIK it's just a serial number.
>
> If you think we should leave the old ones alone I can factor that in.

IIRC, there was also the SoC ID in the SID on those SoCs as well,
which we might have to use in the future so we'll want to make sure it
is correct.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--la2n7sufjnrgak3p--
