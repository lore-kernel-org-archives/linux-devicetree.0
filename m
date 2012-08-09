From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V3] regulator: tps6586x: add support for SYS rail
Date: Thu, 9 Aug 2012 20:04:28 +0100
Message-ID: <20120809190428.GE24328@opensource.wolfsonmicro.com>
References: <1344152518-29378-1-git-send-email-ldewangan@nvidia.com>
 <5023EF22.8010206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5023EF22.8010206@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: sameo@linux.intel.com, Laxman Dewangan <ldewangan@nvidia.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, swarren@nvidia.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 09, 2012 at 11:10:58AM -0600, Stephen Warren wrote:

> Sorry to bug people, but is everyone OK with this patch? I'm holding off
> checking in the Tegra-side device tree changes that add regulators until
> this patch is checked in (or at least approved) to make sure the Tegra
> .dts patches don't need any more changes.

I decided to go ahead and apply without Samuel's review since the MFD
changes are very small but in general four days is a bit of a fast
turnaround for most things...
