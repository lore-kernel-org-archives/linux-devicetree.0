From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: dts: da850: use gpio-ranges
Date: Thu, 22 Feb 2018 16:34:22 +0100
Message-ID: <CACRpkdb=wOomi4QxvXLdNJVfB-rvGfKE+QZvmxvT2SzVDjH4tw@mail.gmail.com>
References: <1519079371-25493-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519079371-25493-1-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Lechner <david@lechnology.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>, Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 19, 2018 at 11:29 PM, David Lechner <david@lechnology.com> wrote:

> This makes use of the gpio-ranges feature that connects GPIO
> controllers and PINMUX controllers.
>
> In da850.dtsi, pinctrl-single,gpio-range is added to the pinmux node
> and gpio-ranges is added to the GPIO node. Unfortunately, the way the
> pinctrl-single driver enumerates the pins (starting with LSB) causes
> them to be in reverse order compared to the way the gpios are assigned.
> As a result, we have to declare the mapping for each GPIO individually.
>
> This also lets us remove all of the GPIO pinmuxes from
> da850-lego-ev3.dts. (Other da850 boards do not currently have any
> GPIO pinmuxes declared.)
>
> Signed-off-by: David Lechner <david@lechnology.com>

Nice,
Acked-by: Linus Walleij <linus.wallei@linaro.org>

> +                       gpio-ranges = <&pmx_core   0  15 1>,
> +                                     <&pmx_core   1  14 1>,
> +                                     <&pmx_core   2  13 1>,
> +                                     <&pmx_core   3  12 1>,
> +                                     <&pmx_core   4  11 1>,
> +                                     <&pmx_core   5  10 1>,
> +                                     <&pmx_core   6   9 1>,
> +                                     <&pmx_core   7   8 1>,
> +                                     <&pmx_core   8   7 1>,
> +                                     <&pmx_core   9   6 1>,
> +                                     <&pmx_core  10   5 1>,
> +                                     <&pmx_core  11   4 1>,
> +                                     <&pmx_core  12   3 1>,
> +                                     <&pmx_core  13   2 1>,
> +                                     <&pmx_core  14   1 1>,
> +                                     <&pmx_core  15   0 1>,

Heh the map moves backward how funny.

Sorry that we don't have an option to map that
any better in the ranges but hey, this works.

Yours,
Linus Walleij
