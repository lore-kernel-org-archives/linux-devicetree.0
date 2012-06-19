From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 3/3] ARM: dts: db8500: add node property "regulator-compatible"
 regulator node
Date: Tue, 19 Jun 2012 11:29:44 -0600
Message-ID: <4FE0B708.20203@wwwdotorg.org>
References: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com> <1340116099-17629-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1340116099-17629-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, linus.walleij@linaro.org, lrg@ti.com, lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/19/2012 08:28 AM, Laxman Dewangan wrote:
> Device's regulator matches their hardware counterparts with the
> property "regulator-compatible" of each child regulator node in
> place of the child node.
> Add the property "regulator-compatible" for each regulator with
> their name.

In order to prevent "git bisect" failures, don't you need to squash this
patch into patch 1/3, so that there is no point in git history where the
code expects the regulator-compatible property to exist, yet the .dtsi
file doesn't have it?

Or you could do this:

patch 1: add register-compatible property to db8500.dtsi
patch 2: adjust the code to use register-compatible property
patch 3: rename nodes in db8500.dtsi

but I'm not sure there's any advantage to having multiple patches
(except for patch statistics counters, but we certainly don't want to
have legitimate allegations of patch padding!)
