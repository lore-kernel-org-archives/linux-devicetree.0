From: Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>
Subject: RE: [PATCH 2/2] pci: Add PCIe driver for Rockchip Soc
Date: Mon, 23 May 2016 15:15:20 +0000
Message-ID: <8520D5D51A55D047800579B094147198258ACE47@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1463740105-7061-1-git-send-email-shawn.lin@rock-chips.com>
 <1463740156-7148-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463740156-7148-1-git-send-email-shawn.lin@rock-chips.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Wenrui Li <wenrui.li@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> +
> +	irq = platform_get_irq_byname(pdev, "pcie-sys");
> +	if (irq < 0) {
> +		dev_err(dev, "missing pcie_sys IRQ resource\n");
> +		return -EINVAL;
> +	}
> +	err = devm_request_irq(dev, irq, rockchip_pcie_subsys_irq_handler,
> +			       IRQF_SHARED, "pcie-sys", port);
> +	if (err) {
> +		dev_err(dev, "failed to request pcie subsystem irq\n");
> +		return err;
> +	}
> +
> +	port->irq = platform_get_irq_byname(pdev, "pcie-legacy");
> +	if (port->irq < 0) {
> +		dev_err(dev, "missing pcie_legacy IRQ resource\n");
> +		return -EINVAL;
> +	}
> +	err = devm_request_irq(dev, port->irq,
> +			       rockchip_pcie_legacy_int_handler,
> +			       IRQF_SHARED,
> +			       "pcie-legacy",
> +			       port);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to request pcie-legacy irq\n");
> +		return err;
> +	}
> +
> +	irq = platform_get_irq_byname(pdev, "pcie-client");
> +	if (irq < 0) {
> +		dev_err(dev, "missing pcie-client IRQ resource\n");
> +		return -EINVAL;
> +	}
> +	err = devm_request_irq(dev, irq, rockchip_pcie_client_irq_handler,
> +			       IRQF_SHARED, "pcie-client", port);
> +	if (err) {
> +		dev_err(dev, "failed to request pcie client irq\n");
> +		return err;
> +	}
> +

All of the above interrupt number details are being obtained from device tree, why not move above API's to rockchip_pcie_parse_dt.

> +	port->dev = dev;
> +	err = rockchip_pcie_parse_dt(port);
> +	if (err) {
> +		dev_err(dev, "Parsing DT failed\n");
> +		return err;
> +	}
> +
> +	pcie_write(port, 0x6040000, PCIE_RC_CONFIG_BASE + 0x8);
> +	pcie_write(port, 0x0, PCIE_CORE_CTRL_MGMT_BASE + 0x300);
> +
> +	pcie_write(port, (RC_REGION_0_ADDR_TRANS_L +
> RC_REGION_0_PASS_BITS),
> +		   PCIE_CORE_AXI_CONF_BASE);
> +	pcie_write(port, RC_REGION_0_ADDR_TRANS_H,
> +		   PCIE_CORE_AXI_CONF_BASE + 0x4);
> +	pcie_write(port, 0x0080000a, PCIE_CORE_AXI_CONF_BASE + 0x8);
> +	pcie_write(port, 0x00000000, PCIE_CORE_AXI_CONF_BASE + 0xc);

Why not move the above steps to rockchip_pcie_init_port function ? 
Please use macros instead of using values.
