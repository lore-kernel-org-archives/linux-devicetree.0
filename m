Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE2FC1975A
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 20:42:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 382A6222C4
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 20:42:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgCJUmG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 16:42:06 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:21932 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726307AbgCJUmG (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Mar 2020 16:42:06 -0400
X-IronPort-AV: E=Sophos;i="5.70,538,1574089200"; 
   d="scan'208";a="41519225"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Mar 2020 05:42:03 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EF17440F8AD8;
        Wed, 11 Mar 2020 05:42:00 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] Add LVDS panel support to HiHope RZ/G2M
Date:   Tue, 10 Mar 2020 20:41:57 +0000
Message-Id: <1583872919-7757-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Dear All,

The HiHope RZ/G2M is advertised as supporting panel idk-1110wr from
Advantech, but the panel doesn't come with the board, it has to purchased
separatey, therefore this series adds panel support to a new DT.

The v2 version somehow missed being merged.

v2->v3
 * Included Reviewed-by from Rob and Laurent
 * Switched to dual license
 * Added myself as the maintainer
 * Updated copyright year
 * Rebased the patches

v1->v2
 * fixed a space according to Geert's feedback.

Thanks,
Prabhakar

Fabrizio Castro (2):
  dt-bindings: display: Add idk-1110wr binding
  arm64: dts: renesas: Add HiHope RZ/G2M board with idk-1110wr display

 .../display/panel/advantech,idk-1110wr.yaml        | 69 +++++++++++++++++
 arch/arm64/boot/dts/renesas/Makefile               |  1 +
 .../r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts        | 86 ++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts

-- 
2.7.4

