From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: add Allwinner H6 r_watchdog
Date: Wed, 22 May 2019 12:32:43 +0200
Message-ID: <20190522103243.mmrfato5p2mhtf4j@flea>
References: <20190521160330.28402-1-peron.clem@gmail.com>
 <20190521160330.28402-4-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190521160330.28402-4-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 21, 2019 at 06:03:28PM +0200, Clément Péron wrote:
> Allwinner H6 has a second watchdog on the r-blocks which is
> compatible with the A31.
>
> This commit add the H6 compatible for the r_watchdog.
>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>

Unless you have some evidence that the two blocks are different, then
you should just reuse the same one.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
