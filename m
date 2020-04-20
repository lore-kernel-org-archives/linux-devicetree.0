Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190FFC3815B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 10:08:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3EC12145D
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 10:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="um2q1dsj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgDTKIB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 06:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725959AbgDTKIB (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 06:08:01 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A677C061A0C
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 03:08:01 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o10so1574818pgb.6
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 03:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=dDKuyiXRSokrVaBMm2QH2sBSp5Ab0s7jSQxz7hO7RDM=;
        b=um2q1dsjJswgeVFtBuA1BvgkYFI4560fuIaA2EvQVO7j/YhXdLCnyvPDFnwB+BuJM1
         5Y3KPkt5k1qvoB15ROb23OMCCNl6oBMZnk5Y/Tw6FhG2AukG+jYslKwtqzM5rrD6f0Kk
         enwIYHAg1HWenoZ05ou264qDtn4u5tD4YXuedjCZOrJ7fHLQz9/4e9rtznlFBMsYSM5M
         YURzyEuYObP5IjyNzPf3Vl4QmVM6YyF4eXsqKMaMojKL2MemDjKNCZFXLGNc13/xnLK6
         p+w7AzxWG+7Ty2d91GpmF4k5vID0izetQrK1aONGNyr0AM33ITm7vPo/M7ET15cA2mCl
         /LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=dDKuyiXRSokrVaBMm2QH2sBSp5Ab0s7jSQxz7hO7RDM=;
        b=DuNwn0NxY00Wst4tnIF42M/adV1rSopHbwJYITiolh530Jn8R0WRDX8oWLsEvWlpdT
         7+mHS72zgiuqG+OeXjw5MzPx/rPwA2kQFtN4a4w3fTLoXmbnwzHvxTaD8KcRHoIEXMiN
         LvZyyzqtJFBVGVf5gnpUvBvLRS7aMTYDPneDCMao70D64lp3V9Qq++9hHzltfoe1KxrO
         C8v264q9GNw7jxu/jMM9bqMbfvANfjWksxsu6g8NfaExvbHOnOuVzoTAE4BE5wLt8gE7
         i8Rnt9Ozvf7uMVeTY3cTJlIKWmcRiBRIP9ro4qzeOQC9ijpf5iOLsdl3bAgAkKa09TPq
         A9BA==
X-Gm-Message-State: AGi0PuZZhC6RfekX2Y+jEJujPUmNhqZCUspu7b+jl7ID6Y+2zoBc4y+e
        UxrLyp/6bymX8Iev5z4o9OwcbQ==
X-Google-Smtp-Source: APiQypLq4OY2K4KWyTUe3RnCjyUXv1m6u1a7Qwmj0M+jirUcanTWIygrVjmvGonNUodZQwyclKduVQ==
X-Received: by 2002:a62:34c1:: with SMTP id b184mr2108623pfa.73.1587377280645;
        Mon, 20 Apr 2020 03:08:00 -0700 (PDT)
Received: from devnote (NE2965lan1.rev.em-net.ne.jp. [210.141.244.193])
        by smtp.gmail.com with ESMTPSA id i16sm684144pfd.108.2020.04.20.03.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 03:08:00 -0700 (PDT)
Date:   Mon, 20 Apr 2020 19:07:28 +0900
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] dts: uniphier: Add Akebi96 Board support
Message-Id: <20200420190728.d720d18b9073e1c6c0304d72@linaro.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

Here is the 2nd version of the patches to add a devicetree for 
Akebi96 board.

In this version, I fixed author's tag and rebase it on 5.7-rc2.

The Akebi96 is a certified 96boards which is based on Socionext
UniPhier LD20 SoC. Most of the part is similar to LD20 reference
board, but there are some changes.

  - MAX3421 USB-SPI chip on SPI port3 (for USB gadget port.)
  - Simple frame buffer with 1080p fixed resolution.
  - I2S port which is connected to aout1b instead of aout1.
  - 3 serial ports, only serial3 has CTS/RTS.
  - No NAND, only eMMC on the board.
  - OP-TEE support.

See https://www.96boards.org/product/akebi96/ for details.

Thank you,

---

Masami Hiramatsu (2):
      dt-bindings: arm: Add Akebi96 board support
      arm64: dts: uniphier: Add support for Akebi96


 .../bindings/arm/socionext/uniphier.yaml           |    1 
 arch/arm64/boot/dts/socionext/Makefile             |    1 
 .../boot/dts/socionext/uniphier-ld20-akebi96.dts   |  200 ++++++++++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   |    2 
 4 files changed, 203 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts

--
Masami Hiramatsu <masami.hiramatsu@linaro.org>

