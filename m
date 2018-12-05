From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/5] clk: meson: axg: add 32k clock generation
Date: Wed, 5 Dec 2018 10:50:10 +0100
Message-ID: <8e7ae6ab-a38b-d2ef-ecfc-58d198821b9c@baylibre.com>
References: <20181204165310.20806-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204165310.20806-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/12/2018 17:53, Jerome Brunet wrote:
> The goal of this patchset is to add the internal generation of the
> 32768Hz clock within the axg AO clock controller.
> 
> This was initially added has the CEC clock on gxbb. To properly
> integrate it on the axg, a simpler 'dual divider' driver is added.
> Then gxbb AO clock controller is reworked to use it. Finally the 32k
> clock tree is added to the AXG.
> 
> This patchset requires depends on this CCF change [0]
> 
> [0]: https://lkml.kernel.org/r/20181204163257.32085-1-jbrunet@baylibre.com
> 
> Jerome Brunet (5):
>   dt-bindings: clk: meson: add ao slow clock path ids
>   clk: meson: clean-up clock registration
>   clk: meson: add dual divider clock driver
>   clk: meson: gxbb-ao: replace cec-32k with the dual divider
>   clk: meson: axg-ao: add 32k generation subtree
> 
>  drivers/clk/meson/Makefile              |   3 +-
>  drivers/clk/meson/axg-aoclk.c           | 175 +++++++++++++++--
>  drivers/clk/meson/axg-aoclk.h           |  13 +-
>  drivers/clk/meson/clk-dualdiv.c         | 130 +++++++++++++
>  drivers/clk/meson/clkc.h                |  19 ++
>  drivers/clk/meson/gxbb-aoclk-32k.c      | 193 -------------------
>  drivers/clk/meson/gxbb-aoclk.c          | 238 +++++++++++++++++++-----
>  drivers/clk/meson/gxbb-aoclk.h          |  20 +-
>  drivers/clk/meson/meson-aoclk.c         |  15 +-
>  include/dt-bindings/clock/axg-aoclkc.h  |   7 +-
>  include/dt-bindings/clock/gxbb-aoclkc.h |   7 +
>  11 files changed, 527 insertions(+), 293 deletions(-)
>  create mode 100644 drivers/clk/meson/clk-dualdiv.c
>  delete mode 100644 drivers/clk/meson/gxbb-aoclk-32k.c
> 

Good move, it's good to have a common driver to enable USB device support for
GX and AXg families since they depends on the slow_clk path.

Tested-by: Neil Armstrong <narmstrong@baylibre.com>

and

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

And applied on next/drivers

Neil
