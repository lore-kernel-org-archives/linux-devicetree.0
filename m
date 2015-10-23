From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Fri, 23 Oct 2015 20:14:06 +0200
Message-ID: <20151023181406.GK10947@lukather>
References: <1445444428-4652-1-git-send-email-jenskuske@gmail.com>
 <1445444428-4652-2-git-send-email-jenskuske@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hvDi6/M7gW6JbuLr"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB4HRVGYQKGQEWO6V2UI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445444428-4652-2-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--hvDi6/M7gW6JbuLr
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Oct 21, 2015 at 06:20:27PM +0200, Jens Kuske wrote:
> +		bus_gates: clk@01c20060 {
> +			#clock-cells = <1>;
> +			compatible = "allwinner,sun8i-h3-bus-gates-clk";
> +			reg = <0x01c20060 0x14>;
> +			clock-indices = <5>, <6>, <8>,
> +					<9>, <10>, <13>,
> +					<14>, <17>, <18>,
> +					<19>, <20>,
> +					<21>, <23>,
> +					<24>, <25>,
> +					<26>, <27>,
> +					<28>, <29>,
> +					<30>, <31>, <32>,
> +					<35>, <36>, <37>,
> +					<40>, <41>, <43>,
> +					<44>, <52>, <53>,
> +					<54>, <64>,
> +					<65>, <69>, <72>,
> +					<76>, <77>, <78>,
> +					<96>, <97>, <98>,
> +					<112>, <113>,
> +					<114>, <115>, <116>,
> +					<128>, <135>;
> +			clocks = <&ahb1>, <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb2>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb2>,
> +				 <&ahb2>, <&ahb2>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&ahb1>, <&ahb1>,
> +				 <&ahb1>, <&apb1>,
> +				 <&apb1>, <&apb1>, <&apb1>,
> +				 <&apb1>, <&apb1>, <&apb1>,
> +				 <&apb2>, <&apb2>, <&apb2>,
> +				 <&apb2>, <&apb2>,
> +				 <&apb2>, <&apb2>, <&apb2>,
> +				 <&ahb1>, <&ahb1>;

This is not really what I had in mind...

This IP has 2 parents, and only two parents. The mapping between the
IPs should be done in the driver itself, not in the DT where it is
very error prone and barely readable.

And note that I never have expected you to use clk-simple-gates
either. This is a complicated clock, unlike the other we've seen so
far, it definitely deserves a driver of its own.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--hvDi6/M7gW6JbuLr--
