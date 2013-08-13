Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ea0-f171.google.com ([209.85.215.171]:52402 "EHLO
	mail-ea0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753615Ab3HMK2H (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2013 06:28:07 -0400
Received: by mail-ea0-f171.google.com with SMTP id n15so4037785ead.30
        for <devicetree@vger.kernel.org>; Tue, 13 Aug 2013 03:28:05 -0700 (PDT)
Date: Tue, 13 Aug 2013 11:27:57 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 2/3] mfd: palmas: add support for external control
 configuration
Message-ID: <20130813102757.GA15278@lee--X1>
References: <1376380392-19723-1-git-send-email-ldewangan@nvidia.com>
 <1376380392-19723-3-git-send-email-ldewangan@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1376380392-19723-3-git-send-email-ldewangan@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@kernel.org, sameo@linux.intel.com, swarren@wwwdotorg.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, rob@landley.net, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gg@slimlogic.co.uk, kishon@ti.com, j-keerthy@ti.com, ian.campbell@citrix.com
List-ID: <devicetree@vger.kernel.org>

> Some of Palmas resources like clock, SMPSs, LDOs etc can be controlled
> by external pins ENABLE1, ENABLE2 or NSLEEP.
> 
> Add support to configure these resources to externally controlled.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> Changes from V1:
> Fix typos: palams ->palmas
> 
>  drivers/mfd/palmas.c       |   97 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/palmas.h |   49 ++++++++++++++++++++++
>  2 files changed, 146 insertions(+), 0 deletions(-)

Patch looks good to me. Unless anyone else has an opinion:

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
