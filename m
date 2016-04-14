From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pci: add DT binding for Marvell
 Armada 7K/8K PCIe controller
Date: Thu, 14 Apr 2016 12:40:46 -0500
Message-ID: <20160414174046.GA25285@rob-hp-laptop>
References: <1460648177-31473-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1460648177-31473-2-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460648177-31473-2-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-pci-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Hanna Hawa <hannah@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Yehuda Yitschak <yehuday@marvell.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 14, 2016 at 05:36:16PM +0200, Thomas Petazzoni wrote:
> This commit adds the Device Tree binding documentation that allows to
> describe the PCIe controller found in Marvell Armada 7K/8K SoCs.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../devicetree/bindings/pci/pci-armada8k.txt       | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/pci-armada8k.txt

I already acked the last version, did something change?

Acked-by: Rob Herring <rob@kernel.org>
