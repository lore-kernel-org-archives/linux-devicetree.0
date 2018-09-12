Return-Path: <SRS0=dseP=L2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:24282 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726795AbeILSfn (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Sep 2018 14:35:43 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/2] Add R8A774C0 PFC support
Date: Wed, 12 Sep 2018 14:31:00 +0100
Message-Id: <1536759062-11970-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

this patch series adds PFC support to the RZ/G2E (a.k.a. r8a774c0),
and it applies on top of renesas-drivers-2018-09-11-v4.19-rc3.

Thanks,
Fab

Fabrizio Castro (2):
  dt-bindings: pinctrl: sh-pfc: Document r8a774c0 PFC support
  pinctrl: sh-pfc: r8a77990: Add R8A774C0 PFC support

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |   5 +
 drivers/pinctrl/sh-pfc/Makefile                    |   1 +
 drivers/pinctrl/sh-pfc/core.c                      |   6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 339 ++++++++++++---------
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   1 +
 6 files changed, 202 insertions(+), 151 deletions(-)

-- 
2.7.4
