From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH 1/2] mfd: stmpe: Use devm_*() routines
Date: Wed, 21 Nov 2012 15:15:41 +0100
Message-ID: <20121121141541.GV18738@sortiz-mobl>
References: <07672d0597e23fbc580843193415b89e81dba326.1352475033.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <07672d0597e23fbc580843193415b89e81dba326.1352475033.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com
List-Id: devicetree@vger.kernel.org

Hi Viresh,

On Fri, Nov 09, 2012 at 09:01:54PM +0530, Viresh Kumar wrote:
> This patch frees stmpe driver from tension of freeing resources :)
> devm_* derivatives of multiple routines are used while allocating resources,
> which would be freed automatically by kernel.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/mfd/stmpe.c | 46 +++++++++++++++-------------------------------
>  1 file changed, 15 insertions(+), 31 deletions(-)
This one does not apply on top of my for-next branch.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
