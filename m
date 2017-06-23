From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] input: sun4i-a10-lradc-keys: Add
 support for A83T
Date: Fri, 23 Jun 2017 16:46:22 +0200
Message-ID: <20170623144622.zn6ecwl2dwkc63w2@flea.lan>
References: <20170620134445.23097-1-techping.chan@gmail.com>
 <20170620134445.23097-2-techping.chan@gmail.com>
 <20170621203502.ng7auh6vfmibobwo@flea.lan>
 <CAAST=9zK8CjpEwy1rSjwnaSrpoQor-NkjWcX8kFSM-o=qP8OWQ@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pp7fmtkqt3q37zdb"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSGTWTFAKGQEK6EPCDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAAST=9zK8CjpEwy1rSjwnaSrpoQor-NkjWcX8kFSM-o=qP8OWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pp7fmtkqt3q37zdb
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Jun 22, 2017 at 12:50:47PM +0800, Ziping Chen wrote:
> 2017-06-22 4:35 GMT+08:00 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> 
> > On Tue, Jun 20, 2017 at 09:44:43PM +0800, Ziping Chen wrote:
> > > From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > >
> > > Allwinner A83T SoC has a low res adc like the one
> > > in Allwinner A10 SoC, however, the A10 SoC's vref
> > > of lradc internally is divided by 2/3 and the A83T
> > > SoC's isn't, thus add a hardware variant for it to
> > > be compatible with various devices.
> >
> > Where did you get that info from?
> >
> > Judging from the user manual, the threshold is actually set to 3/4,
> > and not 2/3, but there's still one.
> >
> 
> In the top of page 266 of the A10 User Manual V1.50, it said "2/3 ADC_REF
> (Level A)" which mean Level A is 2/3 of the vref.
> 
> In the bottom of page 230 of the A83T User Manual V1.5.1, it said "1.35V
> (Level A)" meaning that Level A is 1.35V. Oh, it's my fault... It's 3/4 of
> the vref (A83T's ADC_REF is fixed at 1.8V).
> 
> So... i will change r_lradc_variant_a83t.divisor_numerator to 3
> and r_lradc_variant_a83t.divisor_denominator to 4...
> 
> Is there any other problems?

I don't see any :)

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--pp7fmtkqt3q37zdb--
