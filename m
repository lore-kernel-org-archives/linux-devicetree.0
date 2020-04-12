Return-Path: <SRS0=a8L4=54=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6ABC2BA2B
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Apr 2020 13:21:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3B56206E9
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Apr 2020 13:21:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ucsmneav"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgDLNVr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 12 Apr 2020 09:21:47 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:43479 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgDLNVr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 12 Apr 2020 09:21:47 -0400
Received: by mail-lj1-f176.google.com with SMTP id h25so6263925lja.10
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2020 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4FIEUmcNoUoVbR0DONSm4/DJFIw8hJmUoiIwj3g7BiM=;
        b=Ucsmneav3qM7HcUiOrT+WYd6xRQ/Kk//dFsh3bGdC/nI592PW9PtN5+C4bgxYGUpQk
         bPmD5VVos41hqhsBNOBh5pLEAXKlxjOewgBPmbUQA9FxP+183wDiMz4jgVXgmKu4Ry0F
         +37/oj/GM6E+ruAK3V/8phP/H9W4TOucoZGWpF1IGIpznRroL7/HFzkdM/YQZ7if8mX1
         zafXVXsq0JILoaBLWJmUPKuQJT1FrPxVL4eTYNQeMMX8+ClNMYrSeiI8z88Q601FRkfG
         WfpYnj459nqRd/LruaS3CgvQC+7kvkfbEIZAKzNgPg56BHue/sNW6NAWUHikDN8U3uGt
         ZDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=4FIEUmcNoUoVbR0DONSm4/DJFIw8hJmUoiIwj3g7BiM=;
        b=LNMbdKmytOS58WbThetxwfSRbE7UGp7R/8kw0EUhFGkNJr3BWdesgEVQYPgdHFve/v
         KQPd5Cfea9m1w/FCeOm1Pn0oYJtZAy7o8iLV5s3OSAkv4DqxRickWReJczXnTYnep+Ky
         uMxCrSRQQ9Fndy/9eKBlRoRGx5FqULetm77iOhnOzadJ5ZzjrOKl96v2G6sz+LpyW7KS
         3ij0ahxUVTRe7c/mQFOgzWp4RjWaMPrIOiYe9kj+/hPwSZjhc3Im6Xog4OouBKFypv98
         sZuBq94L9gGwZkrnmIz8qrllM4hHvLC/TUaNKTzWk4UZU/OqD5CABFrVNqFlxDaOutfS
         bmWA==
X-Gm-Message-State: AGi0PuagPOD4qbEjn0PuGFuuG6k3xfYnxw8JAPtTBWD5wjx3fqGp90jV
        JObzGcpJuyIN884IUw1YdV8=
X-Google-Smtp-Source: APiQypJ+IYdNCOB+d88F408raxeoWj4QQGvyBIxPgHluADcUApULv9AYE2ADasxFiJIRFUeLbsqBXg==
X-Received: by 2002:a2e:7d09:: with SMTP id y9mr8008182ljc.146.1586697705718;
        Sun, 12 Apr 2020 06:21:45 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id y29sm5330801ljd.26.2020.04.12.06.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 06:21:45 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 0/1] dt-bindings: fix warning in panel/advantech,idk-2121wr
Date:   Sun, 12 Apr 2020 15:21:38 +0200
Message-Id: <20200412132139.11418-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The binding for the advantech,idk-2121wr uses an example
where a ports {} node is used.

The panel-lvds binding failed to support a ports node,
which the following patch fixes.

This fix was part of a longer series, but we need this fix
in upstream before -rc2.
So pull this out of the larger series.

	Sam
Sam Ravnborg (1):
      dt-bindings: display: allow port and ports in panel-lvds

 Documentation/devicetree/bindings/display/panel/lvds.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)


