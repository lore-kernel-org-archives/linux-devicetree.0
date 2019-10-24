Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B488BCA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:08:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82ECF20684
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hazent-com.20150623.gappssmtp.com header.i=@hazent-com.20150623.gappssmtp.com header.b="fEC4Tv4P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392312AbfJXLIJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 07:08:09 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39861 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390184AbfJXLII (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 07:08:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id a11so9499640wra.6
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 04:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hazent-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=crqpJF/gwHkmsomaDb8OpyO/FffTCuDAexg/TaLh4BA=;
        b=fEC4Tv4PTMH7uhAUOrLRmfrjzOIjEAo80TJRvbjAe0+PBa9ZsbWovwYosARMsOsKU0
         ax3a/Qn8GrdCM1hVoth6F/J9gYdu7oSOFJINMLxSjPMy6znHJ0i4Dk6jXPHcHLNu3Jt2
         g8ovXhJ/VULZ7Vj7abgJRQaI6Bv0ZEEbg8cLJX7fsUOHzSpoP5LgMk8m4YuGiJ2S2jQL
         0lVDqFMvKkmzN/yaVNfSnIiBVUe6NTidS6xfQiF50GllIp4OETjlCuOpN4YMERuXsibv
         GCTH7mOX1NSJbzXt18qgnhep/hA1GFgqpDltF9LrXgp1tQqAb3s6Qw8JJkSQ0zFtvPRg
         8V+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=crqpJF/gwHkmsomaDb8OpyO/FffTCuDAexg/TaLh4BA=;
        b=re4OYWsi3TOb1tV2WWPDNFJHPKLJKfciX0q4dGODJnxfzBvmqFSMIwiCsFfPvVEg34
         3CzGrUpAfeJXrkV8/OcN74c1HP8cwa7OAtzZzSGra5IXbSIXpez+TZhKC4ORQUvoQrj7
         Pd/66ILgOc2hl3JICYtthKj7gw9idvcqqoKHWSunoeeCbQ4NS3tK+l4TObRtLoA5TP7i
         hHA3YvFR/p6I7VUtbe6yDJ/4gUyWeLFwtHjzDMFakJItYmS45XjHh/q8XOLCIuH2dqlX
         QmUYmsPwwzLgKSLuwFqXhiDxEeBmB/pyIZ4Xv3WeUv+WctK9ifBBbHphhLDAzmvMIOjj
         VL6A==
X-Gm-Message-State: APjAAAV8G/0i+bkXiYneT/SKX8kpfnZ5jb8CZfnz6LkRaVIjZVXBMCof
        UE2bOaWAMrrJ5DOAhW9DhnrsDQ==
X-Google-Smtp-Source: APXvYqzyzUJN8n1oom1/IBXRdUqoiC3M42qRkqVkBeyNaoa+BBzO4nLXhb9mUSbNw78q4yC5OYQaJg==
X-Received: by 2002:adf:9044:: with SMTP id h62mr1491565wrh.91.1571915286700;
        Thu, 24 Oct 2019 04:08:06 -0700 (PDT)
Received: from salem.gmr.ssr.upm.es (salem.gmr.ssr.upm.es. [138.4.36.7])
        by smtp.gmail.com with ESMTPSA id 26sm2420473wmi.17.2019.10.24.04.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 04:08:05 -0700 (PDT)
From:   Alvaro Gamez Machado <alvaro.gamez@hazent.com>
To:     Michal Simek <michal.simek@xilinx.com>,
        Mark Brown <broonie@kernel.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Subject: [PATCH] Allowing Xilinx's AXI Quad widths different than 8 bits on userspace
Date:   Thu, 24 Oct 2019 13:07:54 +0200
Message-Id: <20191024110757.25820-1-alvaro.gamez@hazent.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

We had a couple of days ago a nice discussion [1] about a patch that I sent
that was in need of clarification. I've taken into consideration all the
conversation and I believe this small series will manage my ultimate goal
(being able to use from user space a 32 bits wordwidth SPI slave with
Xilinx's AXI IP core) while being explained enough and through the proper
procedure.

I assume there may still need to be some discussion to go on with this, but
I thought it'd be clearer if we all had the code upfront in its current
state.

First patch documents the new device tree property, while the second one
implements it.

The third patch, that could be applied on its own regardless of the first
two, solves a bug that appears only in combination of spidev usage and a
master SPI device that does not support 8 bits as datawidth.

[1] I have not been able to find a link to the archives of linux-spi, sorry

Thanks,

Alvaro Gamez Machado (3):
  spi: xilinx: add description of new property xlnx,num-transfer-bits
  spi: xilinx: Add DT support for selecting transfer word width
  spi: set bits_per_word based on controller's bits_per_word_mask

 Documentation/devicetree/bindings/spi/spi-xilinx.txt | 4 +++-
 drivers/spi/spi-xilinx.c                             | 7 ++++++-
 drivers/spi/spi.c                                    | 2 ++
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.23.0

