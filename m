From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/9] regulator: core: Try full range when
 adjusting regulators to constraints
Date: Tue, 23 Aug 2016 11:40:02 +0100
Message-ID: <20160823104002.GX22076@sirena.org.uk>
References: <20160821021125.1521-1-wens@csie.org>
 <20160821021125.1521-4-wens@csie.org>
 <20160822162907.GO22076@sirena.org.uk>
 <20160822175205.h76hurjaopnosymc@vip.cybercity.dk>
 <20160822180932.GW22076@sirena.org.uk>
 <CAGb2v67ZST-E++z5oobLRwCfHMZZR6HTss=MSqJLJArnQz3qMw@mail.gmail.com>
Reply-To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oIMVlEQ///Q2JYC7"
Return-path: <linux-sunxi+bncBDQ2L75W5QGBBFWQ6C6QKGQERIGMUVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v67ZST-E++z5oobLRwCfHMZZR6HTss=MSqJLJArnQz3qMw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rask Ingemann Lambertsen <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--oIMVlEQ///Q2JYC7
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Aug 23, 2016 at 12:17:23PM +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 23, 2016 at 2:09 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > Sure, but the constraints also say that you can do 1.32V which the
> > system is not physically capable of delivering.  That's not a good sign
> > for the constraints, it suggests that at least the capabilities of the
> > regulator have not been taken into consideration when setting up the
> > constraints.

> So to be clear, the constraints should be the intersection of the
> recommended operating parameters of the consumer and the regulator's
> output, with the voltage/current steps taken in to consideration.

The constraints are there to say what the *system* can deliver.  That
includes the limitations of the consumers, the regulators and the
physical design of the board.  Just as one shouldn't just throw in the
maximum voltage range that the regulator can deliver one also shouldn't
just use the maximum voltage range a consumer can support for similar
reasons.
--oIMVlEQ///Q2JYC7--
