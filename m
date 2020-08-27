Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACB5C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 01:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07FB82087C
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 01:50:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="fT+dW9P/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgH0BuG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Aug 2020 21:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgH0BuG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Aug 2020 21:50:06 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70EFC06134D
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2020 18:50:05 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id e1so5365885ybk.14
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2020 18:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=kI87pt4IL87WeMlhQ+cq6jv+hjTA9JuH40a82jlPo3k=;
        b=fT+dW9P/B2jsQN6UzMCNYitt1FhkZ2EgLVRxO8SI73Y1MIl175TvZVJOkeJv9lKYS1
         7j7v0LBE4pPOY3NjfW6igBChFc3bFulo5XuCcTVNGL6EGEj/jy1O3fS2KTtezXxdNy6d
         4JgoLTvPWczkkgoEda/iQXFy8xIvKYGO2X9Tm/iu/qTwCPTOKjWrk0OoBWs/yAXNFvVW
         luyC/lOKK26zqSoITqE2rn+7SfNFHjHOgAOaBWoX3wFdfZcADbdpqh/aFFZ0enNR/nMQ
         QlXeMC7wmizyvNElsGqxvEopYaPtOY9pzv5nPsNasRj/3iVDas8cSQZBfiiFo/M2zSpO
         1+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=kI87pt4IL87WeMlhQ+cq6jv+hjTA9JuH40a82jlPo3k=;
        b=pdlP6cqLjIdOuylBjv/+Pf4SLsBaahWkwheASdJkQaEZTiXeQGc7PQMjvOKFp/tCyr
         wCCytwXMm4qAjznHwOT/mMj7kUB0domI1rSWpfkStfJzeZ34YGF35CH+87/Qi1rinzlS
         2DmZ546XEJTgZMHFYfeXxmC2EfTOy5vu5dfNMmEgbHZMloJf5tIakkhJrfmwMJQB+9ZI
         SqhwmtnySpYAhoMl9a1JDY7nhRpQfln72TE6UkkTStZw/c2Aek6CFfGJov8YZe4BwjkA
         CZ45anZLEIL6rgf7sOAGf9QzwBx68OEbdz8yd8CwX+aa53/dZNejNsBqWFYtpZso+JPx
         Q1JA==
X-Gm-Message-State: AOAM533V7eS/e871UiWN2RsdCXtFZ93wK2e0NiTwfqksmdEvPupfDxCb
        rb3+9thh+rfkFDi0TzG4ci3w3GHEGALC
X-Google-Smtp-Source: ABdhPJwa3pv3Hu/+UkZbQW3sc70xWqy/UBXE05JvwXvifOJWs+ZvIJGMacTjSpT/pEhrLHiVX/Z062RKwsuI
X-Received: from nandos.syd.corp.google.com ([2401:fa00:9:14:725a:fff:fe46:72ab])
 (user=amistry job=sendgmr) by 2002:a25:8b09:: with SMTP id
 i9mr25344049ybl.149.1598493004751; Wed, 26 Aug 2020 18:50:04 -0700 (PDT)
Date:   Thu, 27 Aug 2020 11:49:52 +1000
Message-Id: <20200827114934.v2.1.I6d12081e37d27ba7580a1af877727d882935787a@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v2] arm64: dts: mt8173-elm: Set GPU power regulator to always on
From:   Anand K Mistry <amistry@google.com>
To:     linux-mediatek@lists.infradead.org
Cc:     djkurtz@chromium.org, Anand K Mistry <amistry@google.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Keep the da9212 BUCKB always-on. This works around an issue on Elm/Hana
devices where sometimes, the regulator is disabled before scpsys is
suspended, causing the suspension of scpsys to fail.

Usually, the GPU and scpsys are suspended by the runtime PM before the
system is suspended, due to the GPU being idle. In this case, scpsys is
suspended inline with the GPU suspend, which then disables the
regulator. However, if the GPU is still active when system is suspended,
GPU suspend occurs but defers suspending scpsys to the PM's noirq phase.
Since GPU suspend disables the regulator, scpsys isn't powered and
suspending it fails with the following error:
[  523.773227] mtk-scpsys 10006000.scpsys: Failed to power off domain mfg_2d

On resume, scpsys is resumed in the noirq phase. Since scpsys requires
power from the regulator, which is still disabled at this point,
attempting to turn it on will hang the CPU. A HW watchdog eventually
reboots the system.

The obvious solution would be to add a link to the regulator from scpsys
in the devicetree. This would prevent the regulator from being disabled
until scpsys is suspended. However, in the case where suspending scpsys
is deferred to the noirq phase, disabling the regulator will fail since
it is connected over I2C which requires IRQs to be enabled. Even in the
usual case where scpsys is suspended inline with the GPU, PM will always
attempt to resume scpsys in noirq. This will attempt to enable the
regulator, which will also fail due to being unable to communicate over
I2C.

Since I2C can't be using with IRQs disabled, a workaround is to never
turn off the regulator.

Measuring power on the GPU rail on an Elm DVT device shows that the
change in power usage is negligible. The two relavent cases are S0 with
an idle GPU, and S3 (system suspended). Measurements taken using a debug
board every 100ms for 1 minute.

In S0 with an idle GPU, current behaviour with the regulator off:
@@           NAME  COUNT  AVERAGE  STDDEV      MAX    MIN
@@         gpu_mw    600     1.74    1.31     6.75   0.00
... and with the regulator on, but no load:
@@           NAME  COUNT  AVERAGE  STDDEV     MAX    MIN
@@         gpu_mw    600     1.68    1.25    7.13   0.00
The difference being well within the margin of error.

In S3, current behaviour with the regulator off:
@@           NAME  COUNT  AVERAGE  STDDEV     MAX    MIN
@@         gpu_mw    600     0.94    0.74    3.25   0.00
... and with the regulator on:
@@           NAME  COUNT  AVERAGE  STDDEV     MAX     MIN
@@         gpu_mw    600     0.83    0.66    3.25    0.00

Signed-off-by: Anand K Mistry <amistry@google.com>

---

Changes in v2:
- Remove CHROMIUM from subject line
- Correct device in subject line (8183 -> 8173)
- Grammar/clarity changes in description

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a5a12b2599a4..1294f27b21c1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -304,6 +304,7 @@ da9211_vgpu_reg: BUCKB {
 				regulator-min-microamp  = <2000000>;
 				regulator-max-microamp  = <3000000>;
 				regulator-ramp-delay = <10000>;
+				regulator-always-on;
 			};
 		};
 	};
-- 
2.28.0.297.g1956fa8f8d-goog

