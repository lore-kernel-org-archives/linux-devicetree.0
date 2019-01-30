From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv3 2/6] Documentation: dt: socfpga: Add S10 System Manager
 binding
Date: Wed, 30 Jan 2019 09:51:18 -0600
Message-ID: <20190130155118.GA29638@bogus>
References: <1548713655-25940-1-git-send-email-thor.thayer@linux.intel.com>
 <1548713655-25940-3-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548713655-25940-3-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: lee.jones@linaro.org, arnd@arndb.de, dinguyen@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, davem@davemloft.net, mcoquelin.stm32@gmail.com, mchehab+samsung@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, olof@lixom.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, 28 Jan 2019 16:14:11 -0600, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add the device tree bindings for the Stratix10 System Manager.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
> v2  New compatible string and usage for Stratix10
> v3  No change
> ---
>  .../devicetree/bindings/arm/altera/socfpga-system.txt        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
