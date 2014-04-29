From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 4/4] devicetree: bindings: qcom,
 mmcc: Document GDSC binding
Date: Tue, 29 Apr 2014 00:07:37 -0700
Message-ID: <20140429070737.7224.72350@quantum>
References: <1396637136-29974-1-git-send-email-sboyd@codeaurora.org>
 <1396637136-29974-5-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1396637136-29974-5-git-send-email-sboyd@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, Saravana Kannan <skannan@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2014-04-04 11:45:36)
> +Example:
> +       clock-controller@4000000 {
> +               compatible = "qcom,mmcc-msm8974";
> +               reg = <0x4000000 0x1000>;
> +               #clock-cells = <1>;
> +               #reset-cells = <1>;
> +
> +               regulators {
> +                       gdsc_oxili_gx: gdsc_oxili_gx {
> +                               regulator-name = "gdsc_oxili_gx";

Hi Stephen,

It makes sense to model the gdsc's as regulators. It also makes sense to
nest them within the clock-controller node, assuming that matches the
register manual for your part.

However, does it make sense to put this new code under drivers/clk/qcom?
I don't see a compelling reason. How about breaking the registers out
into a header for easier reuse?

Regards,
Mike

> +                               parent-supply = <&pm8841_s4>;
> +                               qcom,retain-mem;
> +                               qcom,retain-periph;
> +                               qcom,skip-logic-collapse;
> +                               qcom,support-hw-trigger;
> +                       };
> +               };
> +       };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 
