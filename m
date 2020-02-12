Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E361C3B186
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 16:35:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7534A21739
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 16:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kopismobile-com.20150623.gappssmtp.com header.i=@kopismobile-com.20150623.gappssmtp.com header.b="CosubR0P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgBLQfz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 11:35:55 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39849 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbgBLQfy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Feb 2020 11:35:54 -0500
Received: by mail-ot1-f66.google.com with SMTP id 77so2530312oty.6
        for <devicetree@vger.kernel.org>; Wed, 12 Feb 2020 08:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kopismobile-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0eZSvCNK3gdLQqWXuN5CvAUHuBcFDPQoQpN6GR3z8cw=;
        b=CosubR0PA3uVyu+aEbqYupTko2kmhxDxUOhdeBzW1wL28I3Cy7aph/nZOhY9dtuGmz
         7icJviDkNwhfEq7NiEdMCeLCSSwU/xx/+D7R0qQSjeodyFPOFG+Ri/qWE/cPyj26MDej
         eSXXZLhnbJJ+PvnWXwjNtkXDWim0EaX+4wwphO3eMfSaxytR7A0kkaEMNT7BBMx2URl5
         eypry2HqXpgV8WzjjCK6iusRf9nUpCdZD/5+52FAIMUKlVg4AQVZw9wpK8AplIs3stLI
         WeEf5mzt+iFX/XIZj/Q+cSalCBSnUD6970rFH8eu7a2aw7fwlHTftrHeBLgmZFTR1Ekc
         94EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0eZSvCNK3gdLQqWXuN5CvAUHuBcFDPQoQpN6GR3z8cw=;
        b=pwtAdzCBetNgFw7G5CGlVek9TwqvfUWHvRGLsFgcoIawghWvjJ+Zpo/tZAsNBsbaV9
         YOeVMAriw+fS6P610R7XB0v2iUTHYERMAQcU4vRwOX4QKq7NdL1VlIHqvlCoNpR5RGXa
         oeTFPGmCr5l3KGuke5wcORDP1TV/sjlBHXKK9ASP6Sg5f9CgKC3LBb9jAbt0PdV7193H
         Z5M3RoFuMdSZQDuWQU0gpdjLIXnV4o4NWn7LJ/rm1JGfG+ZYbdD7D5oZuj+bRghRE06j
         0b9i0dDNBkoSU6cifIF91nPPS6wywrrtlWVuW7GpGcJo29JdwHEI2WP8kSa/k/DKnfja
         RqSA==
X-Gm-Message-State: APjAAAUmeQlbcLe/9571oLMDOJ6j6QUkNAv0J+hTz+VEKDEbE3QMFE5o
        keABZe0Zjlkig9kuXotVVZsV8Q==
X-Google-Smtp-Source: APXvYqxY4STQDOv2ETVixf+U7ZakBTOQRmdGa+EuNr5Zs/QTLD3Lw6XecFR4zwcSJbUPEGOu6rEE5Q==
X-Received: by 2002:a9d:6d10:: with SMTP id o16mr10307299otp.28.1581525353123;
        Wed, 12 Feb 2020 08:35:53 -0800 (PST)
Received: from farregard-ubuntu.kopismobile.org (c-73-177-17-21.hsd1.ms.comcast.net. [73.177.17.21])
        by smtp.gmail.com with ESMTPSA id q22sm321034otf.17.2020.02.12.08.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 08:35:52 -0800 (PST)
From:   George Hilliard <ghilliard@kopismobile.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     George Hilliard <ghilliard@kopismobile.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de
Subject: [PATCH v3 0/2] Implement support for inverted serial TX/RX on i.MX
Date:   Wed, 12 Feb 2020 10:35:36 -0600
Message-Id: <20200212163538.3006-1-ghilliard@kopismobile.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This peripheral has dedicated control bits that flip input/output
signals before handing them off to the OS.  This is useful on my
hardware because the UART is connected to an RS-422 transceiver with the
+/- pins hooked up backward.  Instead of a hack flipping all the bits
before sending them, the hardware can do it for free.

Revision 3 sets *and* clears the bit as necessary during startup.  It
also moves init before transmit is enabled.

George Hilliard (2):
  dt-bindings: serial: document fsl,inverted-tx and -rx options
  tty: imx serial: Implement support for reversing TX and RX polarity

 .../bindings/serial/fsl-imx-uart.txt          |  4 +++
 drivers/tty/serial/imx.c                      | 29 +++++++++++++++----
 2 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.25.0

