From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/4] regulator: tps65090: add DT support
Date: Mon, 14 Jan 2013 22:32:18 +0900
Message-ID: <20130114133216.GA25037@opensource.wolfsonmicro.com>
References: <1356686981-4152-1-git-send-email-ldewangan@nvidia.com>
 <1356686981-4152-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1356686981-4152-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: sameo@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, lrg@ti.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 28, 2012 at 02:59:39PM +0530, Laxman Dewangan wrote:
> Add DT support for TI PMIC tps65090 regulator driver. The DT of this
> device have node regulator and all regulator's node of this device is
> added under this node.

Reviewed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Seems sensible for this to go via MFD given that there's more MFD in the
series than regulator.
