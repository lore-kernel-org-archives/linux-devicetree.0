From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCHv2 1/2] ARM: msm: Add support for MSM8974 Dragonboard
Date: Fri, 6 Sep 2013 09:22:37 -0500
Message-ID: <20A8A05D-2F56-4127-A494-470833B2DC42@codeaurora.org>
References: <1378425890-4225-1-git-send-email-rvaswani@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1378425890-4225-1-git-send-email-rvaswani@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rohit Vaswani <rvaswani@codeaurora.org>
Cc: David Brown <davidb@codeaurora.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Sep 5, 2013, at 7:04 PM, Rohit Vaswani wrote:

> This patch adds basic board support for MSM8974 Dragonboard
> which belongs to the Snapdragon 800 family.
> For now, just support a basic machine with device tree.
> 
> Signed-off-by: Rohit Vaswani <rvaswani@codeaurora.org>
> ---
> arch/arm/boot/dts/Makefile        |  3 ++-
> arch/arm/boot/dts/msm8974-db.dts  |  7 +++++++
> arch/arm/boot/dts/msm8974.dtsi    | 30 ++++++++++++++++++++++++++++++
> arch/arm/mach-msm/Kconfig         | 20 ++++++++++++++++++--
> arch/arm/mach-msm/Makefile        |  1 +
> arch/arm/mach-msm/board-dt-8974.c | 23 +++++++++++++++++++++++
> 6 files changed, 81 insertions(+), 3 deletions(-)
> create mode 100644 arch/arm/boot/dts/msm8974-db.dts
> create mode 100644 arch/arm/boot/dts/msm8974.dtsi
> create mode 100644 arch/arm/mach-msm/board-dt-8974.c

As I mentioned before, its the APQ8074 Dragonboard, not MSM8974

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
