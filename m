Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:49397 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755715Ab3HFSy6 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 6 Aug 2013 14:54:58 -0400
Message-ID: <5201467D.9020803@wwwdotorg.org>
Date: Tue, 06 Aug 2013 12:54:53 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH V3 3/3] pinctrl: palmas: add pincontrol driver
References: <1375794755-6246-1-git-send-email-ldewangan@nvidia.com> <1375794755-6246-4-git-send-email-ldewangan@nvidia.com>
In-Reply-To: <1375794755-6246-4-git-send-email-ldewangan@nvidia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, ian.campbell@citrix.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, rob@landley.net, sameo@linux.intel.com, lee.jones@linaro.org, grant.likely@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gg@slimlogic.co.uk, kishon@ti.com
List-ID: <devicetree@vger.kernel.org>

On 08/06/2013 07:12 AM, Laxman Dewangan wrote:
> TI Palmas series Power Management IC have multiple pins which can be
> configured for different functionality. This pins can be configured
> for different function. Also their properties like pull up/down,
> open drain enable/disable are configurable.
> 
> Add support for pincontrol driver Palmas series device like TPS65913,
> TPS80036. The driver supports to be register from DT only.

I think this binding is reasonable enough, so that part,

Reviewed-by: Stephen Warren <swarren@nvidia.com>
