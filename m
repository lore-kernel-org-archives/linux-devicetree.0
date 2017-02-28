From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: apq8016-sbc: Add ramoops
Date: Mon, 27 Feb 2017 23:19:51 -0800
Message-ID: <20170228071951.GH25384@codeaurora.org>
References: <20170201102424.4017-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170201102424.4017-1-bjorn.andersson@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mart Raudsepp <leio@gentoo.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, John Stultz <john.stultz@linaro.org>, Andy Gross <andy.gross@linaro.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/01, Bjorn Andersson wrote:
> Declare a ramoops memory segment to aid debugging for those without UART
> access. Verified to carry console log when holding volume down for 15
> seconds.
> 
> I was unable to find any ramoops-like memory region used in the 8916
> downstream kernels, so the picked region is the last MB in System RAM.
> 
> No memory region for ramoops-like support was found downstrea, so the
> arbitrarily picked region is the last MB of System RAM.

Same comment twice? Otherwise it looks ok to me as long as you're
willing to lose an MB of ram. Does the kernel skip reserving the
ramoops memory if ramoops isn't enabled? That would be nice to do
so we don't lose memory if we're not enabling the driver.

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
