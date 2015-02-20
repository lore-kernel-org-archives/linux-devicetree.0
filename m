From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 0/3] Add initial DT support for Qualcomm SPMI PMIC devices
Date: Thu, 19 Feb 2015 16:49:16 -0800
Message-ID: <54E6848C.1090405@codeaurora.org>
References: <1422965880-11047-1-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1422965880-11047-1-git-send-email-iivanov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/03/15 04:17, Ivan T. Ivanov wrote:
> Following set of patches add initial DT support for PMIC devices
> found on recent Quqalcomm chipsets. Details for SPMI bus and PMIC arbiter
> could be found here [1].

Can you please put the specific compatible strings for the pmic model
into the nodes in addition to the generic "qcom,spmi-pmic"? We may want
to have regmap config tables in the future that describe the
cache/read/write abilities of the regsiters. If all we have is the
generic binding then we don't have a way to populate these tables.
Unless the plan there is to use the revid registers?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
