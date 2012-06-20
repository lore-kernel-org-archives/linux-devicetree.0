From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 2/3] regulator: dt: regulator match by regulator-compatible
Date: Wed, 20 Jun 2012 19:24:09 +0000
Message-ID: <201206201924.09618.arnd@arndb.de>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com> <1340194987-23654-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1340194987-23654-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@opensource.wolfsonmicro.com, lrg@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, linus.walleij@linaro.org, lee.jones@linaro.org, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 20 June 2012, Laxman Dewangan wrote:
> Match the device's regulators with the property of
> "regulator-compatible" of each regulator node.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
> ---
> Changes from V1:
> - In place of adding new api, modify the existing api of_regulator_match() to
> look regulator-compatible for matching.
> 
> Changes from V2:
> - Add break if the regualtor match found.


I've read the entire series a few times and I still can't figure out
why you're doing it. *Please* describe what the change is good for,
now what you are doing in it.

All I can tell from the patch and/or description right now is that
you are adding a third identifier next the phandle and the
"regulalator-name", but not why this is a good idea.

Specifically, please explain these two things in the changelog:

1. What is it that the new property can express that cannot already
be expressed by using the phandle.

2. Why is it called "regulator-compatible"? If it's similar to the
"compatible" property, don't you have to have a binding for each
possible string? If it's not related to the "compatible" property,
why is it named in a similar way?

	Arnd
