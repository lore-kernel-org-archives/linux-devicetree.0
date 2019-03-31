From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/6] dt-bindings: gpu: mali-utgard: add hisilicon,hi6220-mali compatible
Date: Sun, 31 Mar 2019 01:40:43 -0500
Message-ID: <5ca060ec.1c69fb81.fbdbb.9da4@mx.google.com>
References: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org> <1552937931-23050-2-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552937931-23050-2-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de, xuwei5@hisilicon.com, mturquette@baylibre.com, sboyd@kernel.org, john.stultz@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, yuq825@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, 18 Mar 2019 19:38:46 +0000, Peter Griffin wrote:
> The Hisilicon hi6220 uses a Mali-450MP4 with 4 PPs, so add
> a compatible for it.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
