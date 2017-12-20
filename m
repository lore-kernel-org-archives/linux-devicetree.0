From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 10/15] devicetree: bindings: Document qcom,kpss-gcc
Date: Wed, 20 Dec 2017 15:13:28 -0600
Message-ID: <20171220211328.wbhaxcisz6bzxxql@rob-hp-laptop>
References: <1513698900-10638-1-git-send-email-sricharan@codeaurora.org>
 <1513698900-10638-11-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513698900-10638-11-git-send-email-sricharan@codeaurora.org>
Sender: linux-pm-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 09:24:55PM +0530, Sricharan R wrote:
> From: Stephen Boyd <sboyd@codeaurora.org>
> 
> The ACC and GCC regions present in KPSSv1 contain registers to
> control clocks and power to each Krait CPU and L2. Documenting
> the bindings here.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  .../devicetree/bindings/arm/msm/qcom,kpss-acc.txt  |  7 +++++
>  .../devicetree/bindings/arm/msm/qcom,kpss-gcc.txt  | 32 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
