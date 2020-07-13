Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747A4C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 530FC2068F
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cfUC2mwA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgGMGJK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 02:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729083AbgGMGJK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 02:09:10 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41051C08C5DD
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 23:09:10 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id o13so5597448pgf.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 23:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rj/eX87Yry4bMawv7goL3V6HwtUE4PbCYaJFfOPa4n0=;
        b=cfUC2mwAl/yFCEEpI2JTWLQR07oRL3/ZK1qOLOpHaBBaXdr1Cot3d4xtkUn/ua0OuI
         vx2FsPXISp0gVgegbBXR4y8hzXsCrnuQt7gYCsBbJt94R/kwk4CQK8FEbbNbVSIe90Cq
         jAUarPk+6bOIy+1Cm4T7+tDD5vWHgjOe+GHKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rj/eX87Yry4bMawv7goL3V6HwtUE4PbCYaJFfOPa4n0=;
        b=r5Jhlbu7rIrR+AyLa+00MrlzltvgpKflnhKHKqigGGz5YaIjxScPHnsmkKrcoNh7so
         b+5cLhVTHLfHQCN4DtXNkHKjQF4g879+EWRnwo9/iI0qrQvElQIbIpkjMrBwPOejKvQY
         2HaTdgl7y32pNelpS+lYVS19NUyNblAwAjACjI6WEOnWIy/fvnLG4jCfJ9k5HDAbLpXn
         5ZMSGtbxHx1N1NdL8oB+VKkNxp5PlRYjaMcWMm4ALucEDTOR8z2SrYQID0grcKOUO6Al
         62ZQ8UeC/0lia8TgtoE7z8gplUYTjI+nxOYhgPA0QUR2Xy7p8XYoq1fdajwKQOensMrO
         lRMQ==
X-Gm-Message-State: AOAM532FIup7ZRNU3fpwlo/H84rXl22uOVeYpLT+s5omIj7v2qkcBLno
        XY69SD0BiS4J2orwJMSyEuyc2w==
X-Google-Smtp-Source: ABdhPJwF8zIyl43VHuHmuurPhhu5gPK9zQSRIVs0CZLKEdAaJwNtmStknGde5p+nOZk/leF1JQ7C+A==
X-Received: by 2002:aa7:9a92:: with SMTP id w18mr30369024pfi.233.1594620549625;
        Sun, 12 Jul 2020 23:09:09 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:09:08 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 00/16] mtk-vcodec: venc: support for MT8183 and v4l2-compliance fixes
Date:   Mon, 13 Jul 2020 15:08:26 +0900
Message-Id: <20200713060842.471356-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This is the third version of the series adding support for the MT8183
encoder (1-9) and fixing v4l2-compliance tests (10-16).

Changes since v2:
* Carried new Acked-bys from mtk-vcodec maintainer,
* Removed 2 patches that addressed what was in fact a bug in
  v4l2-compliance,
* Moved DT bindings patches before the code implementing them as

Changes since v1:
* Checked that no regressions against v4l2-compliance were introduced,
* Fixed 9 failing v4l2-compliance tests,
* Removed 1 cleanup patch of contested utility,
* Carried Acked-bys and Reviewed-bys from mtk-vcodec maintainer.

Alexandre Courbot (12):
  dt-bindings: media: mtk-vcodec: document SCP node
  media: mtk-vcodec: venc: handle firmware version field
  media: mtk-vcodec: venc: specify bitrate range per-chip
  media: mtk-vcodec: venc: specify supported formats per-chip
  dt-bindings: media: document mediatek,mt8183-vcodec-enc
  Revert "media: mtk-vcodec: Remove extra area allocation in an input
    buffer on encoding"
  media: mtk-vcodec: venc support MIN_OUTPUT_BUFFERS control
  media: mtk-vcodec: venc: set OUTPUT buffers field to V4L2_FIELD_NONE
  media: mtk-vcodec: venc: use platform data for ENUM_FRAMESIZES
  media: mtk-vcodec: venc: support ENUM_FRAMESIZES on OUTPUT formats
  media: mtk-vcodec: venc: set default time per frame
  media: mtk-vcodec: venc: fix invalid time per frame in S_PARM

Yunfei Dong (4):
  media: mtk-vcodec: abstract firmware interface
  media: mtk-vcodec: add SCP firmware ops
  media: mtk-vcodec: venc: support SCP firmware
  media: mtk-vcodec: add support for MT8183 encoder

 .../bindings/media/mediatek-vcodec.txt        |   9 +-
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  53 ++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  38 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 211 ++++++++--------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 149 ++++++++----
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   2 -
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 228 ++++++++++++++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  38 +++
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |   1 -
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   1 -
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   1 -
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   1 -
 .../media/platform/mtk-vcodec/vdec_drv_base.h |   2 -
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  12 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  11 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  80 ++++--
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  11 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/venc_drv_if.h   |   6 +
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  |  24 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.c   | 141 ++++++++---
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   8 +-
 26 files changed, 756 insertions(+), 279 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h

--
2.27.0.383.g050319c2ae-goog

