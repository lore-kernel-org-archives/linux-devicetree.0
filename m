Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAD5C43215
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 04:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C719A206E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 04:57:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WLmdWgto"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfLCE5c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 23:57:32 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34076 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfLCE5c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 23:57:32 -0500
Received: by mail-wr1-f68.google.com with SMTP id t2so2023758wrr.1
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 20:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=pbRW1viad/GHjUmf3l7SOTRxkxISCKNgTFW5qUzFG18=;
        b=WLmdWgtocCq7SfivDEJxGQ0qYWEVC1FNP6Ngu0ZWhp++etMTGHgs+n3xeIFW14fTiV
         yhMj5yJWWCPDS2EsRAWEKGXN55BwurbaZnbUTdFro30TSZBmm596DFT99kyC5Rb5b2Zp
         hE6zmZw+W99FOnPwPVSHB2AwA5Hq6AacNcqZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pbRW1viad/GHjUmf3l7SOTRxkxISCKNgTFW5qUzFG18=;
        b=PwrjatmK/lTL/8PsGEyuSidGLqYUCVPZWLt4HCmhDXzbLPBiEnTNT3XtGJF6AKIEEg
         /YSn/APErV9IeFtj3+EnJ2pu4EK9F/S0/gZDICaVRSX2w9uxar4ELiea8qKyZyUDHEkQ
         faP9iUewQ/wxN+Lsf+m0YVRihUjZVm+gx8ktB3qrFVGmctaWsmmq9uLWi6drQAYTycHn
         wtsVZovmbCJ5Jdjm6Xpc2RWPR4uZ8e6B6ri//FMKvRMzQ/Me/2f8i+GkM4QIKJz+ki9+
         yujxCVbcs2ekhvK9ZHvbdGQslMCITSjs+x4VK9CN0dS117E9x+ezn4xmFmFNfluHOCVg
         iDJA==
X-Gm-Message-State: APjAAAWp/JS8zFqY7wO+aQyLYwXhQWM0QdxGbLEiFkNrCUh2yOoYNZ74
        KEePcZf013HCu45faRlRVLHC5A==
X-Google-Smtp-Source: APXvYqyUrHD9fDQwouHUkuIiwPBscZSDLCvUsyiXCIoV/4MEv6faKFnYd8o4XCGdWtnIMoM9UkEcaw==
X-Received: by 2002:a5d:5284:: with SMTP id c4mr2679212wrv.376.1575349049792;
        Mon, 02 Dec 2019 20:57:29 -0800 (PST)
Received: from mannams-OptiPlex-7010.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id k4sm1667807wmk.26.2019.12.02.20.57.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 02 Dec 2019 20:57:29 -0800 (PST)
From:   Srinath Mannam <srinath.mannam@broadcom.com>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v3 0/6] PAXB INTx support with proper model
Date:   Tue,  3 Dec 2019 10:27:00 +0530
Message-Id: <1575349026-8743-1-git-send-email-srinath.mannam@broadcom.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series adds PCIe legacy interrupt (INTx) support to the iProc
PCIe driver by modeling it with its own IRQ domain. All 4 interrupts INTA,
INTB, INTC, INTD share the same interrupt line connected to the GIC
in the system. This is now modeled by using its own IRQ domain.

Also update all relevant devicetree files to adapt to the new model.

This patch set is based on Linux-5.4.

Changes from v2:
  - Addressed Lorenzo's comments
    - Corrected INTx to PIN mapping.

Changes from v1:
  - Addressed Rob, Lorenzo, Arnd's comments
    - Used child node for interrupt controller.
  - Addressed Andy Shevchenko's comments
    - Replaced while loop with do-while.

Ray Jui (6):
  dt-bindings: pci: Update iProc PCI binding for INTx support
  PCI: iproc: Add INTx support with better modeling
  arm: dts: Change PCIe INTx mapping for Cygnus
  arm: dts: Change PCIe INTx mapping for NSP
  arm: dts: Change PCIe INTx mapping for HR2
  arm64: dts: Change PCIe INTx mapping for NS2

 .../devicetree/bindings/pci/brcm,iproc-pcie.txt    |  48 ++++++++--
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |  30 ++++++-
 arch/arm/boot/dts/bcm-hr2.dtsi                     |  30 ++++++-
 arch/arm/boot/dts/bcm-nsp.dtsi                     |  45 ++++++++--
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |  28 +++++-
 drivers/pci/controller/pcie-iproc.c                | 100 ++++++++++++++++++++-
 drivers/pci/controller/pcie-iproc.h                |   6 ++
 7 files changed, 260 insertions(+), 27 deletions(-)

-- 
2.7.4

