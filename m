Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB6EC282DD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 14:02:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E32FD2075D
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 14:02:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="Q7PFKTGx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbgAIOCZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 09:02:25 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40118 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729533AbgAIOCZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jan 2020 09:02:25 -0500
Received: by mail-wm1-f67.google.com with SMTP id t14so2946416wmi.5
        for <devicetree@vger.kernel.org>; Thu, 09 Jan 2020 06:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cH3/OtZ3DAvw8IgKFnqPXU8D4jtKtoD9aLE/M0BbcKs=;
        b=Q7PFKTGxpyCSu9tOEMplXNfwBzehjnBpiHUyvo+zkGU7Jnf4Pk73EORE5sthX5quPi
         NZfAq9ONyqTNDWQUy4XkVGDXC/iLmaFl6eHu/m+CGEyOKWB2SRTyN1Uh4M9aYlQyUCgI
         lPGue0manFc74H5onYbbMtUeLfH150STGLEYotHrptrBwpwaQX5908a5KWP/o3UuS/mc
         +Fhsc2Cgc6sI3nRyMiKGzsTlVjMYnosUMQoLRtSO0m4H2tbVrcV566XiPwRaTQYq1XrT
         h7oXEmdZf1tbOffD4LeeZ4Ye5a3GON25kL38+23iJBXg6Y65XEWVSDfxgNTVCq7X/h8o
         YkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=cH3/OtZ3DAvw8IgKFnqPXU8D4jtKtoD9aLE/M0BbcKs=;
        b=n9GrTbG/IytVyB9B1UA4MuiyqzViQHwAKE/4WyKwnRba5ZWR/YcvRSVOzzBWwCZ1x3
         sQBoory9gkoR+DKcEnrmCF44QMOAJEa04/WFMXnmSa6IGljsf8XboRjyWHXMUY18LWfm
         yOWmcgqhPkOgKOF9lp+FHGmtt9aVK7+ALten8qR4G1TSWoVNjNZ+Fwog8FE1bMqYa/eD
         bZmNyr8516qbtQrh0HlrF40a3qPt7wcULlD4F0EEOfv7TWadZ818r+T1s3rHGOoK5QX1
         KbT67EevQwdWF25kRyCXiHE2s03v2lvEE6HHwiD9mrlP1Guiwl4W5C6JI7SkQbUq9vqC
         Gs7w==
X-Gm-Message-State: APjAAAXgm+7jSmH/9CbaiGpm9tMmdpwl/+C0smZrs1p1IGT34YIBsBlr
        q9Rt+g54otaAlidCOkDyZzpSlg==
X-Google-Smtp-Source: APXvYqz9WNWkReumkSXQjkJSbEUPQl0vWe2bk7mCzx+9uimnftzUwsh7ehidAGZy+lLpg/8XU0tk6w==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr5038497wme.67.1578578543372;
        Thu, 09 Jan 2020 06:02:23 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id g18sm2851975wmh.48.2020.01.09.06.02.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 06:02:22 -0800 (PST)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-arm-kernel@lists.infradead.org, git@xilinx.com
Cc:     Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Harini Katakam <harini.katakam@xilinx.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] arm64: zynqmp: Enable iio-hwmon based on iio ina226 driver with labels
Date:   Thu,  9 Jan 2020 15:02:14 +0100
Message-Id: <cover.1578578535.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

the patch 2c3d0c9ffd24 ("iio: core: Add optional symbolic label to device attributes")
added support for labelling IIO devices that's why I can enable iio based
ina226 driver with label property.

Thanks,
Michal


Michal Simek (7):
  arm64: zynqmp: Enable iio-hwmon for ina226 on zcu100
  arm64: zynqmp: Enable iio-hwmon for ina226 on zcu111
  arm64: zynqmp: Add label property to all ina226 on zcu111
  arm64: zynqmp: Enable iio-hwmon for ina226 on zcu102
  arm64: zynqmp: Add label property to all ina226 on zcu102
  arm64: zynqmp: Enable iio-hwmon for ina226 on zcu106
  arm64: zynqmp: Add label property to all ina226 on zcu106

 .../boot/dts/xilinx/zynqmp-zcu100-revC.dts    |   8 +-
 .../boot/dts/xilinx/zynqmp-zcu102-revA.dts    | 145 +++++++++++++++---
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    | 145 +++++++++++++++---
 .../boot/dts/xilinx/zynqmp-zcu111-revA.dts    | 113 ++++++++++++--
 4 files changed, 360 insertions(+), 51 deletions(-)

-- 
2.24.0

