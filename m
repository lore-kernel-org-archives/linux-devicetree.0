From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH V1 2/3] mfd: stmpe-i2c: Move .driver structure fields
 inside {} in stmpe_i2c_driver
Date: Mon, 26 Nov 2012 12:15:48 +0100
Message-ID: <20121126111548.GQ12685@sortiz-mobl>
References: <57384ebc52c7d39d1bae31ba3baa6f820b4ac696.1353610436.git.viresh.kumar@linaro.org>
 <53b984826890cf263d3b3ae06b7f19ed8f57311e.1353610437.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53b984826890cf263d3b3ae06b7f19ed8f57311e.1353610437.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Viresh,

On Fri, Nov 23, 2012 at 12:26:19AM +0530, Viresh Kumar wrote:
> Currently, few fields in stmpe_i2c_driver are initialized as:
> .driver.owner = THIS_MODULE,
> 
> Group them under {}, like:
> .driver = {
> 	.owner = THIS_MODULE,
> 	...
> },
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/mfd/stmpe-i2c.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
Applied, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
