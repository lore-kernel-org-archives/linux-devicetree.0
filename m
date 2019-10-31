Return-Path: <SRS0=y4GH=YY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A370CA9ECE
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 11:29:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4610A2083E
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 11:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRHYSp3X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfJaL35 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 31 Oct 2019 07:29:57 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40347 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaL35 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 Oct 2019 07:29:57 -0400
Received: by mail-wr1-f68.google.com with SMTP id o28so5822775wro.7;
        Thu, 31 Oct 2019 04:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jnv/KEGvs2qnipyD34GPIWYJJd0J0jUbHMyAJOGDseI=;
        b=IRHYSp3XlFCV/IqWt7N3KOEow8N3hW7Mi42KvsBN4Fv6DUlnNsWTCCcio+rmXlrHQB
         PZsj9CrSSBC/yguBcjFkQzhbPpu0YqAKvX6F0qxHAJIJpcwak0vJyR/lxLGkGcHkO7x3
         zsA7rKIOdhK0TRdq7jtDEOyMKVu5/BwxV1VNz4iy5aGl7F8JgYVH/DRASVtj1N9vqXSq
         3RM2EYyxrLN14ghuoHXIBxKWNxImTaevvusZ5abo15mJXwHy1e1/1f+DA8mG/TOGRx/e
         iiO8NW7pcgWPBgNPz0sEIRdth62aiEzij5a1zOYRwHcwx9AK64WMdBeDJODZzCWc0ajo
         Dkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jnv/KEGvs2qnipyD34GPIWYJJd0J0jUbHMyAJOGDseI=;
        b=g5ma7OOAj36aEM/rD3JeJh96IsLcjiI2LJb9qBMiu9poU0lVYz/yEyG1cG2tqc5OdI
         77Ojy5tffQfhP96fISsx2HQSDXFtZ7LaaWrRr7YK6FbwUiyBGdsn/+exL4JcjLxBxOgY
         yfT/AITU53Fg6F0M4lSbmk1oD+qLbg8GX+LIOKQ59qLjv7K3xAsrj64WRI4+zyQn3rg2
         86e/LKiP+trjxFlDSEcz/4QeFHxvy8n67jj4kQUR2V20BEg+E3yJbXuOgCEUhiNKhM54
         zZ/DJfIqdzsgjbRpUB8wgCJBztEtCR20rl7Q521OuNRXRc17dC/Uw8EfKOTMcONQJbRD
         Hk1Q==
X-Gm-Message-State: APjAAAWlT7oRBwPimxmtg2CzUDqS/8dUuDgf7wLWUsqYnF9B7TNKhBUf
        tvSH4O60pIjknKu7i7zffzGx3iKWUsM=
X-Google-Smtp-Source: APXvYqy+kLwo5FDLMZN1nhsXINHAwSvbcTfbI1qXMQKr/hK+nRT1i8lSCT1YSOx9uGXS4vvD+0SBKQ==
X-Received: by 2002:a5d:68c3:: with SMTP id p3mr5448602wrw.82.1572521394639;
        Thu, 31 Oct 2019 04:29:54 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id r13sm4563586wra.74.2019.10.31.04.29.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 04:29:53 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        mturquette@baylibre.com, bjorn.andersson@linaro.org,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] RPM clocks for MSM8976/56
Date:   Thu, 31 Oct 2019 12:29:49 +0100
Message-Id: <20191031112951.35850-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This enables RPM clocks on MSM8976/56, mainly necessary for the
interconnect driver, but exclusively for.

These changes have been tested on MSM8956 Sony Xperia Loire smartphones.

AngeloGioacchino Del Regno (2):
  clk: qcom: smd: Add support for MSM8976 rpm clocks
  dt-bindings: clock: rpmcc: Document msm8976 compatible

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)

-- 
2.21.0

