From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 5/6] ARM: dts: rcar-gen2: Remove unused VIN properties
Date: Thu, 17 May 2018 00:13:07 +0200
Message-ID: <20180516221307.GF17948@bigcity.dyn.berto.se>
References: <1526488352-898-1-git-send-email-jacopo+renesas@jmondi.org>
 <1526488352-898-6-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1526488352-898-6-git-send-email-jacopo+renesas@jmondi.org>
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, geert@glider.be, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

Thanks for your work.

On 2018-05-16 18:32:31 +0200, Jacopo Mondi wrote:
> The 'bus-width' and 'pclk-sample' properties are not parsed by the VIN
> driver and only confuse users. Remove them in all Gen2 SoC that used
> them.
> =

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm/boot/dts/r8a7790-lager.dts   | 3 ---
>  arch/arm/boot/dts/r8a7791-koelsch.dts | 3 ---
>  arch/arm/boot/dts/r8a7791-porter.dts  | 1 -
>  arch/arm/boot/dts/r8a7793-gose.dts    | 3 ---
>  arch/arm/boot/dts/r8a7794-alt.dts     | 1 -
>  arch/arm/boot/dts/r8a7794-silk.dts    | 1 -
>  6 files changed, 12 deletions(-)
> =

> diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7=
790-lager.dts
> index 063fdb6..b56b309 100644
> --- a/arch/arm/boot/dts/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/r8a7790-lager.dts
> @@ -873,10 +873,8 @@
>  	port {
>  		vin0ep2: endpoint {
>  			remote-endpoint =3D <&adv7612_out>;
> -			bus-width =3D <24>;

I can't really make up my mind if this is a good thing or not. Device =

tree describes the hardware and not what the drivers make use of. And =

the fact is that this bus is 24 bits wide. So I'm not sure we should =

remove these properties. But I would love to hear what others think =

about this.

>  			hsync-active =3D <0>;
>  			vsync-active =3D <0>;
> -			pclk-sample =3D <1>;
>  			data-active =3D <1>;
>  		};
>  	};
> @@ -895,7 +893,6 @@
> =

>  		vin1ep0: endpoint {
>  			remote-endpoint =3D <&adv7180>;
> -			bus-width =3D <8>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8=
a7791-koelsch.dts
> index f40321a..9967666 100644
> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
> @@ -849,10 +849,8 @@
> =

>  		vin0ep2: endpoint {
>  			remote-endpoint =3D <&adv7612_out>;
> -			bus-width =3D <24>;
>  			hsync-active =3D <0>;
>  			vsync-active =3D <0>;
> -			pclk-sample =3D <1>;
>  			data-active =3D <1>;
>  		};
>  	};
> @@ -870,7 +868,6 @@
> =

>  		vin1ep: endpoint {
>  			remote-endpoint =3D <&adv7180>;
> -			bus-width =3D <8>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a=
7791-porter.dts
> index c14e6fe..055a7f1 100644
> --- a/arch/arm/boot/dts/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/r8a7791-porter.dts
> @@ -391,7 +391,6 @@
> =

>  		vin0ep: endpoint {
>  			remote-endpoint =3D <&adv7180>;
> -			bus-width =3D <8>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a77=
93-gose.dts
> index 9ed6961..9d3fba2 100644
> --- a/arch/arm/boot/dts/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/r8a7793-gose.dts
> @@ -759,10 +759,8 @@
> =

>  		vin0ep2: endpoint {
>  			remote-endpoint =3D <&adv7612_out>;
> -			bus-width =3D <24>;
>  			hsync-active =3D <0>;
>  			vsync-active =3D <0>;
> -			pclk-sample =3D <1>;
>  			data-active =3D <1>;
>  		};
>  	};
> @@ -781,7 +779,6 @@
> =

>  		vin1ep: endpoint {
>  			remote-endpoint =3D <&adv7180_out>;
> -			bus-width =3D <8>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a779=
4-alt.dts
> index 26a8834..4bbb9cc 100644
> --- a/arch/arm/boot/dts/r8a7794-alt.dts
> +++ b/arch/arm/boot/dts/r8a7794-alt.dts
> @@ -380,7 +380,6 @@
> =

>  		vin0ep: endpoint {
>  			remote-endpoint =3D <&adv7180>;
> -			bus-width =3D <8>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a77=
94-silk.dts
> index 351cb3b..c0c5d31 100644
> --- a/arch/arm/boot/dts/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/r8a7794-silk.dts
> @@ -480,7 +480,6 @@
> =

>  		vin0ep: endpoint {
>  			remote-endpoint =3D <&adv7180>;
> -			bus-width =3D <8>;
>  		};
>  	};
>  };
> --
> 2.7.4
> =


-- =

Regards,
Niklas S=F6derlund
