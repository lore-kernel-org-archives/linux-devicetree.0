From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH REPOST] mfd: max8907: add power off control
Date: Wed, 19 Sep 2012 13:25:46 +0200
Message-ID: <20120919112546.GB8138@sortiz-mobl>
References: <1348008679-20582-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1348008679-20582-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: broonie@opensource.wolfsonmicro.com, ldewangan@nvidia.com, bilhuang@nvidia.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Tue, Sep 18, 2012 at 04:51:19PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Add DT property "maxim,system-power-controller" to indicate whether the
> PMIC is in charge of controlling the system power. If this is set, the
> driver will provide the pm_power_off() function.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> Samuel, I'm not sure if you have this in your list to process or not, nor
> if you prefer a patch to be reposted vs. a response to the original email;
> Mark Brown requested that for him at least I repost rather than reply, so
> I'm giving that a go everywhere.
Thanks for reposting. Patch is applied to my for-next branch now.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
