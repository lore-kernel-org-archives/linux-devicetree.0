From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v3 1/2] clk: sunxi: Add sun6i/8i video support
Date: Tue, 2 Feb 2016 17:19:15 +0000
Message-ID: <CACvgo53f8Sr_dEAx_mcvjXciK01mY7TUDguOJ-HzNur-PpmMZw@mail.gmail.com>
References: <cover.1454427223.git.moinejf@free.fr>
	<8fdfe5fe7715f19416d654964e55721b30237b38.1454427224.git.moinejf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <8fdfe5fe7715f19416d654964e55721b30237b38.1454427224.git.moinejf@free.fr>
Sender: linux-clk-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Dave Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Emilio Lopez <emilio@elopez.com.ar>, Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jean-Francois,

On 1 February 2016 at 07:43, Jean-Francois Moine <moinejf@free.fr> wrote:
> Add the clock types which are used by the sun6i/8i families for video.
>
> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> ---
> v3: (no change)
> v2:
>         - remarks from Chen-Yu Tsai
>         - DT documentation added
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |   2 +
>  drivers/clk/sunxi/clk-sun6i-display.c             | 106 +++++++++++++
>  drivers/clk/sunxi/clk-sun6i-pll3.c                | 174 ++++++++++++++++++++++
>  3 files changed, 282 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk-sun6i-display.c
>  create mode 100644 drivers/clk/sunxi/clk-sun6i-pll3.c
>
Something is missing here - namely the changes to the Makefile. Does
this series work or did you simply forget git add ?

Regards,
Emil
