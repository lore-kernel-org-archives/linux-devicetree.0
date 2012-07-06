From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2] regulator: tps65910: add support for input supply
Date: Fri, 06 Jul 2012 09:44:30 -0600
Message-ID: <4FF707DE.60403@wwwdotorg.org>
References: <1341564192-18154-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1341564192-18154-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, lrg@ti.com, swarren@nvidia.com, sameo@linux.intel.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 07/06/2012 02:43 AM, Laxman Dewangan wrote:
> There is multiple voltage input pins on device which
> takes the voltage input for different voltage regulator.
> Support to configure the voltage input supplied by
> different regulator for each regulators.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Acked-by: Stephen Warren <swarren@wwwdotorg.org>
(mainly the documentation, but I briefly scanned the code)
