From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v8 39/45] powerpc/powernv: Select OF_DYNAMIC
Date: Tue, 19 Apr 2016 19:42:01 +1000
Message-ID: <5715FD69.3060302@ozlabs.ru>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-40-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1455680668-23298-40-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, dja@axtens.net, bhelgaas@google.com, robherring2@gmail.com, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On 02/17/2016 02:44 PM, Gavin Shan wrote:
> The device tree will change dynamically in PowerNV PCI hotplug
> driver. This enables CONFIG_OF_DYNAMIC to support that.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>   arch/powerpc/platforms/powernv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index 604190c..e7b1ad7 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -18,6 +18,7 @@ config PPC_POWERNV
>   	select CPU_FREQ_GOV_ONDEMAND
>   	select CPU_FREQ_GOV_CONSERVATIVE
>   	select PPC_DOORBELL
> +	select OF_DYNAMIC


Why not to enable it in 45/45 under config HOTPLUG_PCI_POWERNV? Is there 
any benefit of having it always on if HOTPLUG_PCI_POWERNV is not enabled?


>   	default y
>
>   config OPAL_PRD
>


-- 
Alexey
