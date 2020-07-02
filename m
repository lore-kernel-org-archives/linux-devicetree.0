Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45709C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 16:55:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F7D6207D4
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 16:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgGBQyy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 12:54:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60918 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgGBQyy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 12:54:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 70FB42A603C
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, kishon@ti.com,
        tfiga@chromium.org, eddie.cai.linux@gmail.com,
        zhengsq@rock-chips.com
Subject: [PATCH v3 6/9] dt-bindings: media: rkisp1: move rockchip-isp1 bindings out of staging
Date:   Thu,  2 Jul 2020 13:54:07 -0300
Message-Id: <20200702165410.2583375-7-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200702165410.2583375-1-helen.koike@collabora.com>
References: <20200702165410.2583375-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Move rkisp1 bindings to Documentation/devicetree/bindings/media

Verified with:
make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/rockchip-isp1.yaml                  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {drivers/staging/media/rkisp1/Documentation => Documentation}/devicetree/bindings/media/rockchip-isp1.yaml (100%)

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
similarity index 100%
rename from drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
rename to Documentation/devicetree/bindings/media/rockchip-isp1.yaml
-- 
2.26.0

