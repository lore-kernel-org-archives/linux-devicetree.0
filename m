Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93BBC54FC9
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 03:14:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F981214AF
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 03:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Snl8w6Ii"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgDTDOZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 19 Apr 2020 23:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725865AbgDTDOY (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sun, 19 Apr 2020 23:14:24 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5416C061A0C
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2020 20:14:24 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o15so3803303pgi.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2020 20:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=4mVJ1FTOt1x3OaP5F9BtaelhJos817xQwCsSJCY0EeE=;
        b=Snl8w6Iinx9QqYh8SrgZMl6DLamzu2YaFrn6sg/eo4Zp5hFuErtFmZ60db/d7x/You
         xdl/FH5xdhGnaXdGC0GzMsiEeULPAi6lD0k6GujXvsfbquV7vDSb8gQaiGS+ZvxFQtI3
         x01pVXzLTzxTivhEM0NRGZL4k41wF7ys+74kDdr6KHCeXxhMTohl+XSyu0sMim/94nUB
         u1B23E0E86KEfByga9JRg/yw5eQmWlNSOtVFYlJZu2Kb/VTX2qjQXvOSNqJInH0CmXsz
         /ibOYOrjAi19jF4SxsuJrJxfaumbhxYwE2Lpr9uA8THOsj/QN403CxrDq1nQKQFYHKUt
         VQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=4mVJ1FTOt1x3OaP5F9BtaelhJos817xQwCsSJCY0EeE=;
        b=KDlszjGGfUkU/M030+uEqi0NTPiRdb7FXTrGiAfwiiwZYggeKxVqSZsFdrZvnJFm0q
         oCHDU8TcEQkIFJ+KJpvOhfB15nmxoneYqhz+KzHNJRtl9B0h5t2i9bcwLgCa85Ya9Cf7
         T91O3xHftwdo32gFFIH8jPeVk9mPNwbo7tlKbVjgUfJDokYvjcLbvke14G/qIHCP/ArQ
         HOH92yWOA6f63lFIjuIvT67ugCf/Rz36n27yGJR11qIwa0UiI+zUgb127ei3DOZ4sssQ
         1IUgDJdBcj4SgGS6/2vF4gez1xeI4hTbA/96ToNhO54LzFkJ5EmH7O1faDbbpk4Oy+I9
         ckMA==
X-Gm-Message-State: AGi0PuY1gJrNDCcODdVlAVB7lblSMCNsGlth4dZFJYfVtu5G8Mt7YoS5
        +IB2O1BTv69epRt8QzqPI124SQ==
X-Google-Smtp-Source: APiQypLSYsMECWGP+OF/c8ojJhhiomIzYGAYkibR1zcGdXrq7v0P8bMNUpaQ3mpnFatF9Yu8iyarXg==
X-Received: by 2002:a63:64e:: with SMTP id 75mr14021493pgg.342.1587352464115;
        Sun, 19 Apr 2020 20:14:24 -0700 (PDT)
Received: from devnote (NE2965lan1.rev.em-net.ne.jp. [210.141.244.193])
        by smtp.gmail.com with ESMTPSA id b75sm12525541pjc.23.2020.04.19.20.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 20:14:23 -0700 (PDT)
Date:   Mon, 20 Apr 2020 12:13:58 +0900
From:   Linaro <masami.hiramatsu@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] dts: uniphier: Add Akebi96 Board support
Message-Id: <20200420121358.f1a392f54710084acfa96370@linaro.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

Here is a couple of patches to add a devicetree for Akebi96 board.
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

This patch can be applied on next-20200417.

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

