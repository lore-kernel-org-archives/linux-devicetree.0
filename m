Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:48767 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753683Ab3HEVh7 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2013 17:37:59 -0400
Message-ID: <52001B32.7070107@wwwdotorg.org>
Date: Mon, 05 Aug 2013 15:37:54 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH V2 1/3] pinctrl: add utility functions for add map/configs
References: <1375688014-6117-1-git-send-email-ldewangan@nvidia.com> <1375688014-6117-2-git-send-email-ldewangan@nvidia.com>
In-Reply-To: <1375688014-6117-2-git-send-email-ldewangan@nvidia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, ian.campbell@citrix.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, rob@landley.net, sameo@linux.intel.com, lee.jones@linaro.org, grant.likely@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gg@slimlogic.co.uk, kishon@ti.com
List-ID: <devicetree@vger.kernel.org>

On 08/05/2013 01:33 AM, Laxman Dewangan wrote:
> Some of pincontrol driver needs the utility function to create map
> list. The utility function needed for adding mux, configs etc.
> 
> In place of duplicating this in each driver, add the common utility
> function in common file and use from device specific driver. This will
> reduce the duplicating of code across drivers.

This patch,
Reviewed-by: Stephen Warren <swarren@nvidia.com>

Some more documentation mnight be useful though, now these are common
utility functions rather than just some internal functions in the Tegra
pinctrl driver.

Hopefully there will be a patch to convert at least the Tegra pinctrl
driver to use these new functions.
