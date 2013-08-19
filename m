Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:58961 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751310Ab3HSMCg (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 19 Aug 2013 08:02:36 -0400
Received: by mail-ee0-f50.google.com with SMTP id d51so2121627eek.9
        for <devicetree@vger.kernel.org>; Mon, 19 Aug 2013 05:02:35 -0700 (PDT)
Date: Mon, 19 Aug 2013 13:02:30 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] max77693: added device tree support
Message-ID: <20130819120230.GB21520@lee--X1>
References: <20130819104409.GA21520@lee--X1>
 <1376912426-14747-1-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1376912426-14747-1-git-send-email-a.hajda@samsung.com>
Sender: devicetree-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> max77693 mfd main device uses only wakeup field
> from max77693_platform_data. This field is mapped
> to wakeup-source common property in device tree.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>
> ---
>  Documentation/devicetree/bindings/mfd/max77693.txt |  2 +
>  drivers/mfd/max77693.c                             | 50 ++++++++++++++++------
>  2 files changed, 39 insertions(+), 13 deletions(-)

Well, I know this patch has been sat on the MLs for some time now, so
anyone who wanted to have a say have has plenty of opportunity and the
patch looks good to me now, so:

Applied, thanks.

-- 
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
