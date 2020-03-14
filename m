Return-Path: <SRS0=kXhk=5A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2381CC0044D
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 02:48:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E882420578
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 02:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1Zz4YHr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgCOCsN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 14 Mar 2020 22:48:13 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45052 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgCOCsN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 14 Mar 2020 22:48:13 -0400
Received: by mail-ed1-f68.google.com with SMTP id g19so17366461eds.11
        for <devicetree@vger.kernel.org>; Sat, 14 Mar 2020 19:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nrrJw5jnsKcnYZke1fkAbMnXswGu3DHlxJpJ1mWNcSc=;
        b=n1Zz4YHrZC5MivrtvLnrrExA83Y0F6V7neZJUAyeAiAUiPtuNCe59G5TJdTyd0o7gG
         jh2/3M4rHaU3aMqIc23GIXCsQCDKzp+aaql8VI9iklbiJ8RVlBIh1HrGufL665FiCm7r
         rV7mmmqg1CjyxtPYDocJUOHIV1FkOiz6QqxtfaMoJm42shUdpIunUwo81gH8ATs5E1uC
         UtPmd4BVK6vyhB0AUsqcp8HKCmI7er9jHG9FO6iLEvEsFb0P8Pbth59ITdy1jKGEbVGk
         /6VwDOFNRnns3R3YbaTWTJ5RY3nVsT6CRpDHLvtjjgOe04FSJff5Hlr/XHRpoOjmPOmy
         ABrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=nrrJw5jnsKcnYZke1fkAbMnXswGu3DHlxJpJ1mWNcSc=;
        b=WzoIIX4ek6yHRzbeX5l/VDuXnEuw2iGGqXIob7MwibK4AmiA3gisV1nR5U/8aevCau
         UmtsnyS0Do+TK+NHnHKt+LliQYwZKwrGOtgrA0l6za/sY07I5jjlThfgZd5BDALKQflA
         xS4P+99y9wjsjb/P9/0svs7Dl+qriSRiFREeJBjDHOkNseAadWeyN2juUfXBzyVHtt9n
         KXP4UtdOYxp0jaRPbWIz4tIimO6bzFCP/QUjSclA3iPMzgNhueERKLPHSRWp6glslOpP
         HnY4PzMuTg5VwBWz7uYdPxZXEuFmpUPcbPSV8ilMmCKbAONdz8NDaTQvZyJp6jh9/lRo
         Maeg==
X-Gm-Message-State: ANhLgQ08cOkCeF+ZE/NTmZhV4XfaDmxER+zq9a9NrU1Til1JM+r365zO
        qkNN+oJXKX4o5PV33Cj2Dh67QsrV
X-Google-Smtp-Source: ADFU+vvxR0+0I4RqqN+UJxGMSf8TyU3X1cD6gx6O/+SsFCk3p2noVSOpj3blwUhudUODmJ8rU0ebiQ==
X-Received: by 2002:a19:ad47:: with SMTP id s7mr11517727lfd.165.1584199856040;
        Sat, 14 Mar 2020 08:30:56 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id n200sm15650418lfa.50.2020.03.14.08.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2020 08:30:55 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 0/3] drm: drop data-mapping property from panel-dpi
Date:   Sat, 14 Mar 2020 16:30:44 +0100
Message-Id: <20200314153047.2486-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

With the review of Laurent Pinchart we realised that the
data-mapping property introduced in panel-dpi binding
is not the right solution.

Remove it now, while we are working on finding a better way
to specify the interface between panels and display interfaces.

Include a patch to fix some grammar issues spotted in the same review.

	Sam

Sam Ravnborg (3):
      dt-bindings: display: drop data-mapping from panel-dpi
      drm/panel-simple: drop use of data-mapping property
      dt-bindings: display: grammar fixes in panel/

 .../devicetree/bindings/display/panel/display-timings.yaml    |  8 ++++----
 .../devicetree/bindings/display/panel/panel-common.yaml       |  4 ++--
 .../devicetree/bindings/display/panel/panel-dpi.yaml          | 10 ----------
 drivers/gpu/drm/panel/panel-simple.c                          | 11 -----------
 4 files changed, 6 insertions(+), 27 deletions(-)


