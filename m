From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Raise minimum CPU voltage
 for sun7i-a20 to a level all boards can supply
Date: Mon, 3 Aug 2015 11:28:39 +0200
Message-ID: <20150803092839.GB2564@lukather>
References: <1438543386-7253-1-git-send-email-public_timo.s@silentcreek.de>
 <CAGRGNgV6b9yt2HnB2x2Wyc05KEahoX-Y+mVhxsryztcfA36H1g@mail.gmail.com>
 <CAGb2v67o-=_cL2RWfXJ+3C86zfQ_1b5DYRi3_zwvwy6su6+gdw@mail.gmail.com>
 <CAGRGNgXH90m9h0DDejd5MTf8enduGFQ8dPKrRhmc8Z6y_PaC1w@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RvfD4wEUHtVM+5Ki"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBSPI7SWQKGQE4DNVRXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGRGNgXH90m9h0DDejd5MTf8enduGFQ8dPKrRhmc8Z6y_PaC1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--RvfD4wEUHtVM+5Ki
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Aug 03, 2015 at 02:22:13PM +1000, Julian Calaby wrote:
> >> Is the code that uses this smart enough to sensibly switch between two
> >> operating points with the same frequency and different voltages? If
> >> so, maybe just add a 144MHz @ 1.0v operating point?
> >
> > You could try. Though I really don't see much to gain here.
> 
> From what I recall, lower frequency = less power usage, though my
> experience is from x86 laptops, not ARM SoCs and I'm sure I'm missing
> a lot of details. This is the sort of thing that requires thorough
> testing on a dev board.

Not on *a* dev board. On virtually all the A20 SoCs ever produced. If
you have a setting that works better for *your* SoC, fine, patch your
DT, but that's not going to be a default if it's outside of the SoC
operating range.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--RvfD4wEUHtVM+5Ki--
