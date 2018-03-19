From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 06/10] clk: qcom: cpu-8996: Add support to switch below
 600Mhz
Date: Mon, 19 Mar 2018 10:49:17 -0700
Message-ID: <152148175721.242365.10681079887712146412@swboyd.mtv.corp.google.com>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-7-git-send-email-ilialin@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1518616792-29028-7-git-send-email-ilialin@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, rnayak@codeaurora.org, robh@kernel.org, will.deacon@arm.com, amit.kucheria@linaro.org, tfinkel@codeaurora.org, ilialin@codeaurora.org, nicolas.dechesne@linaro.org, celster@codeaurora.org
List-Id: devicetree@vger.kernel.org

Quoting Ilia Lin (2018-02-14 05:59:48)
> From: Rajendra Nayak <rnayak@codeaurora.org>
> 
> The CPU clock controllers primary PLL operates on a single VCO range,

s/controllers/controller's/

> between 600Mhz and 3Ghz. However the CPUs do support OPPs with
> frequencies between 300Mhz and 600Mhz. In order to support running the

capitalize 'h' in units please.

> CPUs at those frequencies we end up having to lock the PLL at twice the
> rate and drive the CPU clk via the PLL/2 output and SMUX.
> 
> So for frequencies above 600Mhz we follow the following path
>  Primary PLL --> PLL_EARLY --> PMUX(1) --> CPU clk
> and for frequencies between 300Mhz and 600Mhz we follow
>  Primary PLL --> PLL/2 --> SMUX(1) --> PMUX(0) --> CPU clk
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>

Rest looks ok, please resend.
