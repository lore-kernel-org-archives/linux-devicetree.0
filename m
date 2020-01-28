Return-Path: <SRS0=5/ta=3R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A379C33CB3
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 10:23:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 640E320661
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 10:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgA1KXc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jan 2020 05:23:32 -0500
Received: from foss.arm.com ([217.140.110.172]:54712 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgA1KXb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Jan 2020 05:23:31 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07E2930E;
        Tue, 28 Jan 2020 02:23:31 -0800 (PST)
Received: from [10.1.196.63] (e123195-lin.cambridge.arm.com [10.1.196.63])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 156E03F52E;
        Tue, 28 Jan 2020 02:23:29 -0800 (PST)
Subject: Re: [PATCH v3 0/8] dt: amd-seattle: update SMMU, PCIe and cache
 descriptions
To:     Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org
Cc:     Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20191203152306.7839-1-ardb@kernel.org>
From:   Alexandru Elisei <alexandru.elisei@arm.com>
Message-ID: <ab7e20fa-3d4c-6b9c-e74a-fe88f1ba5ccf@arm.com>
Date:   Tue, 28 Jan 2020 10:23:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191203152306.7839-1-ardb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 12/3/19 3:22 PM, Ard Biesheuvel wrote:
> Bring the DT descriptions for AMD Seattle up to date:
> - upgrade the existing SMMU descriptions to the new binding, and add the
>   missing descriptions of the PCIe and SATA SMMUs
> - fix the description of the PCIe legacy interrupt routing
> - remove the obsolete A0 Overdrive and Husky

This is long overdue, I've been playing with PCI passthrough on an AMD Seattle
machine using these patches since you posted them on the mailing list. With these
patches, PCI passthrough has been tested with the following devices: Intel 82574L
Gigabit Ethernet card, Samsung 970 Pro NVME, Realtek 8168 Gigabit Ethernet card,
NVIDIA Quadro P400, AMD Firepro W2100, Myricom 10 Gigabit Ethernet card and a
Seagate Barracuda 1000GB drive with a generic PCIE SATA card.

For patches #3-#6 (that touch the SMMU):

Tested-by: Alexandru Elisei <alexandru.elisei@arm.com>

Thanks,
Alex
>
> Changes since v2:
> - use Cortex-A57 specific compatible strings for CPUs and PMU
> - use iommu@... not smmu@.... for SMMU DT node identifiers
> - match the entire range of stream IDs 0x0..0x1f for the first SATA port, for
>   compatibility with some B0 silicon revision based boards
>
> Changes since v1:
> - add missing dma-coherent properties to xgbe SMMU nodes
> - add patch to disable GPIO and IPMI blocks on B0 silicon
> - add patch to include DT descriptions of the CPU and cache topologies
>
> Cc: Brijesh Singh <brijeshkumar.singh@amd.com>
> Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
>
> Ard Biesheuvel (8):
>   dt: amd-seattle: remove Husky platform
>   dt: amd-seattle: remove Overdrive revision A0 support
>   dt: amd-seattle: upgrade AMD Seattle XGBE to new SMMU binding
>   dt: amd-seattle: fix PCIe legacy interrupt routing
>   dt: amd-seattle: add a description of the PCIe SMMU
>   dt: amd-seattle: add description of the SATA/CCP SMMUs
>   dt: amd-seattle: disable IPMI controller and some GPIO blocks on B0
>   dt: amd-seattle: add a description of the CPUs and caches
>
>  arch/arm64/boot/dts/amd/Makefile              |   4 +-
>  .../boot/dts/amd/amd-overdrive-rev-b0.dts     |  13 +-
>  .../boot/dts/amd/amd-overdrive-rev-b1.dts     |   1 +
>  arch/arm64/boot/dts/amd/amd-overdrive.dts     |  66 ------
>  arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi | 224 ++++++++++++++++++
>  arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi  |  70 ++++--
>  .../boot/dts/amd/amd-seattle-xgbe-b.dtsi      |  22 +-
>  arch/arm64/boot/dts/amd/husky.dts             |  84 -------
>  8 files changed, 287 insertions(+), 197 deletions(-)
>  delete mode 100644 arch/arm64/boot/dts/amd/amd-overdrive.dts
>  create mode 100644 arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi
>  delete mode 100644 arch/arm64/boot/dts/amd/husky.dts
>
