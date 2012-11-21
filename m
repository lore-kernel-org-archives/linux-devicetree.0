From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH 2/2] mfd: stmpe: Add DT support in stmpe driver
Date: Wed, 21 Nov 2012 15:18:33 +0100
Message-ID: <20121121141833.GW18738@sortiz-mobl>
References: <07672d0597e23fbc580843193415b89e81dba326.1352475033.git.viresh.kumar@linaro.org>
 <52354a3da05aca599f47ad06c1b291ebc4f87c84.1352475033.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52354a3da05aca599f47ad06c1b291ebc4f87c84.1352475033.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Viresh,

On Fri, Nov 09, 2012 at 09:01:55PM +0530, Viresh Kumar wrote:
> From: Vipul Kumar Samar <vipulkumar.samar@st.com>
> 
> This patch adds support to probe stmpe devices via DT. Bindings are mentioned in
> binding document.
> 
> Signed-off-by: Vipul Kumar Samar <vipulkumar.samar@st.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/stmpe.txt | 121 +++++++++++
>  drivers/mfd/stmpe-i2c.c                         |  23 ++-
>  drivers/mfd/stmpe-spi.c                         |  15 ++
>  drivers/mfd/stmpe.c                             | 264 +++++++++++++++++++++++-
>  4 files changed, 418 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/stmpe.txt
Lee Jones (cc'ed) submitted a patch for the same purpose, see commit 909582ca from my
for-next branch.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
