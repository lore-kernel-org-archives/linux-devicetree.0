From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: meson8b: export the video decoder clocks
Date: Sun, 31 Mar 2019 01:41:47 -0500
Message-ID: <5ca0612d.1c69fb81.96e6a.76a9@mx.google.com>
References: <20190324151423.19063-1-martin.blumenstingl@googlemail.com> <20190324151423.19063-2-martin.blumenstingl@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190324151423.19063-2-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, mjourdan@baylibre.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 24 Mar 2019 16:14:22 +0100, Martin Blumenstingl wrote:
> Export the four video decoder clocks so they can be used by the video
> decoder driver:
> - VDEC_1
> - VDEC_HCODEC
> - VDEC_2
> - VDEC_HEVC
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  include/dt-bindings/clock/meson8b-clkc.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
