Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:48772 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754940Ab3HEHoL (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2013 03:44:11 -0400
Received: by mail-wi0-f172.google.com with SMTP id hj13so1116049wib.5
        for <devicetree@vger.kernel.org>; Mon, 05 Aug 2013 00:44:10 -0700 (PDT)
Date: Mon, 5 Aug 2013 08:44:05 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 3/3] pinctrl: palmas: add pincontrol driver
Message-ID: <20130805074405.GA29942@lee--X1>
References: <1375688014-6117-1-git-send-email-ldewangan@nvidia.com>
 <1375688014-6117-4-git-send-email-ldewangan@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1375688014-6117-4-git-send-email-ldewangan@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: swarren@wwwdotorg.org, linus.walleij@linaro.org, ian.campbell@citrix.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, rob@landley.net, sameo@linux.intel.com, grant.likely@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gg@slimlogic.co.uk, kishon@ti.com
List-ID: <devicetree@vger.kernel.org>

On Mon, 05 Aug 2013, Laxman Dewangan wrote:

> TI Palmas series Power Management IC have multiple pins which can be
> configured for different functionality. This pins can be configured
> for different function. Also their properties like pull up/down,
> open drain enable/disable are configurable.
> 
> Add support for pincontrol driver Palmas series device like TPS65913,
> TPS80036. The driver supports to be register from DT only.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> Changes from V1: 
> - Use pinconf generic properties to define the Palmas pincontrol nodes.
> - Nit and cleanups, typo fixes, rephrasing the sentences etc.
> - Use pin specific APIs for setting pin configuration rather than group
>   specific.
> 
>  .../devicetree/bindings/pinctrl/pinctrl-palmas.txt |  107 ++
>  drivers/pinctrl/Kconfig                            |   10 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-palmas.c                   | 1085 ++++++++++++++++++++
>  include/linux/mfd/palmas.h                         |   35 +-

For the MFD stuff:

Acked-by: Lee Jones <lee.jones@linaro.org>

>  5 files changed, 1227 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-palmas.txt
>  create mode 100644 drivers/pinctrl/pinctrl-palmas.c

-- 
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
