From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 7/7] ARM: dts: rcar-gen2: Remove un-supported VIN
 properties
Date: Mon, 9 Jul 2018 16:26:30 +0200
Message-ID: <20180709142630.GC23629@w540>
References: <1531145962-1540-1-git-send-email-jacopo+renesas@jmondi.org>
 <1531145962-1540-8-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5270242076079603278=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531145962-1540-8-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, geert@glider.be, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, niklas.soderlund@ragnatech.se, hans.verkuil@cisco.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============5270242076079603278==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Ah ups,
   I initially had this one in the series (see, it's [7/7]), then I
dropped it not to sparkle any more debate, and re-generated patches,
but forget to remove this one, which has been sent with the rest of
the series.

So please ignore it.

Sorry for the noise.
   j

On Mon, Jul 09, 2018 at 04:19:22PM +0200, Jacopo Mondi wrote:
> Remove from VIN interface description properties that are not listed as
> supported in bindings documentation, as their value is fixed in the hardware.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm/boot/dts/r8a7790-lager.dts   | 2 --
>  arch/arm/boot/dts/r8a7791-koelsch.dts | 2 --
>  arch/arm/boot/dts/r8a7793-gose.dts    | 2 --
>  3 files changed, 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
> index 092610e..250f698 100644
> --- a/arch/arm/boot/dts/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/r8a7790-lager.dts
> @@ -888,8 +888,6 @@
>  			bus-width = <24>;
>  			hsync-active = <0>;
>  			vsync-active = <0>;
> -			pclk-sample = <1>;
> -			data-active = <1>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
> index 8ab793d..1becb79 100644
> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
> @@ -860,8 +860,6 @@
>  			bus-width = <24>;
>  			hsync-active = <0>;
>  			vsync-active = <0>;
> -			pclk-sample = <1>;
> -			data-active = <1>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
> index aa209f6..f57a7ae 100644
> --- a/arch/arm/boot/dts/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/r8a7793-gose.dts
> @@ -768,8 +768,6 @@
>  			bus-width = <24>;
>  			hsync-active = <0>;
>  			vsync-active = <0>;
> -			pclk-sample = <1>;
> -			data-active = <1>;
>  		};
>  	};
>  };
> --
> 2.7.4
>

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbQ3CWAAoJEHI0Bo8WoVY8tHwP/1G3ShHzpii8KjX4fVdyU6Rc
Jg7E/TOkLjuFq9qszZm49/AUW7AR17iCntGK3HQcFmaLD5oH5BJLsdDNUBx7ipRn
YcaA5qx6O73CGTrxYs7nQSFPN+TCxQBmyAFSSE8ITvS2ExF6VmbiQ2A6+oX2MTWu
NCCAjN3sCMn1DOU1I7w70G+tbef7GiqHN62xehS/UdjSIjaUR5ME4A83DFXFbNuX
6R3CIhB74dwtgU6bODUrNPGz40ulY88UmZD1yPWuGbU/wO9dJvB0MxYYfqei/JUF
1XAFT6cbgt2Q99qYlqLmCoXVNtIiYqgsGD99XKXoX6QAAaX45QfK4EzcLnS8mW/k
ETb6oSqUlxwXLJvDO/kNJ0S4odjCgTkAoRDzK1twES3yyeqd78PQP1mJ7Srl9ad4
4+nSldGJ3lcEUuc1anJmXMsLAl7/EGNrOpXKr425f863M9/QELOZn47wHXJvwXKl
3I+QNgZ2JGOl3RLu78KPlqVVxCki1iq/c/DOXFNc0NPHfZBP7bGO3HyhVJjQQKRO
Nyg/mRaWFgJKKr54tQfvB9rM77BRjjs71f+UhwycGA7Ga4TCJTT17d8hty9NQJdb
7Mpi4YRTpQaCRTeKiB5v0aY7XjtY8iqd+wNY7xxyzmmPNFchakQ7wJV0A3MFRR7R
msxQp2u/PTo9CZH18UKA
=oUEm
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--


--===============5270242076079603278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5270242076079603278==--
