Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:63356 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754181Ab3GaJ4m (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 31 Jul 2013 05:56:42 -0400
Received: by mail-bk0-f54.google.com with SMTP id it19so164752bkc.27
        for <devicetree@vger.kernel.org>; Wed, 31 Jul 2013 02:56:41 -0700 (PDT)
Date: Wed, 31 Jul 2013 10:56:36 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] mfd: palmas: Add power off control
Message-ID: <20130731095636.GB13298@lee--X1>
References: <1375185957-28212-1-git-send-email-bilhuang@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1375185957-28212-1-git-send-email-bilhuang@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: Bill Huang <bilhuang@nvidia.com>
Cc: sameo@linux.intel.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob@landley.net, broonie@linaro.org, nm@ti.com, j-keerthy@ti.com, grant.likely@linaro.org, ian@slimlogic.co.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, 30 Jul 2013, Bill Huang wrote:

> Hook up "pm_power_off" to palmas power off routine if there is DT
> property "ti,system-power-controller" defined, so platform which is
> powered by this regulator can be powered off properly.
> 
> Based on work by:
> Mallikarjun Kasoju <mkasoju@nvidia.com>
> 
> Signed-off-by: Bill Huang <bilhuang@nvidia.com>
> cc: Mallikarjun Kasoju <mkasoju@nvidia.com>

Please put the 'Cc:' (not 'cc:') above the SoBs, then drop the "Based
on work by:" and replace with:

Signed-off-by: Mallikarjun Kasoju <mkasoju@nvidia.com>
Signed-off-by: Bill Huang <bilhuang@nvidia.com>

This insinuates that the original patch was crated by Mallikarjun.

-- 
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
