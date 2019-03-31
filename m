From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: meson8b: export the VPU clock
Date: Sun, 31 Mar 2019 01:41:45 -0500
Message-ID: <5ca0612a.1c69fb81.9bbef.7249@mx.google.com>
References: <20190324151104.18397-1-martin.blumenstingl@googlemail.com> <20190324151104.18397-2-martin.blumenstingl@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190324151104.18397-2-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 24 Mar 2019 16:11:01 +0100, Martin Blumenstingl wrote:
> The VPU clock is an input the the "VPU" (Video Processing Unit), which is
> one of the components of the display controller.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  include/dt-bindings/clock/meson8b-clkc.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
