From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] reset: dt-bindings: meson: update arb bindings for
 sm1
Date: Tue, 27 Aug 2019 12:03:20 -0500
Message-ID: <20190827170320.GA13577@bogus>
References: <20190820094625.13455-1-jbrunet@baylibre.com>
 <20190820094625.13455-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820094625.13455-2-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 20 Aug 2019 11:46:24 +0200, Jerome Brunet wrote:
> SM1 SoC family adds two new audio FIFOs with the related arb reset lines
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt  | 3 ++-
>  include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h        | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
