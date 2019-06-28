Return-Path: <SRS0=7p7P=U3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:51431 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbfF1DZz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Jun 2019 23:25:55 -0400
From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v2 0/2] clk: clk-cdce925: Add regulator support
Date: Fri, 28 Jun 2019 11:19:08 +0800
Message-Id: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
Sender: devicetree-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, preid@electromag.com.au, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The cdce925 power supplies could be controllable on some platforms.
Enable them before communicating with the cdce925.

Changes from V1
- Add devicetree updates


Phil Reid (2):
  dt-bindings: clock: cdce925: Add regulator documentation
  clk: clk-cdce925: Add regulator support

 .../devicetree/bindings/clock/ti,cdce925.txt       |  4 +++
 drivers/clk/clk-cdce925.c                          | 34 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
1.8.3.1
