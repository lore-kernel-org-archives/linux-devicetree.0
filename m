From: Bryan Huntsman <bryanh@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add apq8096 dragonboard dts skeletons
Date: Tue, 01 Dec 2015 13:29:42 -0800
Message-ID: <565E1146.7050207@codeaurora.org>
References: <1448986275-16807-1-git-send-email-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448986275-16807-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>, agross@codeaurora.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, sboyd@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 12/01/2015 08:11 AM, Rajendra Nayak wrote:
> Add new dtsi and dts files for the apq8096 dragonboards with just
> a serial device used as debug console
> 
> While at it, also rearrange the Makefile so we have one dtb per line
> so as to be consistent with whats done on other platforms.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                 |  4 ++-
>  arch/arm64/boot/dts/qcom/apq8096-dragonboard.dts  | 21 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/apq8096-dragonboard.dtsi | 30 +++++++++++++++++++++++
>  3 files changed, 54 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/apq8096-dragonboard.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/apq8096-dragonboard.dtsi

One problem.  The board you have is not called a dragonboard.  Let's
check with the marketing folks on what they're calling it now.  We need
to explicitly avoid using dragonboard here as that name applies to a
different class of products.  Thanks.

- Bryan


-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a
Linux Foundation Collaborative Project
