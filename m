From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v10 1/3] dt-bindings: clock: Update GCC bindings for
 protected-clocks
Date: Mon, 26 Nov 2018 12:58:48 -0600
Message-ID: <20181126185848.GA4853@bogus>
References: <1542873221-13693-1-git-send-email-tdas@codeaurora.org>
 <1542873221-13693-2-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542873221-13693-2-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, 22 Nov 2018 13:23:39 +0530, Taniya Das wrote:
> Add protected-clocks list which could used to specify the clocks to be
> bypassed on certain devices.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
