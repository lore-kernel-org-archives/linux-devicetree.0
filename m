From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: PCI: MediaTek: Correct the
 interrupt-map properties
Date: Mon, 5 Feb 2018 00:08:30 -0600
Message-ID: <20180205060830.svkrwnn6wzuig7ns@rob-hp-laptop>
References: <31c765c53e85e41bfc001d110d69e46c9967f4e7.1516961656.git.ryder.lee@mediatek.com>
 <9d247a4fba54ba90d07df32fd89a8bb2c8bdb0f9.1516961656.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9d247a4fba54ba90d07df32fd89a8bb2c8bdb0f9.1516961656.git.ryder.lee@mediatek.com>
Sender: linux-pci-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Frank Rowand <frowand.list@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 03:41:50PM +0800, Ryder Lee wrote:
> Move the interrupt-map properties from the child nodes to the root node
> and update each entry accordingly.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../devicetree/bindings/pci/mediatek-pcie.txt      | 28 ++++++++++++----------
>  1 file changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
