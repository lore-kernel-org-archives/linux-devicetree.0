From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v2 0/2] mfd: dt: add power off support for Tegra20/Tegra30
Date: Tue, 11 Sep 2012 18:07:07 +0200
Message-ID: <20120911160707.GT3647@sortiz-mobl>
References: <1345424876-4365-1-git-send-email-bilhuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1345424876-4365-1-git-send-email-bilhuang@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bill Huang <bilhuang@nvidia.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, broonie@opensource.wolfsonmicro.com, ldewangan@nvidia.com, thierry.reding@avionic-design.de, swarren@wwwdotorg.org, xxie@nvidia.com, lrg@slimlogic.co.uk, jhovold@gmail.com, kyle.manna@fuel7.com, rklein@nvidia.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bill,

On Sun, Aug 19, 2012 at 06:07:54PM -0700, Bill Huang wrote:
> This patch series add new property into regulator DT for telling whether or not
> to hook pmic's power off routine to system call "pm_power_off".
> 
> Patch 1 add power off support for Tegra20 boards using TPS6586x
> Patch 2 add power off support for Tegra30 boards using TPS65910
> 
> Verified on Seaboard (Tegra20) and Cardhu (Tegra30)
> 
> V2:
> * Take multiple pmic instances into consideration while assigning global variables
>   as per suggestion from Thierry Reding <thierry.reding@avionic-design.de>
> 
> V1:
> * Based on master branch of sameo/mfd-2.6.git
> 
> Bill Huang (2):
>   mfd: dt: tps6586x: Add power off control
>   mfd: dt: tps65910: add power off control
> 
>  Documentation/devicetree/bindings/mfd/tps65910.txt |    4 +++
>  .../devicetree/bindings/regulator/tps6586x.txt     |    6 +++++
>  drivers/mfd/tps6586x.c                             |   19 +++++++++++++++++
>  drivers/mfd/tps65910.c                             |   22 ++++++++++++++++++++
>  include/linux/mfd/tps6586x.h                       |    1 +
>  include/linux/mfd/tps65910.h                       |    3 ++
>  6 files changed, 55 insertions(+), 0 deletions(-)
I applied those 2 patches to my for-next branch, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
