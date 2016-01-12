From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/2] pci: Add host controller driver for Cavium ThunderX PCIe
Date: Tue, 12 Jan 2016 22:53:15 +0100
Message-ID: <4279902.J8lISZqg4v@wuerfel>
References: <1452297553-19911-1-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452297553-19911-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: David Daney <ddaney.cavm@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On Friday 08 January 2016 15:59:11 David Daney wrote:
> From: David Daney <david.daney@cavium.com>
> 
> Some Cavium ThunderX processors require quirky access methods for the
> config space of the PCIe bridge.
> 
> There are two patches:
> 
> 1) Refactor code in pci-host-generic so that it can more easily be
>    used by other drivers.  This splits the driver for CAM and ECAM
>    access methods to a separate file from the common host driver code.
> 
> 2) Add the ThunderX PCIe driver, which leverages the code in
>    pci-host-generic
> 
> Changes from v2: Improve device tree binding example as noted by Rob
> Herring.  Rename pcie-thunder-pem.* to pci-thunder-pem.* for better
> consistency.  Update MAINTAINERS to reflect the changes.
> 
> Changes from v1: Split CAM and ECAM code from common driver code as
> suggested by Arnd Bergmann.  Fix spelling errors in
> pcie-thunder-pem.txt
> 

Sorry for the late reply (I didn't comment on v2 either). This version
looks fine to me. There are probably cleanups we can do on the generic
code later on, but splitting it up the way you do here fully addresses
my earlier concerns. Thanks for your patience.

Acked-by: Arnd Bergmann <arnd@arndb.de>
