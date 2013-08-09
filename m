Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:36929 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965056Ab3HIPlk convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 9 Aug 2013 11:41:40 -0400
Subject: Re: [PATCH] drivers/rtc/rtc-palmas.c: rename charging dt property name
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
From: Kumar Gala <galak@codeaurora.org>
In-Reply-To: <1376063230-22578-1-git-send-email-ldewangan@nvidia.com>
Date: Fri, 9 Aug 2013 10:41:42 -0500
Content-Transfer-Encoding: 8BIT
Message-Id: <429B5799-B625-47E9-A1A5-527FD0D28B3B@codeaurora.org>
References: <1376063230-22578-1-git-send-email-ldewangan@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: akpm@linux-foundation.org, grant.likely@linaro.org, rob.herring@calxeda.com, rob@landley.net, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, gg@slimlogic.co.uk, kishon@ti.com, swarren@nvidia.com, pawel.moll@arm.com, Mark.Rutland@arm.com, ian.campbell@citrix.com, broonie@kernel.org
List-ID: <devicetree@vger.kernel.org>


On Aug 9, 2013, at 10:47 AM, Laxman Dewangan wrote:

> Renaming the charging property names to have more meaningful:
> 
> Renaming property "ti,back-battery-charge-enable" to "ti,backup-battery-chargeable"
> to tells OS that attahced battery is chargeable and OS can do charging.
> 
> Renaming property "ti,back-battery-charge-low-current" to
> "ti,backup-battery-charge-high-current" for safe configuration as maximum charging current
> of battery depends on battery type and overcurrent charging can damage the battery. So
> enable the high current charging only if this property is available.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> The patch V4 version of the change
> [PATCH V4] drivers/rtc/rtc-palmas.c: support for backup battery charging
> is already applied but still the discussion is going on the property name.
> 
> To correct the property name, I am sending this patch on top of above patch
> as per discussion on above patch.
> 
> .../devicetree/bindings/rtc/rtc-palmas.txt         |   21 +++++++++++--------
> drivers/rtc/rtc-palmas.c                           |   14 ++++++------
> 2 files changed, 19 insertions(+), 16 deletions(-)

Acked-by: Kumar Gala <galak@codeaurora.org>

- k

--
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

