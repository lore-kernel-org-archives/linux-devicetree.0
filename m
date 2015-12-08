From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v4 1/5] PCI: designware: add memory barrier after enabling
 region
Date: Tue, 8 Dec 2015 11:01:04 +0200
Message-ID: <56669C50.9060700@linaro.org>
References: <1449149725-27607-1-git-send-email-stanimir.varbanov@linaro.org>
 <1449149725-27607-2-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1449149725-27607-2-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, Pratyush Anand <pratyush.anand@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

On 12/03/2015 03:35 PM, Stanimir Varbanov wrote:
> Add 'write memory' barrier after enable region in PCIE_ATU_CR2
> register. The barrier is needed to ensure that the region enable
> request has been reached it's destination at time when we
> read/write to PCI configuration space.
> 
> Without this barrier PCI device enumeration during kernel boot
> is not reliable, and reading configuration space for particular
> PCI device on the bus returns zero aka no device.

Anand, Jingoo, what is your opinion?

> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/pci/host/pcie-designware.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pcie-designware.c
> index 02a7452bdf23..ed4dc2e2553b 100644
> --- a/drivers/pci/host/pcie-designware.c
> +++ b/drivers/pci/host/pcie-designware.c
> @@ -164,6 +164,11 @@ static void dw_pcie_prog_outbound_atu(struct pcie_port *pp, int index,
>  	dw_pcie_writel_rc(pp, upper_32_bits(pci_addr), PCIE_ATU_UPPER_TARGET);
>  	dw_pcie_writel_rc(pp, type, PCIE_ATU_CR1);
>  	dw_pcie_writel_rc(pp, PCIE_ATU_ENABLE, PCIE_ATU_CR2);
> +	/*
> +	 * ensure that the ATU enable has been happaned before accessing
> +	 * pci configuration/io spaces through dw_pcie_cfg_[read|write].
> +	 */
> +	wmb();
>  }
>  
>  static struct irq_chip dw_msi_irq_chip = {
> 


-- 
regards,
Stan
