Return-Path: <SRS0=Z42x=52=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5F1C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 09:18:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F00B20732
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 09:18:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGW32z6e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgDJJSm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 05:18:42 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45770 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgDJJSm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Apr 2020 05:18:42 -0400
Received: by mail-wr1-f65.google.com with SMTP id v5so1586094wrp.12
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2020 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ku+khEbLihjF9fg057gbAqc5jbRWedm5U6Mz+3ODjFM=;
        b=mGW32z6eWUYqU5uTWZ5H6DqLr8n9qeS3KA0aAaQ+09xh++iE6XOhXfGTlcUO6LE0m9
         zMNcL4eoq3RibIxwA16fJiauW/LODZzyb75H2VV4iX2kHmhfuGfBAyKVuUMO2panzZw6
         EP+PITZVyCJBGVWyi7fTLErMUCYdB4ki9wwtfuWYk9cottPPAsMMFxLNcZzu7t8W7+nr
         X1zxtilAEWTCMVrJ4xqIt3wsvU+AJhzBxv2bZ5GeV8EZ7pGwU7B/PRVrU8Z7FpfqhaXy
         HjS9Vkzw1fEYaUSqDNng0+zaUz/8GuSh/HZrz9F/xx3JHYooDPwsDrNofBfhmmp1+fZb
         YgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ku+khEbLihjF9fg057gbAqc5jbRWedm5U6Mz+3ODjFM=;
        b=BjhTr2r+QJd3XUYus3Y6Ni9/jjI9cmub1rCjaAGukuitK/b9bySP92hDFF9jufS/vw
         GYJ69gHcoW1afdwbNFJqvCTz2wu1UXQdhcg1Rhcmy68TncyRpo9Bz3j8X7FaQazbucko
         8CrldhkbsBKaWYrHaQogzBvEyX075EcnVZfrZ49H2AGiz80GFFSXHmKEiqAyZkQB1tvu
         K66h2QNIwWCrPcaYqxWxBHDsutQHq8D8KJEqNmcAixDBfxLPhBpSY75uZyzW2yudmk45
         bxinj3eKL5qs2+NUMh31TYJO0h+YJSMdTeTgg1oVezNkcaDMNSCCQAu93wdWBjqZTSXa
         j+Yg==
X-Gm-Message-State: AGi0PuZBc5L/eCO9wrmUtNvqzunpX3ShGn2b/zpx8GronPC0m4cYOIFo
        IKHt2NCejDimjx1udvsBDyA=
X-Google-Smtp-Source: APiQypIE0Zfw3JN4FA7j7hDOmg1yf09UhaE0ks1W3LqGKp4iq+SV2fZNDjk/Y8ZHePPA5ALfJCGqjQ==
X-Received: by 2002:a5d:610b:: with SMTP id v11mr3634781wrt.212.1586510319612;
        Fri, 10 Apr 2020 02:18:39 -0700 (PDT)
Received: from localhost.localdomain (134.red-83-46-193.dynamicip.rima-tde.net. [83.46.193.134])
        by smtp.gmail.com with ESMTPSA id p3sm2049066wrq.97.2020.04.10.02.18.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Apr 2020 02:18:38 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     neil@brown.name, driverdev-devel@linuxdriverproject.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH 0/2] staging: mt7621-pci-phy: dt: bindings: convert bindings file from txt to yaml
Date:   Fri, 10 Apr 2020 11:18:34 +0200
Message-Id: <20200410091836.13068-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In order to get this driver a new chance to be properly mainlined
convert bindings file into a new yaml one is missing. Previous
bindings got the 'Reviewed-by' tag from Rob Herring last year
in a second attempt to get this driver mainlined.

See:
 - https://patchwork.kernel.org/patch/10878071/ 

In new version the use of the '#phy-cells' property 
has changed a bit. Before, we were using this cell to say which
phy was dual ported but we were using three 'phys' and its 'phy-names'
properties using instances inside the driver code making it a bit
difficult. The fact of re-init registers and so on calling 'phy_init'
for the phy1 was also introducing not stable clock signals on hard-resets and
the kernel was hanging sometimes. Now we just use two 'phys' with two
'phy-names' nodes and we say which port is dual-ported (phy0 and phy1
share the same phy and it just use different offset in config registers to
do the power on. The init process and so on shall be uniq to avoid problems
so now the driver controller achieve this situation.

So now, the pci controller has the following:

pcie: pcie@1e140000 {
    compatible = "mediatek,mt7621-pci";
    ...
    phys = <&pcie0_phy 1>, <&pcie2_phy 0>;
    phy-names = "pcie-phy0", "pcie-phy2";
    ...
}

And the phys are defined as:

pcie0_phy: pcie-phy@1e149000 {
    compatible = "mediatek,mt7621-pci-phy";
    reg = <0x1e149000 0x0700>;
    #phy-cells = <1>;
};

pcie2_phy: pcie-phy@1e14a000 {
    compatible = "mediatek,mt7621-pci-phy";
    reg = <0x1e14a000 0x0700>;
    #phy-cells = <1>;
};

Doing in this way we get a deterministic behaviour and stable pci
clocks for both soft and hard resets and the phy driver code got 
simplified a lot. 

Rob, It would be nice to know if this is a valid approach.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (2):
  staging: mt7621-pci-phy: dt: bindings: add
    mediatek,mt7621-pci-phy.yaml
  staging: mt7621-pci-phy: dt: bindings: remove bindings txt file

 .../mediatek,mt7621-pci-phy.txt               | 28 ---------------
 .../mediatek,mt7621-pci-phy.yaml              | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 28 deletions(-)
 delete mode 100644 drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt
 create mode 100644 drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.yaml

-- 
2.25.1

