From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 6/6 v3] ARM: Tegra: Add support for TPS65910 PMIC
Date: Tue, 08 May 2012 09:56:02 -0600
Message-ID: <4FA94212.4000207@wwwdotorg.org>
References: <1336502563-31789-1-git-send-email-rklein@nvidia.com> <1336502563-31789-7-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336502563-31789-7-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Liam Girdwood <lrg@ti.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 05/08/2012 12:42 PM, Rhyland Klein wrote:
> Add support for the tps65910 pmic on cardhu.

Lets ignore this one patch for now; it's not clear whether Cardhu should
instantiate the TPS65910 or TPS62360 PMU; apparently different Cardhu
variants have one, the other, or even both. I'm trying to find out which
variant(s) is/are useful to support.

But this has no effect on the other patches in this series.
