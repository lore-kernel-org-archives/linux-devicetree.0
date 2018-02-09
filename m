From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: reset: Add AXG AO Clock and Reset Bindings
Date: Fri, 9 Feb 2018 12:07:20 +0100
Message-ID: <CAOFm3uFj-7kZNp6b3SerOzQ8Amfa5Usod+MxwvZJ1E1Z_V9VJA@mail.gmail.com>
References: <20180209070026.193879-1-yixun.lan@amlogic.com> <20180209070026.193879-2-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180209070026.193879-2-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 9, 2018 at 8:00 AM, Yixun Lan <yixun.lan@amlogic.com> wrote:
> Add dt-bindings headers for the Meson-AXG's AO clock and
> reset controller.
>
> CC: <devicetree@vger.kernel.org>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  include/dt-bindings/clock/axg-aoclkc.h | 26 ++++++++++++++++++++++++++
>  include/dt-bindings/reset/axg-aoclkc.h | 20 ++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 include/dt-bindings/clock/axg-aoclkc.h
>  create mode 100644 include/dt-bindings/reset/axg-aoclkc.h
>
> diff --git a/include/dt-bindings/clock/axg-aoclkc.h b/include/dt-bindings/clock/axg-aoclkc.h
> new file mode 100644
> index 000000000000..78683abb4247
> --- /dev/null
> +++ b/include/dt-bindings/clock/axg-aoclkc.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD) */

nit... BSD is not a valid license id as documented in LICENSES [1] :
please use one of these:
BSD-2-Clause or BSD-3-Clause

Thank you!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LICENSES/preferred
-- 
Cordially
Philippe Ombredanne
