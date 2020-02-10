Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C676DC352A4
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CA0920733
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYrIt4bM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgBJJ1Y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 04:27:24 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42629 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgBJJ1Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 04:27:24 -0500
Received: by mail-lj1-f196.google.com with SMTP id d10so6273168ljl.9
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 01:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JIg5+OltZz+qNz0RRuDFM1jB49i8ZdwPwOhAKksmf8Y=;
        b=KYrIt4bM5BqpJ4+bdw8Ouh+iYEIZvhloTC4PoEaeWXraXTicwzhSJjVriL2dK0QHpc
         MzWKC4cXOMEo7BpxcXlvm1+NLMbo688OL+7QAOtUw06/+tbPj1xtiStQ+GIdM6O2ufNH
         wv+46GX/V1tkQdRzBdEpeKmtkI5OYd1kF6SKqn7YSmbOpJsMxOM/59zJYoicCcvzhbZf
         ewqkYL3GblFJew+0V7a7KBWQsvI1IWqIZXOOoA4zCssdGuD0AcKfZjAqRuHtCfukNQwR
         fUsMYJIUH5PvwdQNgsBvMm0knq9gsh0Z+z33TcfZ5WRKgjD7B9SqFUxeYBc+nHrxiQFi
         Twiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JIg5+OltZz+qNz0RRuDFM1jB49i8ZdwPwOhAKksmf8Y=;
        b=b1ucjnR7OOvpbKVKUWcmNE1G8xJxHr10JKN/RT00ky0Vvkyw9hj3XJaLDd9UKwBBqn
         QOif11+62aXio1ZEBfGgmXu4obebHPQSfHeyayWpEeuklhsU1Mx6ao92STk4NQ1cVqrt
         e3SDV5xmldo9hd2zvyW242FJNge/sgw7Gj9popD/glopQMui4fvcegVWVqRRRzX5QhNh
         SUXe9xb9j6APLikQhdlY9+7vuvwuM4wz8RvZObjpecbpzwZG/afYr1Wf6A2HPVHdQztT
         XI1JopKrsx3/NViIoSwICWOAaZDS6fqbLE6iY34romZsWiXfuNdVqEt5WgI0zKxth6/o
         bwZg==
X-Gm-Message-State: APjAAAVTPXBsenP2dBD2ogKRtY+KHdhN8+2ftoLgVf7knF3YQ5p+QhX1
        Yr5MonEw5nneRIVqtwiOySlTSSlmrIM=
X-Google-Smtp-Source: APXvYqwDUwBuUFIFKY/t/OmKsowDf9RX0RJ5xHbraCkJAtapJJCM9EAJ02li8HubtWZBMbPRHfo4fQ==
X-Received: by 2002:a2e:8119:: with SMTP id d25mr336354ljg.76.1581326841707;
        Mon, 10 Feb 2020 01:27:21 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d9sm5989882lja.73.2020.02.10.01.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 01:27:21 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/7] dt-bindings: Convert the ARM Boards to YAML
Date:   Mon, 10 Feb 2020 10:27:06 +0100
Message-Id: <20200210092713.279105-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This converts the ARM reference designs to use YAML schema
to verify the top-level and in some cases some basic nodes
in the device tree as well.

Rob requested me to get this done: let's get it done.

Rob: when you're happy I can merge this through ARM SoC so the
minor cleanups go in first, unless you prefer another
merge path.

Linus Walleij (7):
  ARM: dts: Versatile: Use syscon as node name for IB2
  ARM: dts: RealView: Fix the name of the SoC node
  dt-bindings: arm: Add Integrator YAML schema
  dt-bindings: arm: Add Versatile YAML schema
  dt-bindings: arm: Add RealView YAML schema
  dt-bindings: arm: Add Versatile Express and Juno YAML schema
  dt-bindings: arm: Drop the non-YAML bindings

 .../bindings/arm/arm,integrator.yaml          |  85 +++++++
 .../devicetree/bindings/arm/arm,realview.yaml | 123 +++++++++
 .../bindings/arm/arm,versatile.yaml           |  69 +++++
 .../bindings/arm/arm,vexpress-juno.yaml       | 118 +++++++++
 .../devicetree/bindings/arm/arm-boards        | 237 ------------------
 .../devicetree/bindings/arm/vexpress.txt      | 229 -----------------
 arch/arm/boot/dts/arm-realview-pbx.dtsi       |   2 +-
 arch/arm/boot/dts/versatile-ab-ib2.dts        |   2 +-
 8 files changed, 397 insertions(+), 468 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,integrator.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/arm,realview.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/arm,versatile.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/arm-boards
 delete mode 100644 Documentation/devicetree/bindings/arm/vexpress.txt

-- 
2.23.0

