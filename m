From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] mfd: dt: tps65910: add power off control
Date: Fri, 17 Aug 2012 13:06:22 -0600
Message-ID: <502E962E.1060002@wwwdotorg.org>
References: <1345194989-11614-1-git-send-email-bilhuang@nvidia.com> <1345194989-11614-3-git-send-email-bilhuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1345194989-11614-3-git-send-email-bilhuang@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: sameo@linux.intel.com, broonie@opensource.wolfsonmicro.com, lrg@slimlogic.co.uk
Cc: Bill Huang <bilhuang@nvidia.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, ldewangan@nvidia.com, thierry.reding@avionic-design.de, xxie@nvidia.com, jhovold@gmail.com, kyle.manna@fuel7.com, rklein@nvidia.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/17/2012 03:16 AM, Bill Huang wrote:
> Add DT property "ti,system-power-controller" telling whether or not this
> pmic is in charge of controlling the system power, so the power off
> routine can be hooked up to system call "pm_power_off".
> 
> Based on the work by:
> Dan Willemsen <dwillemsen@nvidia.com>
> 
> Signed-off-by: Bill Huang <bilhuang@nvidia.com>

Tested-by: Stephen Warren <swarren@wwwdotorg.org>

AFAIK, this one doesn't have any conflicts.
