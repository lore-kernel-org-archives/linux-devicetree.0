Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ea0-f181.google.com ([209.85.215.181]:64485 "EHLO
	mail-ea0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964877Ab3HHMcJ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 8 Aug 2013 08:32:09 -0400
Received: by mail-ea0-f181.google.com with SMTP id d10so1421370eaj.40
        for <devicetree@vger.kernel.org>; Thu, 08 Aug 2013 05:32:07 -0700 (PDT)
Date: Thu, 8 Aug 2013 13:32:03 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2 1/1] mfd: palmas: Add power off control
Message-ID: <20130808123203.GD14515@lee--X1>
References: <1375962305-7438-1-git-send-email-bilhuang@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1375962305-7438-1-git-send-email-bilhuang@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: Bill Huang <bilhuang@nvidia.com>
Cc: sameo@linux.intel.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob@landley.net, broonie@linaro.org, nm@ti.com, j-keerthy@ti.com, grant.likely@linaro.org, ian@slimlogic.co.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, 08 Aug 2013, Bill Huang wrote:

> Hook up "pm_power_off" to palmas power off routine if there is DT
> property "ti,system-power-controller" defined, so platform which is
> powered by this regulator can be powered off properly.
> 
> Signed-off-by: Mallikarjun Kasoju <mkasoju@nvidia.com>
> Signed-off-by: Bill Huang <bilhuang@nvidia.com>
> ---
>  .../devicetree/bindings/regulator/palmas-pmic.txt  |    5 +++
>  drivers/mfd/palmas.c                               |   33 ++++++++++++++++++--
>  include/linux/mfd/palmas.h                         |    1 +
>  3 files changed, 37 insertions(+), 2 deletions(-)

Was a clear conclusion reached between Nishanth and yourself?

As he has strong opinions on this I'd ideally like his Ack before
applying the patch.

-- 
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
