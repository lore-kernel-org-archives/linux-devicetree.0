From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: Add PCI EP DT binding documentation for AM654
Date: Wed, 1 May 2019 09:40:24 -0500
Message-ID: <CAL_Jsq+fR3-9c2pgDAL4EJebbiUntW46C_HAD5zoNaXRvojbHA@mail.gmail.com>
References: <20190426124620.28881-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426124620.28881-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 26, 2019 at 7:47 AM Kishon Vijay Abraham I <kishon@ti.com> wrote:
>
> Add devicetree binding documentation for PCIe in EP mode present in
> AM654 SoC.
>
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  .../devicetree/bindings/pci/pci-keystone.txt  | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
