Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61159C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 03:54:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 32A9124676
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 03:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="J7pcTxw2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfLTDyf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 22:54:35 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35639 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfLTDyf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 22:54:35 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so3519654plt.2
        for <devicetree@vger.kernel.org>; Thu, 19 Dec 2019 19:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=PoLshNDzrJ34zNiIcguyofrG58V/A2F+YEa2ClLgm0M=;
        b=J7pcTxw2cF3I1+9MhU6RvI2RCWdIsCwvKIRtRkrOgsADvQScweskX2fQ21XcvlXRGD
         YXMvNbK9KYj9Ixm2dXRnRNkFMtGW13JfRdGr/Sq6lQbIW/7+uJbZ10Htlt2lcW0iwhLR
         2+o3yepAZjv1lsnqqssRQ+VSURCqIFraFtJHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PoLshNDzrJ34zNiIcguyofrG58V/A2F+YEa2ClLgm0M=;
        b=hVDc65XVa5zqNt3SeTPz9BNKbSAX8m2/eRXWnIqUuhhjm3n7tBSm+Q/19qmeGMr9g1
         l6/2C3y5ySc8ADHN+ZnYVarjUFN3HEDq+j41VlLFyW/iVW0ydtQcgIB3+Hhk+S/MvlE4
         jXIsInHjVNU57gUgSYQxv1xqIoRFR+3JZ4byzb26mkEkhS0/eK458JZ48groiZPburv3
         g7X0RmPp6sgln9p5TC2eyQIdFo+ZaBrQk/mzvBrlNMx3QfqsoiLJnTKH1nBlsMr2k1uW
         TIR23MivC91eoFH28WPecUpy3i4ks8MuOzHu4SuU+5Ls6CEasLdjtZ+WaX8hw6PMcYEE
         ZgSg==
X-Gm-Message-State: APjAAAUkskf9qe+qGDTTD7tG8NDmPFz+g78ZWNNmUlvvQcs7KyYVxE2D
        fqQWJ6gQRyO0xIYwAcRymyLRbg==
X-Google-Smtp-Source: APXvYqz5gbwIuxN8xP8ES2rSbow/hVGo5nLVK4ha6qxGjm0meTH2KyQMRtB2mycw7ogT+3QFA53bNg==
X-Received: by 2002:a17:902:b90c:: with SMTP id bf12mr12676383plb.286.1576814074673;
        Thu, 19 Dec 2019 19:54:34 -0800 (PST)
Received: from mannams-OptiPlex-7010.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id t65sm10522205pfd.178.2019.12.19.19.54.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 19 Dec 2019 19:54:33 -0800 (PST)
From:   Srinath Mannam <srinath.mannam@broadcom.com>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v4 0/6] PAXB INTx support with proper model
Date:   Fri, 20 Dec 2019 09:24:12 +0530
Message-Id: <1576814058-30003-1-git-send-email-srinath.mannam@broadcom.com>
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

This patch set is based on Linux-5.5-rc1.

Changes from v3:
  - Addressed Andrew Murray's comments
  - Add change to dispose VIRQ when disabling INTx

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

 .../devicetree/bindings/pci/brcm,iproc-pcie.txt    |  48 +++++++--
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |  30 +++++-
 arch/arm/boot/dts/bcm-hr2.dtsi                     |  30 +++++-
 arch/arm/boot/dts/bcm-nsp.dtsi                     |  45 +++++++--
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |  28 +++++-
 drivers/pci/controller/pcie-iproc.c                | 108 ++++++++++++++++++++-
 drivers/pci/controller/pcie-iproc.h                |   6 ++
 7 files changed, 268 insertions(+), 27 deletions(-)

-- 
2.7.4

