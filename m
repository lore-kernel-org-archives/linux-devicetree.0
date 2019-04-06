From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: clk: axg-audio: add g12a support
Date: Sat, 06 Apr 2019 01:05:51 -0500
Message-ID: <5ca841c1.1c69fb81.44d14.3a88@mx.google.com>
References: <20190329160649.31603-1-jbrunet@baylibre.com> <20190329160649.31603-2-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329160649.31603-2-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 29 Mar 2019 17:06:46 +0100, Jerome Brunet wrote:
> Add a new compatible string and additional clock ids for audio clock
> controller of the g12a SoC family.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.txt          |  3 ++-
>  include/dt-bindings/clock/axg-audio-clkc.h             | 10 ++++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
