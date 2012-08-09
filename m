From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V3] regulator: tps6586x: add support for SYS rail
Date: Thu, 09 Aug 2012 11:10:58 -0600
Message-ID: <5023EF22.8010206@wwwdotorg.org>
References: <1344152518-29378-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1344152518-29378-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com, sameo@linux.intel.com
Cc: Laxman Dewangan <ldewangan@nvidia.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, swarren@nvidia.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 08/05/2012 01:41 AM, Laxman Dewangan wrote:
> Device have SYS rail which is always ON. It is system
> power bus. LDO5 and LDO_RTC get powered through this rail
> internally. Add support for this rail and make the
> LDO5/LDO_RTC input supply to "sys".
> Update document accordingly.

Sorry to bug people, but is everyone OK with this patch? I'm holding off
checking in the Tegra-side device tree changes that add regulators until
this patch is checked in (or at least approved) to make sure the Tegra
.dts patches don't need any more changes.

Thanks.
