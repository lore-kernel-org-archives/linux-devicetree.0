Return-Path: <SRS0=uBtF=5D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A353AC4332D
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 21:09:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74E2F20775
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 21:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584565790;
	bh=5uS4a+5EJm4CyeOijDRc8Zh+DisVODdHPSDxweM/j/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ue4w3jVOuqo7GtNF0kGjZlO+HuGpxBHPhTR4gnqYUwKxF3QfnOjHKU8tDmZn3QLqs
	 Yg7NENrWa9wxwdL4CwvD9AtLPqZ3Lw6E02cVQc+jzqTjNLJ0Ust5SXzmzmG930E7/9
	 WmEZ1Ae0k2gL5O6Q7pePRpfaj9zqNzwGm/JAc0P8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbgCRVJo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Mar 2020 17:09:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:52752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727241AbgCRUxl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 18 Mar 2020 16:53:41 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CBD7208FE;
        Wed, 18 Mar 2020 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584564821;
        bh=5uS4a+5EJm4CyeOijDRc8Zh+DisVODdHPSDxweM/j/U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=toAxLGlztpQESogpAkn7ob0DdNkvY3Yz0uYUGSAMKb+XuufPDWpskNzwKuwWTFVcZ
         8OlCHqqxERTVhpOHJHH1Wjhhf5+fOw5NLlPf4QtMaGi+7fuooPpnJ2cDwshfHO+2Jp
         t8/uSKhyil4necfKWXxl8O2TN4IHxhDpJT3p4gTI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Anson Huang <Anson.Huang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 03/73] clk: imx8mn: Fix incorrect clock defines
Date:   Wed, 18 Mar 2020 16:52:27 -0400
Message-Id: <20200318205337.16279-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318205337.16279-1-sashal@kernel.org>
References: <20200318205337.16279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

[ Upstream commit 5eb40257047fb11085d582b7b9ccd0bffe900726 ]

IMX8MN_CLK_I2C4 and IMX8MN_CLK_UART1's index definitions are incorrect,
fix them.

Fixes: 1e80936a42e1 ("dt-bindings: imx: Add clock binding doc for i.MX8MN")
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/dt-bindings/clock/imx8mn-clock.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mn-clock.h b/include/dt-bindings/clock/imx8mn-clock.h
index d7b201652f4cd..0c7c750fc2c41 100644
--- a/include/dt-bindings/clock/imx8mn-clock.h
+++ b/include/dt-bindings/clock/imx8mn-clock.h
@@ -122,8 +122,8 @@
 #define IMX8MN_CLK_I2C1				105
 #define IMX8MN_CLK_I2C2				106
 #define IMX8MN_CLK_I2C3				107
-#define IMX8MN_CLK_I2C4				118
-#define IMX8MN_CLK_UART1			119
+#define IMX8MN_CLK_I2C4				108
+#define IMX8MN_CLK_UART1			109
 #define IMX8MN_CLK_UART2			110
 #define IMX8MN_CLK_UART3			111
 #define IMX8MN_CLK_UART4			112
-- 
2.20.1

