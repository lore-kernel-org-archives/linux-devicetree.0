From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [EXTERNAL][PATCH v15 04/13] mfd/syscon: Add device_node_to_regmap()
Date: Thu, 8 Aug 2019 12:04:18 +0200
Message-ID: <CAK8P3a0nOc2tpxYAoE0EGzXT1+FXFqzdK1mYE+ZR9CTqAaH_fQ@mail.gmail.com>
References: <20190724171615.20774-1-paul@crapouillou.net> <20190724171615.20774-5-paul@crapouillou.net>
 <20190729165536.dd67ws6nr2msx4pk@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729165536.dd67ws6nr2msx4pk@pburton-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vge>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 29, 2019 at 6:55 PM Paul Burton <paul.burton@mips.com> wrote:
>
> Lee, Arnd,
>
> On Wed, Jul 24, 2019 at 01:16:06PM -0400, Paul Cercueil wrote:
> > device_node_to_regmap() is exactly like syscon_node_to_regmap(), but it
> > does not check that the node is compatible with "syscon", and won't
> > attach the first clock it finds to the regmap.
> >
> > The rationale behind this, is that one device node with a standard
> > compatible string "foo,bar" can be covered by multiple drivers sharing a
> > regmap, or by a single driver doing all the job without a regmap, but
> > these are implementation details which shouldn't reflect on the
> > devicetree.
>
> Does this looks like a good path forwards to you? Its use in this case
> is described by Documentation/devicetree/bindings/timer/ingenic,tcu.txt
> in patch 3 of the series.
>
> If you're OK with it an ack would be appreciated so I can take the
> series through mips-next, otherwise I guess we'd need to go back to the
> v14 approach.

Yes, I guess this is ok, sorry for missing the submission earlier.

Acked-by: Arnd Bergmann <arnd@arndb.de>
