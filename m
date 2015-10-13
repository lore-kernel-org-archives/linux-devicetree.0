From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 09/10] clk: ns2: add clock support for Broadcom Northstar
 2 SoC
Date: Tue, 13 Oct 2015 11:39:30 -0700
Message-ID: <561D4FE2.4020805@codeaurora.org>
References: <1443826665-17570-1-git-send-email-jonmason@broadcom.com>
 <1443826665-17570-10-git-send-email-jonmason@broadcom.com>
 <20151010003352.GA26883@codeaurora.org> <20151012181929.GG20867@broadcom.com>
 <561D36A6.2080309@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <561D36A6.2080309@broadcom.com>
Sender: linux-clk-owner@vger.kernel.org
To: Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 10/13/2015 09:51 AM, Scott Branden wrote:
>
> Is that really necessary at all  I think something like this work
> instead?
>
> -obj-$(CONFIG_ARCH_BCM)            += bcm/
> +obj-y        += bcm/
>
>

Yes that's fine too, as long as we don't add any obj-y inside bcm/Makefile

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

