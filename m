From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/8] rsb: Add generic Reduced Serial Bus
 (RSB) controller binding documentation
Date: Thu, 20 Aug 2015 23:24:46 +0200
Message-ID: <20150820212446.GK30520@lukather>
References: <1439958009-14056-1-git-send-email-wens@csie.org>
 <1439958009-14056-2-git-send-email-wens@csie.org>
 <20150820150845.GB30520@lukather>
 <CAGb2v65jnU859gQG0orb9M9pR6nKcth9EPcgmmR5fckdHxngrQ@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zQZ31nKYDGgulmZX"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBIEL3GXAKGQEH7QNPEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v65jnU859gQG0orb9M9pR6nKcth9EPcgmmR5fckdHxngrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--zQZ31nKYDGgulmZX
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Aug 20, 2015 at 11:58:39PM +0800, Chen-Yu Tsai wrote:
> >> +Child nodes:
> >> +
> >> +An RSB controller node can contain zero or more child nodes representing
> >> +slave devices on the bus.  Child 'reg' properties are specified as a
> >> +runtime address, hardware address pair. The hardware address is hardwired
> >> +in the device, which can normally be found in the datasheet. The runtime
> >> +address is set by software. No 2 devices on the same bus shall have the
> >> +same runtime address.
> >> +
> >> +Valid runtime addresses - There are only 15 valid runtime addresses:
> >> +
> >> +    0x17, 0x2d, 0x3a, 0x4e, 0x59, 0x63, 0x74, 0x8b,
> >> +    0x9c, 0xa6, 0xb1, 0xc5, 0xd2, 0xe8, 0xff
> >> +
> >> +It is highly recommended that one choose the same runtime addresses as
> >> +vendor BSPs use so that a) the addresses remain the same across different
> >> +software systems, and b) addresses of supported and listed slave devices
> >> +don't conflict with unsupported or not yet listed devices.
> >
> > I'd expect to have the hardware address first, but maybe it's just me
> > :)
> 
> I don't know. It's only used at init time.
> 
> And in my latest experience, once the runtime address is set by the
> bootloader, it can't be changed. My earlier experience was the opposite,
> though I haven't figured out why.

Note that I'm only talking about the order of runtime and hardware
addresses in the reg property, having both is fine.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--zQZ31nKYDGgulmZX--
