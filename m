Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72765C2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 02:44:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A53B2075E
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 02:44:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eOrNJpdK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgDVCoe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 22:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725912AbgDVCoe (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Apr 2020 22:44:34 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E64C0610D6
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 19:44:34 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a32so232383pje.5
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 19:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=17DeBbOuJOkYUumUllYYpaTlS+VBGmVOwtkd/Zl7kXg=;
        b=eOrNJpdKigtIk7ORw4Z+7QkcUAQOT0AvDZ5BbujhISyKxFY2nVSlY020cLD5J4Q6F2
         /a3tvHTOZta6T8U/eVi39qhOgHpWIJNwpJIgCpNX1UN+HCp3N6aiq7qMaU/TchA6cAOf
         gyC6QjK6qch8uXLfcbDGXTi/D3eDsD/Qwoc6lO/6GXZtXo0A+MnR1Jy/1w7SqU3XMVVg
         hIoZ525SQN/QqBB9aiS/d3WhAx8FHqTC1BdCLM55h0bW1FmCD9wUKUju67Vri1Xq0k/3
         /h7ok5hBFLKeSNCFAK2s8D7GIu1dLIr528NeDkWkdjnv65Ixv0o7AfriKALJv8awGB9g
         Xi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=17DeBbOuJOkYUumUllYYpaTlS+VBGmVOwtkd/Zl7kXg=;
        b=XZ+NNAaYSIWKk2t6+0+D/NpIzEyZOOv8CM9eVyB3QSUgIGTVrGYLo4rjKYQ3AlgyzM
         3qeqUql3AlxGaBGzW3B7UYcxsNIUgqqHRgzNJfkDqZwg+n6nrwD/XXzPEiHDca0yKcsS
         7Qlh+DGNVnH8gcualbunte7wiQNWC+GcYp/vt2mhB4zPepx5wmMwBRW2wTnzuRDR0Woj
         YtHy0lSix818Wufr7Iokf2go4QTay0a7TiRUGXJnl4s0z+fmHuCNX0aC71jndXPd6RbU
         vvZbrTRAqYjsL/VUwVd40Ur0cJFZFQJaSNhZX2L/WVWHO39kd8PeJ9l4vIfy9q9rHM0E
         +DJg==
X-Gm-Message-State: AGi0PuaOY8Ze472wsbrk+YfkuInKIPgA8IY/qApiOGWZRy7T9vgYpcn0
        J8crFMNyPK164b9ND3vMI5u5yA==
X-Google-Smtp-Source: APiQypL9P1l9F+Oz0txNdc1RqtELqyQOKzxMmkkIK33mjwIy1oqRhCQzU1EuIbbx2Vw7sO91kK4eAg==
X-Received: by 2002:a17:902:700c:: with SMTP id y12mr15446497plk.162.1587523473517;
        Tue, 21 Apr 2020 19:44:33 -0700 (PDT)
Received: from devnote (NE2965lan1.rev.em-net.ne.jp. [210.141.244.193])
        by smtp.gmail.com with ESMTPSA id b11sm3569232pgj.92.2020.04.21.19.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 19:44:32 -0700 (PDT)
Date:   Wed, 22 Apr 2020 11:44:29 +0900
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/2] dts: uniphier: Add Akebi96 Board support
Message-Id: <20200422114429.0b1a6f1a3366bae5964f3e10@linaro.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

Here is the 4th version of the patches to add a devicetree for 
Akebi96 board.

This version fixes pinctrl_aout1 to remove unnecessary "aout1"
since which is not connected on the board.

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

