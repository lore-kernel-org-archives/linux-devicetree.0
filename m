From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] regulator: tps6586x: add support for SYS rail
Date: Sat, 4 Aug 2012 01:52:34 +0100
Message-ID: <20120804005234.GH4515@opensource.wolfsonmicro.com>
References: <1343906193-8309-1-git-send-email-ldewangan@nvidia.com>
 <501AAE55.3080504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <501AAE55.3080504@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, sameo@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, swarren@nvidia.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 02, 2012 at 10:44:05AM -0600, Stephen Warren wrote:
> On 08/02/2012 05:16 AM, Laxman Dewangan wrote:

> >         .desc   = {                                                     \
> > +               .supply_name = "sys",                                   \
> >                 .name   = "REG-SYS",                                    \
> >                 .ops    = &tps6586x_sys_regulator_ops,                  \
> >                 .type   = REGULATOR_VOLTAGE,                            \

> BTW, this patch touches both the regulator and MFD trees. I'm not sure
> who will apply it. I think it relies on the patch to this driver Mark
> recently applied in the regulator tree (for 3.7 I think) doesn't it, at
> least for context?

It varies - it's usually whichever tree the change logically belongs in
(so adding a define for a new regulator in the MFD would go with the
rest of the implementation of a new regulator but a change in the
register I/O interface of the core would go via MFD).
