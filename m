From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: sprd: Use SoC compatible
 string instead of wildcard string
Date: Mon, 18 Feb 2019 14:07:45 -0600
Message-ID: <20190218200745.GA8619@bogus>
References: <3818909a5d6f956ef30ff25cfc42f7550d062086.1550201284.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3818909a5d6f956ef30ff25cfc42f7550d062086.1550201284.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com, orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 15 Feb 2019 12:55:18 +0800, Baolin Wang wrote:
> Use SoC compatible string instead of wildcard string.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes from v1:
>  - Add 'sprd' to indicate the module in subject line.
> ---
>  .../devicetree/bindings/gpio/gpio-eic-sprd.txt     |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
