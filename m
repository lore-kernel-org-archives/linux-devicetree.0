From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 05/24] clk: wrap I/O access for improved portability
Date: Thu, 18 Jul 2013 11:08:00 +0100
Message-ID: <20130718100800.GF22506@sirena.org.uk>
References: <1373914074-20889-1-git-send-email-gsi@denx.de>
 <1373914074-20889-6-git-send-email-gsi@denx.de>
 <20130715193829.GS14452@pengutronix.de>
 <20130718070402.GO7080@book.gsilab.sittig.org>
 <20130718080657.GI10380@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5871342441967195697=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130718080657.GI10380-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============5871342441967195697==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a2GlHqZBJuVUxZ2A"
Content-Disposition: inline


--a2GlHqZBJuVUxZ2A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 18, 2013 at 10:06:57AM +0200, Sascha Hauer wrote:

> I think regmap has the potential to solve a number of issues like the
> hardcoded readl/writel in the common clock blocks, issues with i2c
> clocks and your endianess issue. The biggest question probably is how
> to get there without putting too much of a burden on you. It's probably
> not an option to convert all users to regmap, so it seems additional
> functions like clk_register_gate_regmap are better to handle.

That's basically what regulator does.  There's versions of the ops that
all the drivers can use.

--a2GlHqZBJuVUxZ2A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5759AAoJELSic+t+oim9FpgQAJLTChS7UMhyGs/rcPs/r8AD
gXQ/CSLkgtcqhrjoojWTn7/TPA/IwCBD+e8b/W6qkBaWdqiSOuOGBsuBBob2z0Mb
N6oI//Nwi5k2pbMvDrJP8CWuvtWGDVnKwWAMpHO1ykPHFVsgtOwtROcqXHtVupSU
HvnmOiP8hrZIB63PSUyEozC9Uniag25wDm+EtduFS3YXfphlmux3Yc1bg3fKB8ar
m3ai0u9Fhtd3A8ovYAfKxg+Ws4gRn8o/9kkyLErJxR7fU58dGfUULjyIdVFp3FFY
TqeBnVYoPI9/cv2EZPM+89aQgYyvrW/2H43cmKFYmRR7NfjJLC50FUBIqkaoueUU
uOKsQLvjeuOYcsvKOJqmNOXabeEYrtln10Lc8qVorSOS6Rgmwj7i0ocFNTRlJIB0
wusnYSMjo2jIt+17ZAmFF3MGT7i3yTkHFASrz4moK0EkZAJe2LzOnC7HBAHu3v0V
wmNnzG/o9/j3a0X5iqSQIPuIOiqe4uUJNuPxCi38xUcv+EqQ0E3v6GbTIYac46fa
veJKQZFsXUWQRCkopBdVCsQzCJCW8Msp49Xfj1tLBenddP8Qpw1IuBeVjhzojVT6
3rGUOFLnODvJ/UaW+6fszKaPDOLfWL8t6T7Qz8Get2Di9skRjxJSWYx53Cqe/bq/
Xj7MGMHN2gjABv147L7m
=fuLU
-----END PGP SIGNATURE-----

--a2GlHqZBJuVUxZ2A--

--===============5871342441967195697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5871342441967195697==--
