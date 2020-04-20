Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24E4C3815B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 17:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A21ED20CC7
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 17:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587402142;
	bh=aksiYpWTvag3k42u0M1b1NrjxY8yKocMPEw91TQYxEU=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=CNq2NDUu6VO7ZeOs/PzPCQUQiBaO2fyNMPuJ3P3+9+58GmWzBINWJlKc00jYtgV94
	 S49uHH5R0j60wBva50xdUjSVMzyW8QyiaCl/hOptcMVwOgxC5TcKNrSztI25gs1MGA
	 IIiFfJK+LUZWtq/JswbEJawWcQ5GvhK62j9/V3yM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgDTRCS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 13:02:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:38260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725784AbgDTRCS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 13:02:18 -0400
Received: from localhost.localdomain (unknown [157.46.94.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2FB820CC7;
        Mon, 20 Apr 2020 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587402137;
        bh=aksiYpWTvag3k42u0M1b1NrjxY8yKocMPEw91TQYxEU=;
        h=From:To:Cc:Subject:Date:From;
        b=bM5TEFM6C5MJE7Kcy6aNRoG0fjnGHLSHqXpkrnuuYUVe4H9Ivr7WigZ0IzlLMZ5R6
         ggHj/GRUmCAAiaBJmz95FdNW6UpXR1wn4Io//QLjuSabgrWzfYKpzwBhnFUWkdRS0S
         7PcmuXjFHlv/Vt6tf5kpQEzocBySnhWsaLV7oqtE=
From:   mani@kernel.org
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com, andy.shevchenko@gmail.com,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v3 0/2] Add CTS/RTS gpio support to STM32 UART
Date:   Mon, 20 Apr 2020 22:32:02 +0530
Message-Id: <20200420170204.24541-1-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Manivannan Sadhasivam <mani@kernel.org>

Hello,

This patchset adds CTS/RTS gpio support to STM32 UART controller.
Eventhough the UART controller supports using dedicated CTS/RTS gpios,
sometimes we need to use different set of gpios for flow control.

This is necessary for the upcoming STM32MP1 based board called Stinger96
IoT-Box. On that board, a bluetooth chip is connected to one of the UART
controller but the CTS/RTS lines got swapped mistakenly. So this patchset
serves as a workaround for that hardware bug and also supports the
usecase of using any gpio for CTS/RTS functionality. As per the sugggestion
provided by Andy for v1, I've now switched to mctrl_gpio driver.

This patchset has been validated with Stinger96 IoT-Box connected to Murata
WiFi-BT combo chip.

Thanks,
Mani

Changes in v3:

* Added Andy's reviewed-by tag
* Fixed minor issues spotted by Fabrice

Changes in v2:

As per the review by Andy:

* Switched to mctrl_gpio driver instead of using custom CTS/RTS
  implementation
* Removed the use of software flow control terminology.

Manivannan Sadhasivam (2):
  dt-bindings: serial: Document CTS/RTS gpios in STM32 UART
  tty: serial: Add modem control gpio support for STM32 UART

 .../bindings/serial/st,stm32-uart.yaml        | 14 +++++
 drivers/tty/serial/Kconfig                    |  1 +
 drivers/tty/serial/stm32-usart.c              | 53 ++++++++++++++++++-
 drivers/tty/serial/stm32-usart.h              |  1 +
 4 files changed, 67 insertions(+), 2 deletions(-)

-- 
2.17.1

