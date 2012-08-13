From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V3] regulator: tps6586x: add support for SYS rail
Date: Mon, 13 Aug 2012 21:04:59 +0100
Message-ID: <20120813200458.GA21207@opensource.wolfsonmicro.com>
References: <1344152518-29378-1-git-send-email-ldewangan@nvidia.com>
 <50293CA1.80900@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <50293CA1.80900@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, sameo@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, swarren@nvidia.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 13, 2012 at 11:42:57AM -0600, Stephen Warren wrote:

> This patch appears to have been applied correctly as b93fffb in your
> tree, but your for-next branch merge commit f110340 appears to have
> dropped the following two hunks:

Ugh, the device tree cleanup that we're making urgently to Linus' tree
for some reason I can't remember conflicts with the new code but looks
like a rename.  I'll try to remember to fix next time I merge.
