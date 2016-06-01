From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 05/13] DT: clock: rcar-gen2-cpg-clocks: document R8A7792
 support
Date: Wed, 1 Jun 2016 09:25:35 +0900
Message-ID: <20160601002535.GB20527@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <4688920.9Ektl04hDh@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4688920.9Ektl04hDh@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

[Cc: Geert]

On Wed, Jun 01, 2016 at 01:20:11AM +0300, Sergei Shtylyov wrote:
> Renesas R8A7792 SoC is a member of the R-Car gen2 family and so has C=
PG...
>=20
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Hi Sergei,

I think the prefix of this patch should be "clk: shmobile: rcar-gen2: "

Hi Geert,

I apologise if I have missed a discussion of this topic or if my analys=
is
is wrong for some reason but I am curious to know what the intended way
is for the rcar-gen2 CPG driver to handle differences in the availabili=
ty
of clocks across different SoCs.

My possibly na=C3=AFve expectation is that the implementation would use=
 compat
strings. But as it stands it appears that all clocks supported by the
driver are available for all SoCs. This does not seem to reflect the
documentation (v2.00).

=46WIW my quick analysis of clocks supported by the driver present in
renesas-drivers-2016-05-31-v4.7-rc1 but not present on one or more SoCs
is as follows:

Not present on V2H: sdh, sd0
Not present on V2H or E2: sd1
Not present on H2, M2-W, M2-N, E2: rcan

>=20
> ---
>  Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks=
=2Etxt |    1 +
>  1 file changed, 1 insertion(+)
>=20
> Index: renesas/Documentation/devicetree/bindings/clock/renesas,rcar-g=
en2-cpg-clocks.txt
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- renesas.orig/Documentation/devicetree/bindings/clock/renesas,rcar=
-gen2-cpg-clocks.txt
> +++ renesas/Documentation/devicetree/bindings/clock/renesas,rcar-gen2=
-cpg-clocks.txt
> @@ -10,6 +10,7 @@ Required Properties:
>    - compatible: Must be one of
>      - "renesas,r8a7790-cpg-clocks" for the r8a7790 CPG
>      - "renesas,r8a7791-cpg-clocks" for the r8a7791 CPG
> +    - "renesas,r8a7792-cpg-clocks" for the r8a7792 CPG
>      - "renesas,r8a7793-cpg-clocks" for the r8a7793 CPG
>      - "renesas,r8a7794-cpg-clocks" for the r8a7794 CPG
>      and "renesas,rcar-gen2-cpg-clocks" as a fallback.
>=20
