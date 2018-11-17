From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] Documentation: bindings: Add missing Amlogic SCPI
 sensor bindings
Date: Sat, 17 Nov 2018 10:21:33 -0600
Message-ID: <20181117162133.GA25151@bogus>
References: <20181108135352.8459-1-jbrunet@baylibre.com>
 <20181108135352.8459-4-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181108135352.8459-4-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu,  8 Nov 2018 14:53:51 +0100, Jerome Brunet wrote:
> amlogic,meson-gxbb-scpi-sensors is both the driver and DT but is not
> documented. Just add it to amlogic's scpi documentation
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic,scpi.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
