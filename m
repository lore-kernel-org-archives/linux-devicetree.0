From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: clk: meson: add ao slow clock path ids
Date: Wed, 19 Dec 2018 12:55:32 -0600
Message-ID: <20181219185532.GA23002@bogus>
References: <20181204165310.20806-1-jbrunet@baylibre.com>
 <20181204165310.20806-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181204165310.20806-2-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue,  4 Dec 2018 17:53:06 +0100, Jerome Brunet wrote:
> Add the CLKIDs for the slow clock generation path
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  include/dt-bindings/clock/axg-aoclkc.h  | 7 ++++++-
>  include/dt-bindings/clock/gxbb-aoclkc.h | 7 +++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
