From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] PCI: iproc: Add Broadcom iProc PCIe driver
Date: Wed, 10 Dec 2014 12:31:38 +0100
Message-ID: <9707535.Y78sV0TgX4@wuerfel>
References: <1418169871-19232-3-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1418169871-19232-3-git-send-email-rjui@broadcom.com>
Sender: linux-pci-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Scott Branden <sbranden@broadcom.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, hauke@hauke-m.de
List-Id: devicetree@vger.kernel.org

On Tuesday 09 December 2014 16:04:29 Ray Jui wrote:
> Add initial version of the Broadcom iProc PCIe driver. This driver
> has been tested on NSP and Cygnus and is expected to work on all iProc
> family of SoCs that deploys the same PCIe host controller
> 
> The driver also supports MSI
> 
> Signed-off-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>

The driver looks suspiciously like the one that Hauke already submitted a
while ago for bcm53xx. Please come up with a merged driver that works for
both.

Are you sure that iProc isn't based on the BCMA bus infrastructure after
all? Even the physical address of your PCI host falls into the address
range that is used for the internal BCMA bus on the other chips!

	Arnd
