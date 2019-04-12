From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv5 4/6] PCI: mobiveil: Add PCIe Gen4 RC driver for NXP
 Layerscape SoCs
Date: Fri, 12 Apr 2019 16:41:49 +0200
Message-ID: <CAK8P3a1rkBP4Hzy+=j8Ds_MoZU0K1_kh5YA0-ogOAG9TZ5fDNQ@mail.gmail.com>
References: <20190412095332.41370-1-Zhiqiang.Hou@nxp.com> <20190412095332.41370-5-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412095332.41370-5-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei
List-Id: devicetree@vger.kernel.org

> +       pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> +       if (!pcie)
> +               return -ENOMEM;
> +
> +       mv_pci = devm_kzalloc(dev, sizeof(*mv_pci), GFP_KERNEL);
> +       if (!mv_pci)
> +               return -ENOMEM;
> +

Just fold the two structures into one, and use pci_alloc_host_bridge()
to allocate everything.

     Arnd
