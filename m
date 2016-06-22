From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 5/8] rtc: ac100: Add clk output support
Date: Wed, 22 Jun 2016 12:02:06 +0200
Message-ID: <20160622100206.GV26668@lukather>
References: <1466391138-12862-1-git-send-email-wens@csie.org>
 <1466391138-12862-6-git-send-email-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="buDNgeHiu+HCsDEc"
Return-path: <rtc-linux+bncBDSJBYGBRIMBBKOEVG5QKGQE74DUTNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1466391138-12862-6-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--buDNgeHiu+HCsDEc
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Mon, Jun 20, 2016 at 10:52:15AM +0800, Chen-Yu Tsai wrote:
> +	/*
> +	 * The ADDA 4 MHz clock is from the codec side of the AC100,
> +	 * which is likely a different power domain. However, boards
> +	 * always have both sides powered on, so it is impossible to
> +	 * test this.
> +	 */

If that ADDA clock is exposed by the codec, why are you putting it in
the RTC?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--buDNgeHiu+HCsDEc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXamIeAAoJEBx+YmzsjxAgep8QALb4QiyE0axUbD8L9KkpG7V0
dOsu/m7Qg+xvaQRGz5AUkytzp3EggzTyyaDQdwL9FaPQEzkxsq275QRu81jfcW28
pYi02XaSUpvAeMIlcAil4xKRzR9M7pWrL8/d/GBwMn/5Znw4nc2cosR4iwfMOH6i
aKSw9pJYjWRqqjaT6QZn+iny3v+diTETG4IAcPqBnljpXCuUHjYYEOJS+PNLYQvL
c09lui5fc9t7ZLIJgQsrJ7hSiNu5XL/qErRWNYxXQqwX4QJnURRW0S+q4z0wysWT
+Z77rMsKo6KKRqDDJRlnVtYwTiyrXnWgCKKI8m23e21biTdCEC1mKdDZciX26v2F
TgTo5+htGKknjpo5qeg+qukL+8aK0kHnLLSaHRLtXScIXYQEMFcY74+RlNcsnNPM
tMQSXcKbGm3HvLediuU4ldUGwQblu6aIDNBPcnetDGH1ehh/ocIfuCH2YSiBQF0g
Po8Yybgn4+kcpIjwIHoWEF4WvjeWY+EbX0/LuSbwl/L6CwzFe2u9HKK76rqPWwlp
E6uG57uWFFzwXtvMem9PKsC8McUU9571GYlSCUxN5ThmhH+cmbeshwN5U5RA7otp
RewA+kwqB0JYzzVdj89gFbaYfIcaXM93uImBinkoCxWMpLxHdtQ9EIcumTcO8zjg
Tuc3OrdLvJzf9H8ybHdv
=Z3pe
-----END PGP SIGNATURE-----

--buDNgeHiu+HCsDEc--
