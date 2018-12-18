From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] clk: qcom: smd: Add support for MSM8998 rpm clocks
Date: Tue, 18 Dec 2018 08:55:43 -0600
Message-ID: <20181218145543.GA10329@bogus>
References: <1545099336-5615-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545099336-5615-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, 17 Dec 2018 19:15:36 -0700, Jeffrey Hugo wrote:
> Add rpm smd clocks, PMIC and bus clocks which are required on MSM8998
> for clients to vote on.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
> v4
> -Fix compile issue
> 
> v3
> -Ensure Marc's hang was addressed by GCC fixes
> -Renamed the bb clks to ln_bb to match the schematics
> 
> v2
> -fix compatible ordering nits per Stephen 
> 
>  .../devicetree/bindings/clock/qcom,rpmcc.txt       |  1 +
>  drivers/clk/qcom/clk-smd-rpm.c                     | 63 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h             | 10 ++++
>  3 files changed, 74 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
