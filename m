From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] mfd: arizona: Update device tree regulator bindings
Date: Sun, 29 Sep 2013 18:52:36 +0100
Message-ID: <20130929175236.GV19304@sirena.org.uk>
References: <1380131272-16982-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20130925183201.GT3226@sirena.org.uk>
 <20130926152941.GQ3635@opensource.wolfsonmicro.com>
 <20130926175843.GS19304@sirena.org.uk>
 <20130928155308.GV3635@opensource.wolfsonmicro.com>
 <20130928225535.GQ19304@sirena.org.uk>
 <20130929141137.GW3635@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GZxc/eAcyN/xQwfo"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130929141137.GW3635-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GZxc/eAcyN/xQwfo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 29, 2013 at 03:11:37PM +0100, Charles Keepax wrote:

> There is currently only one other MFD driver (tps65910) which defines
> the GPIOs on the main MFD node as we do in the Arizona driver and it
> uses the 'hack' that I suggested in my first email of copying the
> of_node.

> tps65910_gpio->gpio_chip.of_node = tps65910->dev->of_node;

Look where it's copying it to - this isn't the hack you were suggesting
before.  What you were suggesting before was setting the of_node of the
child struct device which is a managed thing that the driver core knows
about, the device is the owner of the of_node hanging off it.  You would
end up with the same of_node referenced from two struct devices which
isn't clever.  The above is putting a pointer into the gpio_chip which
is just telling gpiolib that it should use this of_node when it needs
one, gpiolib won't try and lifecycle manage the of_node.

> Looking around there seem to be quite a few drivers that copy
> of_node pointers like this are we sure this isn't an acceptable
> solution? I mean the arizona driver we know the components will
> always be loaded as part of the MFD and thus will be freed before
> the parent node.

It's fine to reference an of_node, that's obviously something that will
need to happen at some point in order to do anything useful with the
data.

--GZxc/eAcyN/xQwfo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSSGjgAAoJELSic+t+oim9G7kP/0ZCoPEmMoaY4xuq2bZgjcgQ
aLtONvcQuXfS46ikgwIFQu2B1nbGQekkAwC2UfqunJNzKwz4zRbZyWdBVVGJLKiC
lyspzFNhUj6gn2ANiO6IIqNcBIIGxqfkVvYtzIFq7ZqbQXDklsVkqm61lbqA5SJM
fRzIo33Q3FBKIvfZ9zvMm2SJ8gFp2goZ75wA0PRkChBMNMXUwTg4TzAoT+h0Wm8V
qwntO92nCuduaeeTFLmVI2LbQsi1BMgFZvGMCa/xmkdSuDN72viAc6HEEsj40JcH
sIs7uWeuyDi7/NwHoT1LWzKM6vPETpAYLuseBaxyZSSR69NReGtw6QqemcJCqiNA
utvB6aKCkpN2UIrBYDyyMtTTCySuh/3lmmFOQWz5gvGbYslkZoz9fdVuOqxg92Rl
DC9msb569pMGxRXpZuGJBMl7M4iR49pC0hAvQ17SbETIu3b2mM/s++XDKbJo0j//
U2bXDQ6lVoc0tybYLt8BmOftS/1JiSiffVuWAP73IwlBCyFg8T3VFoK4zk66yrfs
s/PFfnmVL9HpQoPFtwFtGNLCF5Y7MDmS/kHzwDFe5Vs01WOnHrWfgeN9DPDA5PLT
4V+qvlzb+xGmhZf/n81/RKW0C4WM7zaay5JI7B2Vgg7xm/4yDvA7l9lMpYYZJu4A
ziLl8YoPQTkuQSmpNT+j
=KkL6
-----END PGP SIGNATURE-----

--GZxc/eAcyN/xQwfo--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
