From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/8] ARM: sunxi: Add Reduced Serial Bus support
Date: Thu, 20 Aug 2015 10:02:11 -0700
Message-ID: <20150820170211.GB12027@sirena.org.uk>
References: <1439958009-14056-1-git-send-email-wens@csie.org>
 <20150819163232.GS10748@sirena.org.uk>
 <CAGb2v66X-CMQiS1dNqhwamTsVbnf+7siSTV3xGwn-C91Zhw3uA@mail.gmail.com>
Reply-To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Return-path: <linux-sunxi+bncBDQ2L75W5QGBBREQ3CXAKGQEAKDSWSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66X-CMQiS1dNqhwamTsVbnf+7siSTV3xGwn-C91Zhw3uA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Aug 20, 2015 at 09:59:27AM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 20, 2015 at 12:32 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > This is flagged as something that is specific to the Allwinner SoCs.
> > Why add generic regmap support rather than just implement the regmap
> > reg_read() and reg_write() in a regmap in the controller driver?  Are
> > there expected to be other controller drivers from other vendors?

> I don't expect there to be any other controller drivers. And it seems
> at least some of the devices are dual interface (I2C/RSB). Though I
> don't see how its connected to the generic regmap support. Regmap
> is for device drivers connected to the RSB bus, not the bus controller
> itself.

The point here is that you can use regmap for a custom controller
without having to implement a bus, to repeat what I said:

| > Why add generic regmap support rather than just implement the regmap
| > reg_read() and reg_write() in a regmap in the controller driver?  Are

> I could throw all the RSB-related stuff together, presumably under
> drivers/soc/sunxi/rsb, though that doesn't help the fact that common
> regmap code would be  better than scattering regmap_* in various mfd
> drivers.

If there is only one controller driver you just have a single call into
that driver in the client device which gives you the same level of
shared code, having a wrapper layer in regmap that puts regmap_
functions around the equivalent controller specific functions isn't
really adding a huge amount.

It's a similar thing to the way we just reuse the platform bus for basic
buses rather than copying it to make new bus types, we don't need to
create lots of new boilerplate regmap types that are just really basic
wrappers.  There are a lot of these custom buses that people have.
--R3G7APHDIzY6R/pk--
