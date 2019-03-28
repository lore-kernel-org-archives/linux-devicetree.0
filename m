From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv3 2/3] Documentation: dt: edac: Add Stratix10 Peripheral
 bindings
Date: Thu, 28 Mar 2019 13:32:27 -0500
Message-ID: <20190328183227.GA8948@bogus>
References: <1553529476-26181-1-git-send-email-thor.thayer@linux.intel.com>
 <1553529476-26181-3-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553529476-26181-3-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com, thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Mar 2019 10:57:55 -0500, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add peripheral bindings for Stratix10 EDAC to capture
> the differences between the ARM64 and ARM32 architecture.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
> v2-3 No change
> ---
>  .../devicetree/bindings/edac/socfpga-eccmgr.txt    | 106 +++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
