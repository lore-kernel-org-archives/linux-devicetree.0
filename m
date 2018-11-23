From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RESEND PATCH v3 2/2] PCI: uniphier: Add UniPhier PCIe host
 controller support
Date: Fri, 23 Nov 2018 17:50:20 +0000
Message-ID: <20181123174754.GA9772@e107981-ln.cambridge.arm.com>
References: <1539667641-26024-3-git-send-email-hayashi.kunihiko@socionext.com>
 <20181119161653.GA32232@e107981-ln.cambridge.arm.com>
 <20181120211531.3607.4A936039@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120211531.3607.4A936039@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 20, 2018 at 09:15:31PM +0900, Kunihiko Hayashi wrote:

[...]

> > > +static int uniphier_pcie_link_up(struct dw_pcie *pci)
> > 
> > This function returns a bool value, make it return a bool.
> 
> This function is registered in struct dw_pcie_ops.link_up, that is defined
> in pcie-designware.h as follows:
> 
>        int     (*link_up)(struct dw_pcie *pcie);
> 
> Changing the return type of this function makes type mismatch,
> so I think it's difficult to change it.

You are right, it is fine.

Thanks,
Lorenzo
