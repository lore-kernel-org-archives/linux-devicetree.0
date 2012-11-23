From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH V2 1/2] mfd: stmpe: Use devm_*() routines
Date: Fri, 23 Nov 2012 12:03:13 +0100
Message-ID: <20121123110313.GA12685@sortiz-mobl>
References: <f1d508c64a01dfd492a1ab1fda28af4b7647d8ab.1353560936.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f1d508c64a01dfd492a1ab1fda28af4b7647d8ab.1353560936.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Viresh,

On Thu, Nov 22, 2012 at 10:40:29AM +0530, Viresh Kumar wrote:
> This patch frees stmpe driver from tension of freeing resources :)
> devm_* derivatives of multiple routines are used while allocating resources,
> which would be freed automatically by kernel.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Applied, with Lee's Ack.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
