Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B16C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 08:25:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82E5F20714
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 08:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="eEPCiD7S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgG0IZU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 04:25:20 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:15492 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0IZT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 04:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595838317;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=ymFhDf2n8j14zfm7wXMkjoAX9qryOdYV+fcCssWX+cI=;
        b=eEPCiD7S5YEUOiyy9FcXyuWy3m5XwGXd6AWb2Y1W+ed2lIhZMITF8Nw3f18lHlzHPd
        Pt1E7NfGdrpdln5loC8+9RLjJilDC/fOpjAv7KaFQ+BUmqrEphK6UZygA5i0DVGMEgeH
        mdxKmuJ73qa7VtDalAgILG0LKAtQVSov+qk3gwjtqYjbiWQ4HP8Tln9/SDi0+ffG6lw7
        Z4KepUYcBuIIwmL9TuHvcQV6KunGss8qpQmMQdlOgyRp+7P66UrLnNgKhe5W+YlgW+iS
        gWbWXHHHbn/EjafATx0+sxmQapAFagJCp/XJq+j4LtQU+kxMO6i0GtemqJGMWYmEjSPM
        xFrA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6IbY0="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6R8PGKLZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 27 Jul 2020 10:25:16 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] ASoC: dt-bindings: q6asm: Add Q6ASM_DAI_{TX_RX,TX,RX} defines
Date:   Mon, 27 Jul 2020 10:25:02 +0200
Message-Id: <20200727082502.2341-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Right now the direction of a DAI has to be specified as a literal
number in the device tree, e.g.:

	dai@0 {
		reg = <0>;
		direction = <2>;
	};

but this does not make it immediately clear that this is a
playback/RX-only DAI.

Actually, q6asm-dai.c has useful defines for this. Move them to the
dt-bindings header to allow using them in the dts(i) files.
The example above then becomes:

	dai@0 {
		reg = <0>;
		direction = <Q6ASM_DAI_RX>;
	};

which is immediately recognizable as playback/RX-only DAI.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/sound/qcom,q6asm.txt | 9 +++++----
 include/dt-bindings/sound/qcom,q6asm.h                 | 4 ++++
 sound/soc/qcom/qdsp6/q6asm-dai.c                       | 3 ---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
index 6b9a88d0ea3f..8c4883becae9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
@@ -39,9 +39,9 @@ configuration of each dai. Must contain the following properties.
 	Usage: Required for Compress offload dais
 	Value type: <u32>
 	Definition: Specifies the direction of the dai stream
-			0 for both tx and rx
-			1 for only tx (Capture/Encode)
-			2 for only rx (Playback/Decode)
+			Q6ASM_DAI_TX_RX (0) for both tx and rx
+			Q6ASM_DAI_TX (1) for only tx (Capture/Encode)
+			Q6ASM_DAI_RX (2) for only rx (Playback/Decode)
 
 - is-compress-dai:
 	Usage: Required for Compress offload dais
@@ -50,6 +50,7 @@ configuration of each dai. Must contain the following properties.
 
 
 = EXAMPLE
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 apr-service@7 {
 	compatible = "qcom,q6asm";
@@ -62,7 +63,7 @@ apr-service@7 {
 
 		dai@0 {
 			reg = <0>;
-			direction = <2>;
+			direction = <Q6ASM_DAI_RX>;
 			is-compress-dai;
 		};
 	};
diff --git a/include/dt-bindings/sound/qcom,q6asm.h b/include/dt-bindings/sound/qcom,q6asm.h
index 1eb77d87c2e8..f59d74f14395 100644
--- a/include/dt-bindings/sound/qcom,q6asm.h
+++ b/include/dt-bindings/sound/qcom,q6asm.h
@@ -19,4 +19,8 @@
 #define	MSM_FRONTEND_DAI_MULTIMEDIA15	14
 #define	MSM_FRONTEND_DAI_MULTIMEDIA16	15
 
+#define Q6ASM_DAI_TX_RX	0
+#define Q6ASM_DAI_TX	1
+#define Q6ASM_DAI_RX	2
+
 #endif /* __DT_BINDINGS_Q6_ASM_H__ */
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index a2acb7564eb8..9b7b218f2a20 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -37,9 +37,6 @@
 #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
 #define COMPR_PLAYBACK_MIN_NUM_FRAGMENTS (4)
 #define COMPR_PLAYBACK_MAX_NUM_FRAGMENTS (16 * 4)
-#define Q6ASM_DAI_TX_RX	0
-#define Q6ASM_DAI_TX	1
-#define Q6ASM_DAI_RX	2
 
 #define ALAC_CH_LAYOUT_MONO   ((101 << 16) | 1)
 #define ALAC_CH_LAYOUT_STEREO ((101 << 16) | 2)
-- 
2.27.0

