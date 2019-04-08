From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/4] clk: meson: g12a audio clock controller support
Date: Mon, 8 Apr 2019 10:00:43 +0200
Message-ID: <be07a005-acd6-c002-1ac1-e5c47dbb181d@baylibre.com>
References: <20190329160649.31603-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329160649.31603-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 29/03/2019 17:06, Jerome Brunet wrote:
> This patchset updates the axg audio controller to support the audio
> controller of the g12a SoC family.
> 
> Jerome Brunet (3):
>   dt-bindings: clk: axg-audio: add g12a support
>   clk: meson: axg_audio: replace prefix axg by aud
>   clk: meson: axg-audio: don't register inputs in the onecell data
> 
> Maxime Jourdan (1):
>   clk: meson: axg-audio: add g12a support
> 
>  .../bindings/clock/amlogic,axg-audio-clkc.txt |    3 +-
>  drivers/clk/meson/axg-audio.c                 | 1219 ++++++++++-------
>  drivers/clk/meson/axg-audio.h                 |   36 +-
>  include/dt-bindings/clock/axg-audio-clkc.h    |   10 +
>  4 files changed, 736 insertions(+), 532 deletions(-)
> 

Applied patch 1 to next/headers and patch [2, 3, 4] to next/drivers for Linux 5.2-rc1

Neil
