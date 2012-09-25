From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH 4/4] mfd: max8907: remove regulator-compatible from DT
 docs
Date: Tue, 25 Sep 2012 15:22:12 +0200
Message-ID: <20120925132212.GO28670@sortiz-mobl>
References: <1348514703-10152-1-git-send-email-swarren@wwwdotorg.org>
 <1348514703-10152-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1348514703-10152-5-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Laxman Dewangan <ldewangan@nvidia.com>, AnilKumar Ch <anilkumar@ti.com>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Sep 24, 2012 at 01:25:03PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Commit "regulator: deprecate regulator-compatible DT property" deprecated
> the use of the regulator-compatible DT property. Update the DT example in
> the MAX8907 binding documentation to reflect this.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> This commit is based on the MFD branch.
> ---
>  .../devicetree/bindings/regulator/max8907.txt      |   24 ++++++-------------
>  1 files changed, 8 insertions(+), 16 deletions(-)
Applied, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
