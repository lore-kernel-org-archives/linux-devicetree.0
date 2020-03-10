Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94981C18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 13:46:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68C8720637
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 13:46:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="abZroker"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgCJNqJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 09:46:09 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:37765 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgCJNqJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 09:46:09 -0400
Received: by mail-wm1-f42.google.com with SMTP id a141so1418944wme.2
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 06:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wD/rjwDaFSH4m0qLvYcsJe5uINdhvscpogJ3gh+ddBE=;
        b=abZrokerv1XQs4CdYgMZDC/O5UauiH6mqKC2Rrdy1tv4xSXq1RKsr+iLSyaMu5QRrY
         eNToWk64+vZzKd5eeIFecdjcgvg5U62vU7dexhWjTJGcM9vb+TmvA6P4A4xsOXQvW2fi
         wb2/v2YN1HJGBWhNsaZaJsTHq9C+BIA4ID0FoIbZUuGmip1war0RJ9oU2O6ca/Eb8bnp
         lKwQxo9FxcvxnukaM01tLAXT2mdTHQ+BWTwNmBjHEBFWXKM+WWrV9KQRZ9Gjn8GzG1NP
         UzG8pjbwxIVQlVYsWb8vQaUL2aaeAjFaIZ9pL5L7SBi0tKFDOAG5ttq+QXKgWrlHYdsw
         mQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wD/rjwDaFSH4m0qLvYcsJe5uINdhvscpogJ3gh+ddBE=;
        b=VAbt3Q516XJsWh80Eka54U3rfEElRKPMx06JuzONv/JKvVHB3OWHesWmnaVR4pglRv
         hwPthzm3pZ1W4gWukcGOjIpy50WHM39Js1ItHG7hXi7vACYUlzD0PmmL5xJ+/SNcyLqy
         Kar6wDT8UhkQT8HyOPdwiNqZStKV2jCGyVojm6mBhDh57ECoFaWYQJtVUSR5wgcQkE4m
         +n9LTG8oarjsjtCIocmLDpsmXbOTvmwY8k87kxWEmeUVCKTDZSL+Coi5bBHI0uzJ0V1s
         B9YGP1beZE/bvktFz20A19IheYKbqTyLfLpV4r0QfDD7A6hdlMfeW8uus9Vzsn3HZ9d6
         Rd1w==
X-Gm-Message-State: ANhLgQ1sfem0szwoyEx0aEWT4BODYmUdWFARRy/eDsRaH7/PhceRrYWO
        c88UD39adGVrsbCyjw3ept/VSA==
X-Google-Smtp-Source: ADFU+vsAqODaD7c54dhNVCiGo6mkHHmbHDjZbcCM9Ns8rtR6QHeWU2SEQUgGGnzoUNA8SRhX+nS2rA==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr628899wmc.171.1583847967491;
        Tue, 10 Mar 2020 06:46:07 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:e50c:c780:9a1:8b61])
        by smtp.gmail.com with ESMTPSA id d63sm4074009wmd.44.2020.03.10.06.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 06:46:06 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     ben.kao@intel.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, matthias.bgg@gmail.com, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: [v1 0/3] media: ov8856: Add sensor modes & devicetree support
Date:   Tue, 10 Mar 2020 14:46:00 +0100
Message-Id: <20200310134603.30260-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds devicetree support to the ov8856 driver.
In order to to aid debugging and enable future sensor
modes to be supported, module revision detection is also added.

Dongchun Zhu (1):
  media: dt-bindings: ov8856: Document YAML bindings

Robert Foss (2):
  media: ov8856: Add devicetree support
  media: ov8856: Implement sensor module revision identification

 .../devicetree/bindings/media/i2c/ov8856.yaml | 129 +++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov8856.c                    | 153 +++++++++++++++++-
 3 files changed, 281 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

-- 
2.20.1

