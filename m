From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] PCI: histb: add power control GPIO for PCIe slot
Date: Tue, 23 Jan 2018 18:54:25 +0800
Message-ID: <20180123105424.GB23797@dragon>
References: <1516669477-20151-1-git-send-email-shawn.guo@linaro.org>
 <CAOMZO5DFR=qJ_Q9ag+6Ov92VMZL3wiLSQJee=nKUJFtZ1mW1RQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5DFR=qJ_Q9ag+6Ov92VMZL3wiLSQJee=nKUJFtZ1mW1RQ@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, linux-pci@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, project-aspen-dev@linaro.org, Jianguo Sun <sunjianguo1@huawei.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 22, 2018 at 11:12:44PM -0200, Fabio Estevam wrote:
> Hi Shawn,
> 
> On Mon, Jan 22, 2018 at 11:04 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
> > From: Jianguo Sun <sunjianguo1@huawei.com>
> >
> > Besides the GPIO for controlling reset, there is also possibly another
> > GPIO for turning on/off the power of PCIe slot.  Let's add the support
> > for that with another optional device tree property 'power-gpios'.
> 
> It seems that a better approach would be to add regulator support
> instead as it is more general.

It's a sensible suggestion.  I will take it in v2.  Thanks, Fabio.

Shawn
