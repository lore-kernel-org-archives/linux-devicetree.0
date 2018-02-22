From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 7/7] watchdog: coh901327: make use of timeout-secs
 provided in devicetree
Date: Thu, 22 Feb 2018 15:01:30 +0100
Message-ID: <CACRpkdZzw+3DPvS7VOUzghmSgDTgDeCZ2i+FE=DCE+R5i1qycQ@mail.gmail.com>
References: <20180211200847.25000-1-marcus.folkesson@gmail.com>
 <20180211200847.25000-7-marcus.folkesson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180211200847.25000-7-marcus.folkesson@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Barry Song <baohua@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>, Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, Wim Van Sebroeck <wim@iguana.be>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Carlo Caione <carlo@caione.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Guenter
List-Id: devicetree@vger.kernel.org

On Sun, Feb 11, 2018 at 9:08 PM, Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:

> watchdog_init_timeout() will allways pick timeout_param since it
> defaults to a valid timeout.
>
> Following best practice described in
> Documentation/watchdog/watchdog-kernel-api.txt to make use of
> the parameter logic.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>
> Notes:
>     v3:
>         - Reformat and use coh901327_wdt.timeout instead of margin when print out
>           timout in probe function.
>
>     v2:
>         - Set .timeout in coh901327_wdt structure declaration.
>         - Set .min_timeout to 1 instead of 0. I could not find a datasheet
>           for coh901327, so I'm not sure if 0 is valid. However, 0 seems
>           wrong to me and most driver has 1 as min value. If it should
>           be 0, please let me know and I have to set another initial
>           value for margin.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
