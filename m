From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/4] WIP: MIPS: ath79: make ar933x clks more
 devicetree-friendly
Date: Thu, 21 Jan 2016 03:12:15 +0300
Message-ID: <20160121031215.250b826347fd9c179b031288@gmail.com>
References: <1453074987-3356-1-git-send-email-antonynpavlov@gmail.com>
	<1453074987-3356-2-git-send-email-antonynpavlov@gmail.com>
	<20160118205725.0a16be8e@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160118205725.0a16be8e@tock>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 18 Jan 2016 20:57:25 +0100
Alban <albeu-GANU6spQydw@public.gmane.org> wrote:

> On Mon, 18 Jan 2016 02:56:24 +0300
> Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> > At the moment ar933x of-enabled drivers use use clock names
> > (e.g. "uart" or "ahb") to get clk descriptor.
> > On the other hand
> > Documentation/devicetree/bindings/clock/clock-bindings.txt states
> > that the 'clocks' property is required for passing clk to clock
> > consumers.
>=20
> This patch is not need, you should set the clock-names property in
> the relevant device nodes instead.

This patch is needed for AR9331!

In ar933x_clocks_init() we have

        ath79_add_sys_clkdev("ref", ref_rate);
        clks[0] =3D ath79_add_sys_clkdev("cpu", cpu_rate);
        clks[1] =3D ath79_add_sys_clkdev("ddr", ddr_rate);
        clks[2] =3D ath79_add_sys_clkdev("ahb", ahb_rate);

        clk_add_alias("wdt", NULL, "ahb", NULL);
        clk_add_alias("uart", NULL, "ref", NULL);

"uart" is an alias for "ref". But "ref" is not visible via device tree!

I see this error message on ar933x-uart start:
=20
     ERROR: could not get clock /ahb/apb/uart@18020000:uart(0)

=20
--=A0
Best regards,
=A0 Antony Pavlov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
