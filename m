From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V6 1/2] kbuild: centralize .dts->.dtb rule
Date: Wed, 14 Nov 2012 19:20:52 +0000
Message-ID: <20121114192052.4A3EA3E0B7C@localhost>
References: <1352753907-3316-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1352753907-3316-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-arch-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Michal Marek <mmarek@suse.cz>
Cc: David Gibson <david@gibson.dropbear.id.au>, Jon Loeliger <jdl@jdl.com>, Rob Herring <rob.herring@calxeda.com>, Scott Wood <scottwood@freescale.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arch@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Ralf Baechle <ralf@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On Mon, 12 Nov 2012 13:58:26 -0700, Stephen Warren <swarren@wwwdotorg.org> wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> All architectures that use cmd_dtc do so in the same way. Move the build
> rule to a central location to avoid duplication.
> 
> Update Documentation/kbuild to remove the explicit call to cmd_dtc from
> the example, now that the rule exists in a centralized location, and in
> fact replace the example with a couple that still exist.
> 
> arch/mips changes courtesy of Ralf Baechle.
> 
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> v6: Added arch/{arm64,microblaze,mips} updates.
> v5: Updated Documentation/kbuild.
> v4: No change.
> v3: No change.
> v2: New patch.

Merged, thanks.

g.
