From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 03/10] tty: pxa: configure pin
Date: Tue, 23 Oct 2012 10:37:12 +0100
Message-ID: <20121023093711.GS4477@opensource.wolfsonmicro.com>
References: <1350551224-12857-1-git-send-email-haojian.zhuang@gmail.com>
 <1350551224-12857-3-git-send-email-haojian.zhuang@gmail.com>
 <508080CB.5010904@wwwdotorg.org>
 <CACRpkdb5Jiw71jBLDXpf2VTJQx7_gABqs03_20CeCLbVT=JkaA@mail.gmail.com>
 <5085AC06.8070508@wwwdotorg.org>
 <CACRpkdY-XyagxGU_ya_FZirzbqStTirOC5nuBBwwFY3f4bBTYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0719755022181276574=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdY-XyagxGU_ya_FZirzbqStTirOC5nuBBwwFY3f4bBTYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rickard ANDERSSON <rickard.andersson-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============0719755022181276574==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o/5eNASeIIpuMggS"
Content-Disposition: inline


--o/5eNASeIIpuMggS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 23, 2012 at 11:26:40AM +0200, Linus Walleij wrote:

> I thought about that, but it does not allow us to control the
> resource activation/deactivation order.

> In some drivers the suspend() path could be:

> - pins to sleep
> - clk_disable
> - disable external regulator
> - release power domain

> In others:

> - clk_disable()
> - disable external regulator
> - pins to sleep()
> - release power domain

> Ulf Hansson ran into this a while back.

> Just like with the notifier approach, this approach assumes that either
> the ordering above doesn't matter, or that it is the same for all drivers.

Can we handle this with power domains - if different devices require
different orderings they can be placed in power domains which implement
the appropriate orderings for them?

> We don't have hogs, bus notifiers and the like for regulators,
> and IIRC Mark disliked the idea. Basically I think it's better if
> all resources are atleast handled the same way.

It'd be OK to have something that was manually activated for specific
regulators but it's not sane to try and do something generic as you'll
end up powering off all your wakeup sources which tends not to work so
well.

--o/5eNASeIIpuMggS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQhmVBAAoJELSic+t+oim9stUP/jBdDHp/FfTwscnqgKa2GIJp
YrvpQF0P8A4Vu0xBeZSQHHcAp3Yahqmfxa1F4hW1JSUNckvMUnAM8ZVtDD6xE5ii
wGicvdeujCJ6fEQuSO8QBj9aUf9ruMH3tZ1GUlo1/ZDCDVOP+Bt8vvjNpmveTf25
W0P3HoYCSo+wm+rYtCM1uvG6prYWEylftyHOJWPAQTYxvHUkHvkYGQ8AcHI5RKFu
i4FkSrr+o56VbI3/J4gvxh2gtFhAoDyqlEq5BnTCqezELd9/2qjouh0DhC6h1C2B
e8qKij6zgftlWB1ukW8HP9qWdSkSrVlZiKjb5h3xalg7wBL7Gict/6SdIh/zk6LB
C02N2ANCR62RFaa6CFIG9jhd/vorhHGIWF8w93V8p24aNo6WlfeCeZYBibffMXKV
ZVkQjHkiUopDBSCeNXEQZ4wBLtvKqrB2YMXoYPfN18f+qKbDfeQewFYA9ZUsLPjP
AzvEUiXH2p3O0dq7USfw9p5qc3xJxop2F/cCGfSNgm+fSr6ymhASNXh8jjzjoNzL
txtL6Az+xHXPOGQZGYIgvC+eIanBwOibzv+FA0E5ZoYiBXq5IdEG4PhsFUSRLDF1
00LHMd6mKM9e1cFDaGj5XllNWLN7g8YtUhO2kt8gm0XGtwYs7aS27ZVGMmN8IHza
B0xZiEKSLqpQroMnSR+T
=tUer
-----END PGP SIGNATURE-----

--o/5eNASeIIpuMggS--

--===============0719755022181276574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0719755022181276574==--
