From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 1/3] Documentation: dt: socfpga: Add Stratix10 ECC Manager
 binding
Date: Wed, 25 Apr 2018 21:16:25 -0500
Message-ID: <6528e94e-85ea-8015-5a3b-4e8a9ecc8dbd@kernel.org>
References: <1524594959-5259-1-git-send-email-thor.thayer@linux.intel.com>
 <1524594959-5259-2-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524594959-5259-2-git-send-email-thor.thayer@linux.intel.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: thor.thayer@linux.intel.com, bp@alien8.de, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 04/24/2018 01:35 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add the device tree bindings needed to support the Stratix10
> ECC Manager and SDRAM ECC to the existing bindings.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>  .../bindings/arm/altera/socfpga-eccmgr.txt         | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
> index 4a1714f96bab..fe48ad293a24 100644
> --- a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
> @@ -231,3 +231,50 @@ Example:
>  				     <48 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  	};
> +
> +Stratix10 SoCFPGA ECC Manager
> +The Stratix10 SoC ECC Manager handles the IRQs for each peripheral
> +in a shared register similar to the Arria10. However, ECC requires
> +access to registers that can only be read in EL3 with SMC calls.
> +Therefore the device tree is slightly different.
> +
> +Required Properties:
> +- compatible : Should be "altr,socfpga-s10-ecc-manager"

Altera technically doesn't exist anymore, should this be
"intel,stratix10-ecc-manager"?

Dinh
