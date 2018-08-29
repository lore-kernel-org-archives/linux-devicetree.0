From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings/interrupt-controller: pdc: fix
 example to match actual bindings
Date: Tue, 28 Aug 2018 19:26:40 -0500
Message-ID: <20180829002640.GA9822@bogus>
References: <20180824191111.14571-1-ilina@codeaurora.org>
 <20180824191111.14571-2-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180824191111.14571-2-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, 24 Aug 2018 13:11:11 -0600, Lina Iyer wrote:
> The PDC map should use the GIC SPI port and not the vector. GIC
> internally adds 32 to SPI hwirq numbers.
> 
> Fixes: 1ae8862e27e ("dt-bindings/interrupt-controller: pdc: Describe PDC device binding")
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
