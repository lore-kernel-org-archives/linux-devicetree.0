From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 3/3] nvmem: zynqmp: Added zynqmp nvmem firmware driver
Date: Sun, 3 Feb 2019 09:38:10 +0000
Message-ID: <67e2af69-10bc-655c-e730-4c02a6375381@linaro.org>
References: <20190204070951.6933-1-nava.manne@xilinx.com>
 <20190204070951.6933-4-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190204070951.6933-4-nava.manne@xilinx.com>
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
To: Nava kishore Manne <nava.manne@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, jollys@xilinx.com, rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 04/02/2019 07:09, Nava kishore Manne wrote:
>   
> -config SC27XX_EFUSE
> -	tristate "Spreadtrum SC27XX eFuse Support"
> -	depends on MFD_SC27XX_PMIC || COMPILE_TEST
> -	depends on HAS_IOMEM

Why are you removing SC27XX_EFUSE support here?

It does not look right!

> +config NVMEM_ZYNQMP
> +	bool "Xilinx ZYNQMP SoC nvmem firmware support"
> +	depends on ARCH_ZYNQMP
>   	help
> -	  This is a simple driver to dump specified values of Spreadtrum
> -	  SC27XX PMICs from eFuse.
> +	  This is a driver to access hardware related data like
> +	  soc revision, IDCODE... etc by using the firmware
> +	  interface.
>   
> -	  This driver can also be built as a module. If so, the module
> -	  will be called nvmem-sc27xx-efuse.
> +	  If sure, say yes. If unsure, say no.
>   
>   endif
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 4e8c61628f1a..0b3abd7f5d02 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -39,5 +39,6 @@ obj-$(CONFIG_NVMEM_SNVS_LPGPR)	+= nvmem_snvs_lpgpr.o
>   nvmem_snvs_lpgpr-y		:= snvs_lpgpr.o
>   obj-$(CONFIG_RAVE_SP_EEPROM)	+= nvmem-rave-sp-eeprom.o
>   nvmem-rave-sp-eeprom-y		:= rave-sp-eeprom.o
> -obj-$(CONFIG_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
> -nvmem-sc27xx-efuse-y		:= sc27xx-efuse.o

same here?

> +obj-$(CONFIG_NVMEM_ZYNQMP)     += nvmem_zynqmp_nvmem.o
> +nvmem_zynqmp_nvmem-y           := zynqmp_nvmem.o
> +

--srini
