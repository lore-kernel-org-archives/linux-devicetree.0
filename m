Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33038C282DD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 13:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 062E82077B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 13:39:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="vw351ySw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgAINjT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 08:39:19 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50620 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgAINjT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jan 2020 08:39:19 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so2978929wmb.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jan 2020 05:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=btljfB67qHdrjxduirx8+8GpyguI3bz2CxoaGmxzpS8=;
        b=vw351ySwviRIJKPA8Q0zzDXwDtsIhYFO4r0RObdb9vUY30tiXmPeFopdEye82KVX/r
         l6ilqipW3OsfTTRaqaxhlw7wlY/IbiX+8wmHW9sH+Im2zFTVvYah0o7YjujMM2eClwne
         ZBE/BFdcdRxGU2zUNVRgf3h0JtBoJNIPBByULotXTamyZjRTFKVbBUsA2Qsg2vaNfS9M
         cbTmiJt4D2KW+EqSUWGJSk+WVpbzd7silXU2LZY0a7YAB0VK8L4XeLhMdyYCjRPI1tBG
         fL/BPbqESrXFmdN8uEpV9a/kCNncgAwtdCBW2TtH62KZWTTkSIgxKuppky3NSJhS6/+G
         +ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=btljfB67qHdrjxduirx8+8GpyguI3bz2CxoaGmxzpS8=;
        b=NVogrocRq699lD8na4F0HiLIThTRRLUwtNWpqcPQZ1YvdV1NlfV10JfcRsHDmQyXcN
         HSiuLwMfLxnCpWfWqX2zlUMLm8qY2/ntJK71H/e1CfwQDODOdUhBMgl5025xNQ+AD5ZB
         Nxndh13q6guqM4KNoYJ23MrJm71p6DjaU0H42sNqepnwkfIZjfEEdr0vDQe8rPm9yBCy
         eXQTbdI+eLaelYw0qTKed4zRbB3s9yrtN7g0v82PRtp5N+qUBr1/wWFgNo5H/0DHPqbO
         jGumONlqXkIRGIro1ArEIjNdSpOB+S8mN18c5THN1+/tMwPo5XEgloY5d+0m87+UYOEf
         LazA==
X-Gm-Message-State: APjAAAUxjOSJEYaY3WwdUfzOKaD+bJowlURWv8JEXlph8V8Jm9EFJ0df
        HGvKhMFDSyxd9S6lzcIoj5Zkig==
X-Google-Smtp-Source: APXvYqy1FNte4go1SSvuH+JEJzPEKxJcLvB0V5zulbJ2Nj6EAR0N22snabejqCaDbAolNSQ2vR76Ag==
X-Received: by 2002:a05:600c:2254:: with SMTP id a20mr5021431wmm.97.1578577157386;
        Thu, 09 Jan 2020 05:39:17 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id z123sm3036704wme.18.2020.01.09.05.39.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 05:39:16 -0800 (PST)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Harini Katakam <harini.katakam@xilinx.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] arm64: zynqmp: Various DT fixes
Date:   Thu,  9 Jan 2020 14:39:09 +0100
Message-Id: <cover.1578577147.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

I am sending various DT fixes which have been found over the xilinx
release.
1-2 patches are fixing reported description issues
3-6 patches are actual fixes.

Thanks,
Michal


Michal Simek (5):
  arm64: zynqmp: Fix address for tca6416_u97 chip on zcu104
  arm64: zynqmp: Turn comment to gpio-line-names
  arm64: zynqmp: Setup clock-output-names for si570 chips
  arm64: zynqmp: Remove broken-cd from zcu100-revC
  arm64: zynqmp: Setup default number of chipselects for zcu100

Venkatesh Yadav Abbarapu (1):
  arm64: zynqmp: Fix the si570 clock frequency on zcu111

 .../boot/dts/xilinx/zynqmp-zcu100-revC.dts    |  3 +-
 .../boot/dts/xilinx/zynqmp-zcu102-revA.dts    | 45 +++++--------------
 .../boot/dts/xilinx/zynqmp-zcu104-revA.dts    |  4 +-
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    |  2 +
 .../boot/dts/xilinx/zynqmp-zcu111-revA.dts    |  4 +-
 5 files changed, 20 insertions(+), 38 deletions(-)

-- 
2.24.0

