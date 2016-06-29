From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] [v6] net: emac: emac gigabit ethernet controller driver
Date: Wed, 29 Jun 2016 03:55:52 -0400 (EDT)
Message-ID: <20160629.035552.986002707989403517.davem@davemloft.net>
References: <1466812008-26686-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1466812008-26686-1-git-send-email-timur@codeaurora.org>
Sender: netdev-owner@vger.kernel.org
To: timur@codeaurora.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, sdharia@codeaurora.org, shankerd@codeaurora.org, vikrams@codeaurora.org, cov@codeaurora.org, gavidov@codeaurora.org, robh+dt@kernel.org, andrew@lunn.ch, bjorn.andersson@linaro.org, mlangsdo@redhat.com, jcm@redhat.com, agross@codeaurora.org, f.fainelli@gmail.com
List-Id: devicetree@vger.kernel.org

From: Timur Tabi <timur@codeaurora.org>
Date: Fri, 24 Jun 2016 18:46:48 -0500

> +	while (test_and_set_bit(EMAC_STATUS_RESETTING, &adpt->status))
> +		msleep(20); /* Reset might take few 10s of ms */
 ...
> +	while (test_and_set_bit(EMAC_STATUS_RESETTING, &adpt->status))
> +		msleep(20); /* Reset might take few 10s of ms */

You cannot spin in the kernel potentially forever if the tested
condition is never met.

Instead you must have some limit for the loop, and signal a failure
if it is reached.
