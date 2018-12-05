From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] clk: meson: add clk-input helper
Date: Wed, 5 Dec 2018 11:16:21 +0100
Message-ID: <88cc4a9c-d51d-ee34-3e38-36645e53bb13@baylibre.com>
References: <20181204165819.21541-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204165819.21541-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/12/2018 17:58, Jerome Brunet wrote:
> When the related bindings get merged, we will add more input clocks
> to the different amlogic clock controllers. Instead of copying this
> code around, lets create an helper function and use it.
> 
> Jerome Brunet (2):
>   clk: meson: add clk-input helper function
>   clk: meson: axg-audio: use the clk input helper function
> 
>  drivers/clk/meson/Makefile    |  2 +-
>  drivers/clk/meson/axg-audio.c | 83 ++++++++++-------------------------
>  drivers/clk/meson/clk-input.c | 44 +++++++++++++++++++
>  drivers/clk/meson/clkc.h      |  5 +++
>  4 files changed, 74 insertions(+), 60 deletions(-)
>  create mode 100644 drivers/clk/meson/clk-input.c
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Will be useful for the next cycle to take in account the controller input clocks
defined in the DT.

Applied on next/drivers

Neil
