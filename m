From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V3 1/3] ARM: dts: db8500: add property "regulator-compatible"
 regulator node
Date: Wed, 20 Jun 2012 12:48:41 -0600
Message-ID: <4FE21B09.5000901@wwwdotorg.org>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com> <1340194987-23654-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1340194987-23654-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@opensource.wolfsonmicro.com, lrg@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, arnd@arndb.de, linus.walleij@linaro.org, lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/20/2012 06:23 AM, Laxman Dewangan wrote:
> Device's regulator matches their hardware counterparts with the
> property "regulator-compatible" of each child regulator node in
> place of the child node name.
> Add the property "regulator-compatible" for each regulator with
> their hardware counterpart's name.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

This change is correct as far as it goes, so:
Acked-by: Stephen Warren <swarren@wwwdotorg.org>

That said, the DT still should be modified to match the rules of correct
DT formatting. That was a pre-existing issue though, so it's OK if that
doesn't happen in this patch, and I'm happy leaving that to the
maintainers of this file.
