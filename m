From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: add hym8563 binding
Date: Mon, 25 Nov 2013 11:50:52 +0000
Message-ID: <20131125115052.GC32081@e106331-lin.cambridge.arm.com>
References: <201311222254.07730.heiko@sntech.de>
 <201311222255.03642.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201311222255.03642.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 22, 2013 at 09:55:03PM +0000, Heiko St=C3=BCbner wrote:
> Add binding documentation for the hym8563 rtc chip.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/haoyu,hym8563.txt      |   29 ++++++++++=
++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/haoyu,hym85=
63.txt
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt =
b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt
> new file mode 100644
> index 0000000..2743416
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt
> @@ -0,0 +1,29 @@
> +Haoyu Microelectronics HYM8563 Real Time Clock
> +
> +The HYM8563 provides basic rtc and alarm functionality
> +as well as a clock output of up to 32kHz.
> +
> +Required properties:
> +- compatible: should be: "haoyu,hym8563"

The "haoyu" vendor prefix will need to be documented (I couldn't spot i=
t
in mainline's vendor-refixes.txt).

> +- reg: i2c address
> +- gpios: interrupt gpio

What's this used for exactly?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
