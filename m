Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17540C5DF60
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 02:17:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4DE121882
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 02:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfKHCRN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 21:17:13 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:11974 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726094AbfKHCRN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 21:17:13 -0500
X-Halon-ID: 7f013cc8-01cd-11ea-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 7f013cc8-01cd-11ea-837a-0050569116f7;
        Fri, 08 Nov 2019 03:14:41 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] dt-bindings: rcar-vin: Convert bindings to json-schema
Date:   Fri,  8 Nov 2019 03:16:06 +0100
Message-Id: <20191108021609.2584272-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

This series converts the R-Car VIN bindings to json-schema. This is my 
first conversion so I hope I got everything right. The schema is strict 
and additionalProperties=false is set at every level. The change passes 
'make dt_binding_check' and 'make dtbs_check' for all upstream DTS 
files.

Patch 1/3 and 2/3 fixes a few mistakes in the text base bindings before 
converting it to yaml to highlight what changes before the rather large 
conversion. Last 3/3 converts it from text to yaml.

Niklas Söderlund (3):
  dt-bindings: rcar-vin: Remove paragraph about aliases
  dt-bindings: rcar-vin: Document compatibility string for R8A77470
  dt-bindings: rcar-vin: Convert bindings to json-schema

 .../devicetree/bindings/media/renesas,vin.txt | 219 ----------
 .../bindings/media/renesas,vin.yaml           | 409 ++++++++++++++++++
 2 files changed, 409 insertions(+), 219 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,vin.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,vin.yaml

-- 
2.23.0

