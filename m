From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] net: phy: dp83867: Add documentation for CLK_OUT pin muxing
Date: Wed, 14 Feb 2018 09:06:04 -0800
Message-ID: <6E67A8CE-27A7-44F8-A325-85A61AB393EE@gmail.com>
References: <1518624432-15110-1-git-send-email-d.schultz@phytec.de> <1518624432-15110-2-git-send-email-d.schultz@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518624432-15110-2-git-send-email-d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Schultz <d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On February 14, 2018 8:07:12 AM PST, Daniel Schultz <d=2Eschultz@phytec=2Ed=
e> wrote:
>From: Wadim Egorov <w=2Eegorov@phytec=2Ede>
>
>Add documentation of ti,clk-output-sel which can be used to select
>a specific clock for CLK_OUT=2E
>
>Signed-off-by: Wadim Egorov <w=2Eegorov@phytec=2Ede>
>Signed-off-by: Daniel Schultz <d=2Eschultz@phytec=2Ede>

Reviewed-by: Florian Fainelli <f=2Efainelli@gmail=2Ecom>

Nit: usually the binding patch comes first and the implementation using it=
 right after, not necessary to respin=2E

--=20
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
