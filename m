Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF51C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 10:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8526A21775
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 10:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574938515;
	bh=apJkAzvrlLHcfFZQwrVsqk2LtG+HuA/VzrOOAHeaXK0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=2nTjYZJIVcFHF3TBmDQeNi2eBiIo02bHfkjJGDyb1zNNx7YOwfHCPv3mMa4CKRUKM
	 dx9ey1hLHIsf+vkzqJx6zowg0Yccwh22XrW7gMLYOlKQI4W0Vnj8aSNHq66l/4OrNZ
	 FcFQMoiUb5qZ3+nD9oLi+asVLlK3oWbsKQXY3uNQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfK1KzP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 05:55:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:34686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbfK1KzP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Nov 2019 05:55:15 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B537320880;
        Thu, 28 Nov 2019 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574938514;
        bh=apJkAzvrlLHcfFZQwrVsqk2LtG+HuA/VzrOOAHeaXK0=;
        h=From:To:Cc:Subject:Date:From;
        b=CPqPA2uWi5pT5DEMbWWpcQff512cLbYZwSFqNQPb2jlfIKLwwk04ftHSICtrjXGA8
         EKdUvjLU49LjFn0jPpRVCpV2dyu0bnpP3dpoAbPVouTkhameLCh0SedhwZDneq3Gfn
         wAKODpeTPZcjyHRgMfWID2ZntPs6BO+/2fBNcuJ4=
From:   kbingham@kernel.org
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
        Simon Goda <simon.goda@doulos.com>
Cc:     Kieran Bingham <kbingham@kernel.org>
Subject: [PATCH 0/3] drivers/auxdisplay: Provide support for JHD1313
Date:   Thu, 28 Nov 2019 10:55:05 +0000
Message-Id: <20191128105508.3916-1-kbingham@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Kieran Bingham <kbingham@kernel.org>

The JHD1313 is a 16x2 LCD controller with an I2C interface. It is used in the
Seeed RGB Backlight LCD [0] which has the LCD at the I2C address 0x3e. (A
PCA9633 is also available at 0x62, to control the RGB backlight)

This series introduces a new Vendor prefix for JHD, and introduces bindings for
the LCD controller. A driver for the JHD1313 is added to the auxdisplay
subsystem providing a charlcd to control the display.

[0] http://wiki.seeedstudio.com/Grove-LCD_RGB_Backlight/

Because this interface is quite common, and generic - this could be potentially
extended to other similar devices later, possibly with optional bindings to
configure the display width and height. If so - perhaps a more generic naming
for the binding/driver might be appropriate at that time.

Kieran Bingham (3):
  dt-bindings: vendor: Add JHD LCD vendor
  dt-bindings: auxdisplay: Add JHD1313 bindings
  drivers: auxdisplay: Add JHD1313 I2C interface driver

 .../bindings/auxdisplay/jhd,jhd1313.yaml      |  33 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   4 +
 drivers/auxdisplay/Kconfig                    |  12 ++
 drivers/auxdisplay/Makefile                   |   1 +
 drivers/auxdisplay/jhd1313.c                  | 111 ++++++++++++++++++
 6 files changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/jhd,jhd1313.yaml
 create mode 100644 drivers/auxdisplay/jhd1313.c

-- 
2.20.1

