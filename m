From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] phy: rockchip-dp: should be a child device of the GRF
Date: Wed, 06 Apr 2016 13:38:37 -0700
Message-ID: <3485892.5WC9EhQffY@phil>
References: <1458854943-17388-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458854943-17388-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,

Am Donnerstag, 24. M=E4rz 2016, 22:29:01 schrieb Heiko Stuebner:
> The displayport-phy is fully enclosed in the general register files (=
GRF).
> Therefore as seen from the device-tree it shouldn't be a separate
> platform- device but instead a sub-device of the GRF - using the
> simply-mfd mechanism.
>=20
> The driver entered the kernel in the current merge-window, so we can =
still
> adapt the binding without needing a fallback, as the binding hasn't b=
een
> released with a full kernel yet.
>=20
> While the edp phy is fully part of the GRF, it doesn't have any separ=
ate
> register set there, so doesn't get any register-area assigned.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

could you please look at taking these patches into the 4.6-rc kernel as=
 fixes=20
please. I'd really like to not having to keep the old interface around =
and=20
currently we still can just convert without keeping backward compatibil=
ity.


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
