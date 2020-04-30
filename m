Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D7BC8300C
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 13:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04A712076D
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 13:24:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMWYkcDm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgD3NYq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 09:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726685AbgD3NYq (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 09:24:46 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A15C035494
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 06:24:46 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x2so2860532pfx.7
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 06:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=qEBt0vXjbk5Q4ltgNSW+NS8nyELrH+5nfBRUIqyA6is=;
        b=zMWYkcDmT4hqTCH/QaWiUDvaJmDtfNpCMuXp7fMQTUjj5/ObGmnANccRMz2ukYZM4r
         VdaGCFCp4GSIkaMxu0EK1g7XnpMRebRLE23G5Gmoli9sYmZd4qHE2ty74bnAygVOg+s8
         BN1fmMqDugOHXQwg7GD7dzVCZSS1cBxYGlx8AiT7FZ5ZDTIbjh6qeX1+HoueSmuPkio/
         lcX5j72CsYg5J+ZXocME3MQPHiwqNJpKR7XH6pqmok5bqA8AEsrUc/JOaSim5O6BzWfL
         8KdtgjxwQpe+j2flqiPrfsORlb0wXFGqQsTPF5tuNhMxWuQrCZFqsFcT9ZEKtXsZM1v/
         Tm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=qEBt0vXjbk5Q4ltgNSW+NS8nyELrH+5nfBRUIqyA6is=;
        b=QBLYwKgbNsR/BNTcHbq49S7cx1xMtCCozDJAYm/pXQQG9+qwGUQFrgALaxLEZ39DrX
         /8z2WEL0xAvJ6kf1JLUwtDGogR+x8a/9Q6bfT+kxQBAyBuJeiLHvtI9w9DM+KbSG/0DP
         /oTRDTNkOnafNRv2uXNz3FTmXXjXE2+DV9+Fbx4idKT7SZg+udrRnGRNNrl1BZ931tS0
         +buJTCY70n6Un+FdCfJE6CKxKrVLz466hDty8jfPlCdAqeojEKISYoIljOdyKDlANNEZ
         DTbM5WriMKG9rnjN5LXkW5r3Ho0I63mUth1I2ujZBYAbiDtfv+OFzkT2fuFPW7SNe4J+
         sm7w==
X-Gm-Message-State: AGi0PuaMgoWZY3GhRPaW2bNWt7VP2B8LiAMrQK3k7lVG95g54IDicB0l
        4ASLpkAwrnHqZp9i8AfGRG2cEQ==
X-Google-Smtp-Source: APiQypLwsWQKfyfm0gdb6TRYobt1/StUc+eLmspBqFN9dK8quZw55tE3HuNkq5Cx5ZL7JpR0ypIpXw==
X-Received: by 2002:a63:f960:: with SMTP id q32mr3102166pgk.357.1588253085753;
        Thu, 30 Apr 2020 06:24:45 -0700 (PDT)
Received: from devnote (NE2965lan1.rev.em-net.ne.jp. [210.141.244.193])
        by smtp.gmail.com with ESMTPSA id u15sm1712135pjm.47.2020.04.30.06.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 06:24:45 -0700 (PDT)
Date:   Thu, 30 Apr 2020 22:24:39 +0900
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/2] dts: uniphier: Add Akebi96 Board support
Message-Id: <20200430222439.0ae1c4fa9572c8487fca96b6@linaro.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

Here is the 5th version of the patches to add a devicetree for 
Akebi96 board.

This version removes redundant setting of RGMII, fixes some
parameters for max3420-udc node and add the address to
framebuffer node name.

The Akebi96 is a certified 96boards which is based on Socionext
UniPhier LD20 SoC. Most of the part is similar to LD20 reference
board, but there are some changes.

  - MAX3421 USB-SPI chip on SPI port3 (for USB gadget port.)
  - Simple frame buffer with 1080p fixed resolution.
  - I2S port which is connected to aout1b instead of aout1.
  - 3 serial ports, only serial3 has CTS/RTS.
  - No NAND, only eMMC on the board.
  - OP-TEE installed firmware.

See https://www.96boards.org/product/akebi96/ for details.

Thank you,

---

Masami Hiramatsu (2):
      dt-bindings: arm: Add Akebi96 board support
      arm64: dts: uniphier: Add support for Akebi96


 .../bindings/arm/socionext/uniphier.yaml           |    1 
 arch/arm64/boot/dts/socionext/Makefile             |    1 
 .../boot/dts/socionext/uniphier-ld20-akebi96.dts   |  189 ++++++++++++++++++++
 3 files changed, 191 insertions(+)
 create mode 100644 arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts

--
Masami Hiramatsu <masami.hiramatsu@linaro.org>

