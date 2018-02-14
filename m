From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] net: phy: dp83867: Add binding for the CLK_OUT pin muxing option
Date: Wed, 14 Feb 2018 09:04:12 -0800
Message-ID: <4CCCD320-91E4-4FCD-A467-FD323BAB2427@gmail.com>
References: <1518624432-15110-1-git-send-email-d.schultz@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518624432-15110-1-git-send-email-d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Schultz <d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On February 14, 2018 8:07:11 AM PST, Daniel Schultz <d=2Eschultz@phytec=2Ed=
e> wrote:
>From: Wadim Egorov <w=2Eegorov@phytec=2Ede>
>
>The DP83867 has a muxing option for the CLK_OUT pin=2E It is possible
>to set CLK_OUT for different channels=2E
>Create a binding to select a specific clock for CLK_OUT pin=2E
>
>Signed-off-by: Wadim Egorov <w=2Eegorov@phytec=2Ede>
>Signed-off-by: Daniel Schultz <d=2Eschultz@phytec=2Ede>
>---
>Changes:
>	v2:
>	  Added check if clk_output_sel has a valid value
>	  Only write the clock ouput register if a musing is desired
>	v3:
>	  -
>
> drivers/net/phy/dp83867=2Ec            | 19 +++++++++++++++++++
> include/dt-bindings/net/ti-dp83867=2Eh | 14 ++++++++++++++
> 2 files changed, 33 insertions(+)
>
>diff --git a/drivers/net/phy/dp83867=2Ec b/drivers/net/phy/dp83867=2Ec
>index c1ab976=2E=2Ea862194 100644
>--- a/drivers/net/phy/dp83867=2Ec
>+++ b/drivers/net/phy/dp83867=2Ec
>@@ -75,6 +75,8 @@
>=20
> #define DP83867_IO_MUX_CFG_IO_IMPEDANCE_MAX	0x0
> #define DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN	0x1f
>+#define DP83867_IO_MUX_CFG_CLK_O_SEL_MASK	(0x1f << 8)
>+#define DP83867_IO_MUX_CFG_CLK_O_SEL_SHIFT	8
>=20

Nit: it looks like you could use the shift constant you define for definin=
g the mask as well=2E

Other than that:

Reviewed-by: Florian Fainelli <f=2Efainelli@gmail=2Ecom>

--=20
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
