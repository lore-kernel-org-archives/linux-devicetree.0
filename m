Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDCAC3815B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 15:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9ADF5206F9
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 15:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dP/sa21A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgDTPE6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 11:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgDTPE5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Apr 2020 11:04:57 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72727C061A0C
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 08:04:56 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y22so4050815pll.4
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=ksYDvDMifJSDzaLe8ppl9fPQsaUEh1BKmaFRsUu0FRM=;
        b=dP/sa21AeYjRWh1TVvNJkTvzmFhd54MB5zWkbXU4Ne62xEiz68w1XgIJMNEdq6YlCy
         xGSqNK7lUNgWAY+LHRdie8zraBNtFqfCK0EuW6KWJw2QHezbZzuG0VJ+Dy4Dxj8A7mos
         xwZ4PpPVMVPmM/zFmy1BIRyxBgA1HBp/r+N9RqnX92Z6nFIOcR5e51E9DQy39RXR32Um
         X8TN8WRJXSUJ5I0/O/qy+ubc2y5ADDKjVHqA3/tdfRAwLo894nBIr/Tik0Qx/kldiA4e
         pp2N69oN169709NunCURUKgaCsTzKrVslDj3VCCU+6IXj8CoTjjSDVM4QYa5hbfT79xG
         Kefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=ksYDvDMifJSDzaLe8ppl9fPQsaUEh1BKmaFRsUu0FRM=;
        b=MtXh3IBtvmxmFQSjfrwcoXjLEw8y+opkZkAnOkk++5HI1xg4/blk+DzYdDXBkNYImt
         wvKgZqd2HZliFHVCzrFlTjquYrrAhNNYeeIYN7xdi8O9/UG8B3L/wfoMa0/tLJnfTY3t
         2mznC6owb74MJH5psCnQq1Z2dnqhdjXwAE0Bg82nd2Iu6sH1ZKvedsyC+zO4RWka9Ql2
         x2vuuwLQx/Rxb9wBQzgUeAy+wSKvmDfppnZPCFrzwqc/bH36GMYkF9mDi4aSAZyPNP3n
         KBQ7g0ZhREqFeCiaAaf30d03N49w2/mvSHbMjtmpQFlAsQfc0j+o4PCpXxduLJB3f0lk
         gWmQ==
X-Gm-Message-State: AGi0PuZ4MXhuM5dXRK7+wVsv2i6psU7xipACFIxj9kQcRgIbG9kRxkQJ
        NaazFeCb2Mw3idB4SMl/9Cawfg==
X-Google-Smtp-Source: APiQypIk1Du+aGj95qRFJMvPft4RvKQ+RUnkIms4lRS+8pbRyvlYkpkqC8LQsyngAi4hAvzbX7aOwA==
X-Received: by 2002:a17:90a:8d02:: with SMTP id c2mr19342929pjo.113.1587395095926;
        Mon, 20 Apr 2020 08:04:55 -0700 (PDT)
Received: from devnote (NE2965lan1.rev.em-net.ne.jp. [210.141.244.193])
        by smtp.gmail.com with ESMTPSA id n16sm806835pfq.61.2020.04.20.08.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 08:04:55 -0700 (PDT)
Date:   Tue, 21 Apr 2020 00:04:22 +0900
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] dts: uniphier: Add Akebi96 Board support
Message-Id: <20200421000422.6823a1a023161a987aad0d05@linaro.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

Here is the 3rd version of the patches to add a devicetree for 
Akebi96 board.

This version simplifies the devicetree according to Masahiro's
comment and update patch description. (Thanks!)

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
 .../boot/dts/socionext/uniphier-ld20-akebi96.dts   |  190 ++++++++++++++++++++
 3 files changed, 192 insertions(+)
 create mode 100644 arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts

--
Masami Hiramatsu <masami.hiramatsu@linaro.org>

