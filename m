From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: pci: amlogic,meson-pcie: Add G12A bindings
Date: Fri, 13 Sep 2019 15:36:18 +0100
Message-ID: <5d7ba963.1c69fb81.4869.eb19@mx.google.com>
References: <1567950178-4466-1-git-send-email-narmstrong@baylibre.com> <1567950178-4466-2-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567950178-4466-2-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, bhelgaas@google.com, lorenzo.pieralisi@arm.com, yue.wang@Amlogic.com, kishon@ti.com, devicetree@vger.kernel.org, repk@triplefau.lt, maz@kernel.org, linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun,  8 Sep 2019 13:42:53 +0000, Neil Armstrong wrote:
> Add PCIE bindings for the Amlogic G12A SoC, the support is the same
> but the PHY is shared with USB3 to control the differential lines.
> 
> Thus this adds a phy phandle to control the PHY, and sets invalid
> MIPI clock as optional for G12A.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/pci/amlogic,meson-pcie.txt   | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
