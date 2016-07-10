From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>
Subject: Re: [PATCH v4 3/3] ath9k: parse the device configuration from an OF node
Date: Sun, 10 Jul 2016 02:19:36 +0200
Message-ID: <87inwe9wfb.fsf@miraculix.mork.no>
References: <20160624123430.4097-1-martin.blumenstingl@googlemail.com>
	<20160709232834.31654-1-martin.blumenstingl@googlemail.com>
	<20160709232834.31654-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160709232834.31654-4-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
	(Martin Blumenstingl's message of "Sun, 10 Jul 2016 01:28:34 +0200")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: ath9k-devel-juf53994utBLZpfksSYvnA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, mcgrof-3uybbJdB1yH774rrrx3eTA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> +	if (of_property_read_bool(np, "qca,clk-25mhz"))
> +		ah->is_clk_25mhz =3D true;
> +
> +	if (of_property_read_bool(np, "qca,disable-2ghz"))
> +		ah->disable_2ghz =3D true;
> +
> +	if (of_property_read_bool(np, "qca,disable-5ghz"))
> +		ah->disable_5ghz =3D true;

This is bike-shedding, but how about

	ah->is_clk_25mhz =3D of_property_read_bool(np, "qca,clk-25mhz");
	ah->disable_2ghz =3D of_property_read_bool(np, "qca,disable-2ghz");
	ah->disable_5ghz =3D of_property_read_bool(np, "qca,disable-5ghz");

instead?


Bj=C3=B8rn
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
