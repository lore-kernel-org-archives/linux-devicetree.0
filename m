From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] regulator: tps6586x: add support for SYS rail
Date: Thu, 2 Aug 2012 12:40:46 +0100
Message-ID: <20120802114046.GK29157@opensource.wolfsonmicro.com>
References: <1343906193-8309-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1343906193-8309-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: sameo@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, swarren@nvidia.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 02, 2012 at 04:46:33PM +0530, Laxman Dewangan wrote:

> +static const unsigned int tps6586x_sys_voltages[] = {
> +	5000000,
> +};

Is the system rail actually regulated or is it just a nominal 5V?
Normally it's just the raw, unregulated input switched in with FETs or
whatever.
