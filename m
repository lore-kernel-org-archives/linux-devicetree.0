Return-Path: <SRS0=Jntx=27=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97C6C33C99
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 07:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CAB820673
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 07:37:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KjSa4cmc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgAJHhj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jan 2020 02:37:39 -0500
Received: from mail-pj1-f46.google.com ([209.85.216.46]:34566 "EHLO
        mail-pj1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgAJHhi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jan 2020 02:37:38 -0500
Received: by mail-pj1-f46.google.com with SMTP id s94so1651410pjc.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jan 2020 23:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SvaOTqe9vv2vgBX/0s0tlxD/m/5uJBFVxQC6/f12J1w=;
        b=KjSa4cmcgVBqcSfdfv8n61/028FjDGN6C1grjJKBT0FgzX9Z2+DacVwxR8bjn4zRx+
         aAZodAJZNLZv0D4Ysy5Buay9JdlGluTI/2xRKLasjw3WCBfwmpV8ZBAI6HNqiV5jpGBn
         RsThcEfoNkOlPgLLcQrb3HyeiULZUdvQCNKO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SvaOTqe9vv2vgBX/0s0tlxD/m/5uJBFVxQC6/f12J1w=;
        b=f6gsD2f9fpmA680mVBKdLscnNc7IlQn19KLHBAN3h6IMpj/JzytScTe5yw3sCnATdD
         XvlB0sQJuRFRddQIRjiN9p4KTcit3RN92rbremVaXTHfuuzAhNMhnaXThD1wsqLvZzT6
         YsZVhtbhbTpIEmuQO7vO0v54vlm9FgimVpza+j6o6L0s0bClnXOeZzQefuwIHlQ8/bk2
         f6QWxZMO8loQDBc/WJaIDJqNfL+t5DcbPnt1n8OV9sSEjP3/5Kpp2t0ZkQ8dYlV11FHZ
         7yjm7Nv34q+kiCVae6N2Sg2w0JI82xU1zwGBjUrSHSVATxCU98+3KNrVTikRkTj4zvkv
         OlQg==
X-Gm-Message-State: APjAAAVcXX6AatFhA9hlF+SrVYSRvPrdoDdFYPdlvXBkzxDGLfh9AAVn
        ocCWpLKeubWC0KVCMIwPszs12tkfxTs=
X-Google-Smtp-Source: APXvYqxytG7Z9y6Z61d5GQU9Hnb21hBVtECYCvXx3qYivuDVxrF71+ICMHxhkVi4/n0R+pxRlfjnuw==
X-Received: by 2002:a17:902:34d:: with SMTP id 71mr2644975pld.140.1578641857781;
        Thu, 09 Jan 2020 23:37:37 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id p28sm1373919pgb.93.2020.01.09.23.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 23:37:37 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH v2 0/2] Add mt8173 elm and hana board
Date:   Fri, 10 Jan 2020 15:37:28 +0800
Message-Id: <20200110073730.213789-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds devicetree and binding document for Acer Chromebook R13 (elm)
and Lenovo Chromebook (hana), which are using mt8173 as SoC.

Changes in v2:
- fix mediatek.yaml
- fixup some nodes and remove unused nodes in dts

Hsin-Yi Wang (2):
  dt-bindings: arm64: dts: mediatek: Add mt8173 elm and hana
  arm64: dts: mediatek: add mt8173 elm and hana board

 .../devicetree/bindings/arm/mediatek.yaml     |   27 +
 arch/arm64/boot/dts/mediatek/Makefile         |    3 +
 .../dts/mediatek/mt8173-elm-hana-rev7.dts     |   27 +
 .../boot/dts/mediatek/mt8173-elm-hana.dts     |   16 +
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   60 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dts   |   15 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 1040 +++++++++++++++++
 7 files changed, 1188 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

-- 
2.25.0.rc1.283.g88dfdc4193-goog

