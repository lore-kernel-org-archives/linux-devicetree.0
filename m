From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/3] dt-bindings: PCI: Add definition of pcie wake irq
Date: Tue, 17 Oct 2017 14:03:30 -0500
Message-ID: <20171017190330.dldonto4ppkkldbh@rob-hp-laptop>
References: <20171013195059.23865-1-jeffy.chen@rock-chips.com>
 <20171013195059.23865-3-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171013195059.23865-3-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, bhelgaas@google.com, shawn.lin@rock-chips.com, briannorris@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 14, 2017 at 03:50:57AM +0800, Jeffy Chen wrote:
> Add an optional interrupt for PCIE_WAKE pin.
> 
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> ---
> 
> Changes in v6: None
> Changes in v5:
> Move to pci.txt
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/pci/pci.txt | 2 ++
>  1 file changed, 2 insertions(+)

Please add acks when posting new versions.
