From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 5/6] dt-bindings: reset: hisilicon: Add ao reset controller
Date: Sun, 31 Mar 2019 01:40:48 -0500
Message-ID: <5ca060f1.1c69fb81.2165c.a731@mx.google.com>
References: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org> <1552937931-23050-6-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552937931-23050-6-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de, xuwei5@hisilicon.com, mturquette@baylibre.com, sboyd@kernel.org, john.stultz@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, yuq825@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, 18 Mar 2019 19:38:50 +0000, Peter Griffin wrote:
> This is required to bring Mali450 gpu out of reset.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  include/dt-bindings/reset/hisi,hi6220-resets.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
