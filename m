From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: axg-audio: unexpose controller inputs
Date: Thu, 28 Feb 2019 12:27:31 -0600
Message-ID: <20190228182731.GA25353@bogus>
References: <20190213095835.17448-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190213095835.17448-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Maxime Jourdan <mjourdan@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Wed, 13 Feb 2019 10:58:35 +0100, Jerome Brunet wrote:
> Remove the bindings ID of the clock input of the controller. These
> clocks are purely internal to the controller, exposing them was a
> mistake. Actually, these should not even be in the provider and have
> IDs to begin with.
> 
> Unexpose these IDs before:
>  * someone starts using them (even if there no valid reason to do so)
>  * the actual clocks are removed. The fact that they exist is just the
>    result of an ugly hack. This will be resolved in CCF when we can
>    reference DT directly in parent table.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/axg-audio.h              | 20 ++++++++++++++++++++
>  include/dt-bindings/clock/axg-audio-clkc.h | 20 --------------------
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
