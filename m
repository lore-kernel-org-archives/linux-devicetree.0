From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH 0/6 v3] Update TPS65910 to boot using devicetree
Date: Fri, 11 May 2012 11:38:42 +0200
Message-ID: <20120511093842.GC1214@sortiz-mobl>
References: <1336502563-31789-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1336502563-31789-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Liam Girdwood <lrg@ti.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Rhyland,

On Tue, May 08, 2012 at 11:42:37AM -0700, Rhyland Klein wrote:
> This patch set updates the tps65910 driver to boot using devicetree.
> 
> This patch set now uses the new addition to the of_regulator code,
> of_regulator_match to find all the regulator init data for the device.
> 
> Rhyland Klein (6):
>   mfd: tps65910: Commonize regmap access through header
>   regulator: tps65910: Add device tree bindings
>   mfd: tps65910: Add device-tree support
>   regulator: tps65910 regulator: add device tree support
>   mfd: tps65910-irq: Add devicetree init support
>   ARM: Tegra: Add support for TPS65910 PMIC
I applied patches 1,2 and 3 to my for-next branch.
Patch 4 is a regulator one, I assume Mark is going to take it. And patch 5
needs some additional work.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
