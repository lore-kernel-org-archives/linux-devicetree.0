From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH 1/2] mfd: wm8994: Add device ID data to WM8994 OF device
 IDs
Date: Fri, 19 Apr 2013 00:36:09 +0200
Message-ID: <20130418223609.GC8798@zurbaran>
References: <1365700312-7452-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1365700312-7452-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Thu, Apr 11, 2013 at 06:11:50PM +0100, Mark Brown wrote:
> We can actually read this back from the device but we use this when
> registered using standard I2C board data registration so make sure
> it's there for OF too.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/mfd/wm8994-core.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
Both patches applied, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
