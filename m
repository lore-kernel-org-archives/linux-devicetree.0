From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] PCI: histb: add power control GPIO for PCIe slot
Date: Mon, 22 Jan 2018 23:12:44 -0200
Message-ID: <CAOMZO5DFR=qJ_Q9ag+6Ov92VMZL3wiLSQJee=nKUJFtZ1mW1RQ@mail.gmail.com>
References: <1516669477-20151-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1516669477-20151-1-git-send-email-shawn.guo@linaro.org>
Sender: linux-pci-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, linux-pci@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, project-aspen-dev@linaro.org, Jianguo Sun <sunjianguo1@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Mon, Jan 22, 2018 at 11:04 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
> From: Jianguo Sun <sunjianguo1@huawei.com>
>
> Besides the GPIO for controlling reset, there is also possibly another
> GPIO for turning on/off the power of PCIe slot.  Let's add the support
> for that with another optional device tree property 'power-gpios'.

It seems that a better approach would be to add regulator support
instead as it is more general.

We do this in drivers/pci/dwc/pci-imx6.c.
