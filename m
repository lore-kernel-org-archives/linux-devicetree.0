From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: PCI: Add definition of pcie wake irq
Date: Mon, 11 Sep 2017 14:24:21 -0500
Message-ID: <CAL_Jsq+n7B3d0BibVxj5yCTZuxJ_QYp9b0CGwc9envu9G8nSJA@mail.gmail.com>
References: <20170911151029.25185-1-jeffy.chen@rock-chips.com> <20170911151029.25185-3-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20170911151029.25185-3-jeffy.chen@rock-chips.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, Shawn Lin <shawn.lin@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Doug Anderson <dianders@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 11, 2017 at 10:10 AM, Jeffy Chen <jeffy.chen@rock-chips.com> wrote:
> Add an optional interrupt for PCIE_WAKE pin.
>
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> ---
>
> Changes in v5:
> Move to pci.txt
>
> Changes in v3: None
> Changes in v2: None
>
>  Documentation/devicetree/bindings/pci/pci.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
