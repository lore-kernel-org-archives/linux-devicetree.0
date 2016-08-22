From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/9] regulator: core: Try full range when
 adjusting regulators to constraints
Date: Mon, 22 Aug 2016 17:29:07 +0100
Message-ID: <20160822162907.GO22076@sirena.org.uk>
References: <20160821021125.1521-1-wens@csie.org>
 <20160821021125.1521-4-wens@csie.org>
Reply-To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IpgPcFyQO6wM49Um"
Return-path: <linux-sunxi+bncBDQ2L75W5QGBBBGR5S6QKGQEDLO5DTQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160821021125.1521-4-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--IpgPcFyQO6wM49Um
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Aug 21, 2016 at 10:11:19AM +0800, Chen-Yu Tsai wrote:

> Currently when we try to bring regulator in bounds of its constraints,
> we pick either the minimum or maximum voltage as the target. This fails
> if the regulator range is not continuous, and the target voltage is not
> an exact value the regulator can achieve, i.e. the target is not aligned
> to the step of the regulator.

This seems like you have buggy constraints, constraints which allow
voltages that can't physically be satisfied don't make obvious sense.

> -		if (current_uV < rdev->constraints->min_uV) {
> +		if (current_uV < rdev->constraints->min_uV ||
> +		    current_uV > rdev->constraints->max_uV) {
>  			target_min = rdev->constraints->min_uV;
> -			target_max = rdev->constraints->min_uV;
> -		}
> -
> -		if (current_uV > rdev->constraints->max_uV) {
> -			target_min = rdev->constraints->max_uV;
>  			target_max = rdev->constraints->max_uV;
>  		}

This is most likely going to cause disruption to systems where the
voltage is over the constraint voltage - it will result in the voltage
being lowered to the minimum allowed which will have a much higher
chance of upsetting things.  This is why we don't just do a constraints
run.
--IpgPcFyQO6wM49Um--
