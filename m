From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 2/2] dt-bindings: introduce Command DB for QCOM SoCs
Date: Fri, 16 Mar 2018 11:27:45 -0700
Message-ID: <152122486529.168459.15256316986315304276@swboyd.mtv.corp.google.com>
References: <20180314171330.1828-1-ilina@codeaurora.org>
 <20180314171330.1828-3-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180314171330.1828-3-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org
Cc: linux-soc@vger.kernel.org, rnayak@codeaurora.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org, Mahesh Sivasubramanian <msivasub@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Lina Iyer (2018-03-14 10:13:30)
> +Properties:
> +- compatible:
> +       Usage: required
> +       Value type: <string>
> +       Definition: Should be "qcom,cmd-db"
> +
> +- reg:
> +       Usage: required
> +       Value type: <prop encoded array>
> +       Definition: The register address that points to the location of the
> +                   Command DB in memory. Additionally, specify the address
> +                   and size of the actual lacation in memory.

s/lacation/location/ (seems this was missed from last round)

> +
> +Example:
> +
> +       reserved-memory {
> +               [...]
> +               qcom,cmd-db@c3f000c {
> +                       reg = <0x0 0xc3f000c 0x0 0x8>,
> +                             <0x0 0x85fe0000 0x0 0x20000>;

I agree with Bjorn and replied so on v4.

> +                       compatible = "qcom,cmd-db";
> +               };
> +       };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
