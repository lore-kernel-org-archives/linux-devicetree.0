Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EA0C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 23:13:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB16C2245F
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574205198;
	bh=nSVgrJ0mDxIlz3cED+3HYD8SJH7bXKL60UHNH0U7TL4=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=VNfXv6xBhMVDLt6oMrkanmcDzblZcWetF0aB5pRbZdVe1IAFgTdXikBVMuxY/FXVk
	 tx0Dj/XdeR8szcpGOZeyCN+LNxe2cygEXlmQjqGw8MXvOxDrVvWXeKbfYm7PfKHE99
	 QvqaPU0krE9VDCieiOPVYKZnh0vRPEw4W4R28GoE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfKSXNR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 18:13:17 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41236 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfKSXNQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 18:13:16 -0500
Received: by mail-oi1-f194.google.com with SMTP id e9so20708632oif.8
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 15:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OnE9EamVxEZvvEPbN96bz8p4y4EEg0ph+mw7Ft1Nq8Y=;
        b=kLELlN9EkbW1eH07CVIy+LEZDEW+TZRiVDlkJlZ0FhsctBUsYtJBjYuOmjES4VnZQk
         CtPu/8zJx6vzD4XLqzINJkhOAaPZFyrWCe0TuiaLcvbNqH19sqz6yFnQUcOdoZuNZnr5
         zrrqA/P1/Ws1bkkyYNizLyHkra52glbxAx/oex81omOk3kAzKVioTMAFeU4qYI/f2gcA
         zrFxAwG4+TwAma0Ithz4cvz+OF5/lflEmRa8bjfjoVi6pEs2lw/OUfZtDuuu4W1Z9KMm
         2MWgkg5basgB8M4DakeBwhCWrBW3I/yQKbpAJid9NN4vT2omGbUOSoEINl8Kw3F8XHQG
         98ZA==
X-Gm-Message-State: APjAAAUKJsbp0ABrY9JQ/mjEoDL/tiASjZvSxFEiyMzBOQRBqJ9c18Ey
        90VxnA2fOYU4kD/dxjMK4g==
X-Google-Smtp-Source: APXvYqw1NxuXlCv0GdLv8zS9vpO7htQ31JBiuhAY8sieJ/ulBDf51HRcGTfj7dY45EOGG/YHQHaxkQ==
X-Received: by 2002:aca:ea57:: with SMTP id i84mr5752oih.73.1574205191444;
        Tue, 19 Nov 2019 15:13:11 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id u126sm7886978oib.45.2019.11.19.15.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 15:13:10 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] dt-bindings: display: Convert a bunch of panels to DT schema
Date:   Tue, 19 Nov 2019 17:13:09 -0600
Message-Id: <20191119231309.18295-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert all the 'simple' panels which either use the single
'power-supply' property or don't say and just reference
simple-panel.txt. In the later case, bindings are clear as to which
properties are required or unused.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
We could perhaps consolidate a bunch of these, but I have no idea how 
accurate some of these are WRT what's required or not. Seems strange 
that 'backlight' is optional unless the backlight is tied full on for 
example. If that's the case, then should backlight ever be required?

Rob

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml |  2 +-
 .../panel/ampire,am800480r3tmqwa1h.txt        |  7 --
 .../panel/ampire,am800480r3tmqwa1h.yaml       | 31 +++++++
 .../bindings/display/panel/auo,b080uan01.txt  |  7 --
 .../bindings/display/panel/auo,b080uan01.yaml | 31 +++++++
 .../bindings/display/panel/auo,b101aw03.txt   |  7 --
 .../bindings/display/panel/auo,b101aw03.yaml  | 31 +++++++
 .../bindings/display/panel/auo,b101ean01.txt  |  7 --
 .../bindings/display/panel/auo,b101ean01.yaml | 31 +++++++
 .../bindings/display/panel/auo,b101xtn01.txt  |  7 --
 .../bindings/display/panel/auo,b101xtn01.yaml | 31 +++++++
 .../bindings/display/panel/auo,b116xw03.txt   |  7 --
 .../bindings/display/panel/auo,b116xw03.yaml  | 31 +++++++
 .../bindings/display/panel/auo,b133htn01.txt  |  7 --
 .../bindings/display/panel/auo,b133htn01.yaml | 31 +++++++
 .../bindings/display/panel/auo,b133xtn01.txt  |  7 --
 .../bindings/display/panel/auo,b133xtn01.yaml | 31 +++++++
 .../bindings/display/panel/auo,g070vvn01.txt  | 29 ------
 .../bindings/display/panel/auo,g070vvn01.yaml | 32 +++++++
 .../bindings/display/panel/auo,g101evn010.txt | 12 ---
 .../display/panel/auo,g101evn010.yaml         | 32 +++++++
 .../bindings/display/panel/auo,g104sn02.txt   | 12 ---
 .../bindings/display/panel/auo,g104sn02.yaml  | 32 +++++++
 .../bindings/display/panel/auo,g133han01.txt  |  7 --
 .../bindings/display/panel/auo,g133han01.yaml | 31 +++++++
 .../bindings/display/panel/auo,g185han01.txt  |  7 --
 .../bindings/display/panel/auo,g185han01.yaml | 31 +++++++
 .../bindings/display/panel/auo,p320hvn03.txt  |  8 --
 .../bindings/display/panel/auo,p320hvn03.yaml | 30 +++++++
 .../bindings/display/panel/auo,t215hvn01.txt  |  7 --
 .../bindings/display/panel/auo,t215hvn01.yaml | 31 +++++++
 .../display/panel/avic,tm070ddh03.txt         |  7 --
 .../display/panel/avic,tm070ddh03.yaml        | 31 +++++++
 .../display/panel/boe,hv070wsa-100.txt        | 28 ------
 .../display/panel/boe,hv070wsa-100.yaml       | 33 +++++++
 .../display/panel/boe,nv101wxmn51.txt         |  7 --
 .../display/panel/boe,nv101wxmn51.yaml        | 31 +++++++
 .../display/panel/boe,tv080wum-nl0.txt        |  7 --
 .../display/panel/boe,tv080wum-nl0.yaml       | 31 +++++++
 .../display/panel/cdtech,s043wq26h-ct7.txt    | 12 ---
 .../display/panel/cdtech,s043wq26h-ct7.yaml   | 32 +++++++
 .../display/panel/cdtech,s070wv95-ct16.txt    | 12 ---
 .../display/panel/cdtech,s070wv95-ct16.yaml   | 32 +++++++
 .../display/panel/chunghwa,claa070wp03xg.txt  |  7 --
 .../display/panel/chunghwa,claa070wp03xg.yaml | 31 +++++++
 .../display/panel/chunghwa,claa101wa01a.txt   |  7 --
 .../display/panel/chunghwa,claa101wa01a.yaml  | 31 +++++++
 .../display/panel/chunghwa,claa101wb03.txt    |  7 --
 .../display/panel/chunghwa,claa101wb03.yaml   | 31 +++++++
 .../panel/dataimage,scf0700c48ggu18.txt       |  8 --
 .../panel/dataimage,scf0700c48ggu18.yaml      | 31 +++++++
 .../bindings/display/panel/dlc,dlc1010gig.txt | 12 ---
 .../display/panel/dlc,dlc1010gig.yaml         | 32 +++++++
 .../bindings/display/panel/edt,et-series.txt  | 55 ------------
 .../bindings/display/panel/edt,et-series.yaml | 88 +++++++++++++++++++
 .../display/panel/evervision,vgg804821.txt    | 12 ---
 .../display/panel/evervision,vgg804821.yaml   | 32 +++++++
 .../display/panel/foxlink,fl500wvr00-a0t.txt  |  7 --
 .../display/panel/foxlink,fl500wvr00-a0t.yaml | 31 +++++++
 .../display/panel/friendlyarm,hd702e.txt      | 32 -------
 .../display/panel/friendlyarm,hd702e.yaml     | 36 ++++++++
 .../display/panel/giantplus,gpg482739qs5.txt  |  7 --
 .../display/panel/giantplus,gpg482739qs5.yaml | 31 +++++++
 .../display/panel/giantplus,gpm940b0.txt      | 12 ---
 .../display/panel/giantplus,gpm940b0.yaml     | 32 +++++++
 .../display/panel/hannstar,hsd070pww1.txt     |  7 --
 .../display/panel/hannstar,hsd070pww1.yaml    | 31 +++++++
 .../display/panel/hannstar,hsd100pxn1.txt     |  7 --
 .../display/panel/hannstar,hsd100pxn1.yaml    | 31 +++++++
 .../display/panel/hit,tx23d38vm0caa.txt       |  7 --
 .../display/panel/hit,tx23d38vm0caa.yaml      | 31 +++++++
 .../display/panel/ilitek,ili9881c.txt         | 20 -----
 .../display/panel/ilitek,ili9881c.yaml        | 38 ++++++++
 .../display/panel/innolux,at043tn24.txt       |  7 --
 .../display/panel/innolux,at043tn24.yaml      | 31 +++++++
 .../display/panel/innolux,at070tn92.txt       |  7 --
 .../display/panel/innolux,at070tn92.yaml      | 31 +++++++
 .../display/panel/innolux,g070y2-l01.txt      | 12 ---
 .../display/panel/innolux,g070y2-l01.yaml     | 32 +++++++
 .../display/panel/innolux,g101ice-l01.txt     |  7 --
 .../display/panel/innolux,g101ice-l01.yaml    | 31 +++++++
 .../display/panel/innolux,g121i1-l01.txt      |  7 --
 .../display/panel/innolux,g121i1-l01.yaml     | 31 +++++++
 .../display/panel/innolux,g121x1-l03.txt      |  7 --
 .../display/panel/innolux,g121x1-l03.yaml     | 31 +++++++
 .../display/panel/innolux,n116bge.txt         |  7 --
 .../display/panel/innolux,n116bge.yaml        | 31 +++++++
 .../display/panel/innolux,n156bge-l21.txt     |  7 --
 .../display/panel/innolux,n156bge-l21.yaml    | 31 +++++++
 .../display/panel/innolux,p079zca.txt         | 22 -----
 .../display/panel/innolux,p079zca.yaml        | 36 ++++++++
 .../display/panel/innolux,p120zdg-bf1.txt     | 22 -----
 .../display/panel/innolux,p120zdg-bf1.yaml    | 33 +++++++
 .../display/panel/innolux,zj070na-01p.txt     |  7 --
 .../display/panel/innolux,zj070na-01p.yaml    | 31 +++++++
 .../display/panel/kingdisplay,kd097d04.txt    | 22 -----
 .../display/panel/kingdisplay,kd097d04.yaml   | 36 ++++++++
 .../display/panel/koe,tx14d24vm1bpa.txt       | 42 ---------
 .../display/panel/koe,tx14d24vm1bpa.yaml      | 32 +++++++
 .../display/panel/koe,tx31d200vm0baa.txt      | 25 ------
 .../display/panel/koe,tx31d200vm0baa.yaml     | 31 +++++++
 .../bindings/display/panel/kyo,tcg121xglp.txt |  7 --
 .../display/panel/kyo,tcg121xglp.yaml         | 31 +++++++
 .../display/panel/lemaker,bl035-rgb-002.txt   | 12 ---
 .../display/panel/lemaker,bl035-rgb-002.yaml  | 32 +++++++
 .../bindings/display/panel/lg,acx467akm-7.txt |  7 --
 .../display/panel/lg,acx467akm-7.yaml         | 31 +++++++
 .../bindings/display/panel/lg,lb070wv8.txt    |  7 --
 .../bindings/display/panel/lg,lb070wv8.yaml   | 31 +++++++
 .../display/panel/lg,ld070wx3-sl01.txt        |  7 --
 .../display/panel/lg,ld070wx3-sl01.yaml       | 31 +++++++
 .../display/panel/lg,lh500wx1-sd03.txt        |  7 --
 .../display/panel/lg,lh500wx1-sd03.yaml       | 31 +++++++
 .../display/panel/lg,lp079qx1-sp0v.txt        |  7 --
 .../display/panel/lg,lp079qx1-sp0v.yaml       | 31 +++++++
 .../display/panel/lg,lp097qx1-spa1.txt        |  7 --
 .../display/panel/lg,lp097qx1-spa1.yaml       | 31 +++++++
 .../bindings/display/panel/lg,lp120up1.txt    |  7 --
 .../bindings/display/panel/lg,lp120up1.yaml   | 31 +++++++
 .../bindings/display/panel/lg,lp129qe.txt     |  7 --
 .../bindings/display/panel/lg,lp129qe.yaml    | 31 +++++++
 .../display/panel/mitsubishi,aa070mc01.txt    |  7 --
 .../display/panel/mitsubishi,aa070mc01.yaml   | 31 +++++++
 .../display/panel/nec,nl12880b20-05.txt       |  8 --
 .../display/panel/nec,nl12880b20-05.yaml      | 29 ++++++
 .../display/panel/nec,nl4827hc19-05b.txt      |  7 --
 .../display/panel/nec,nl4827hc19-05b.yaml     | 31 +++++++
 .../display/panel/netron-dy,e231732.txt       |  7 --
 .../display/panel/netron-dy,e231732.yaml      | 31 +++++++
 .../panel/newhaven,nhd-4.3-480272ef-atxl.txt  |  7 --
 .../panel/newhaven,nhd-4.3-480272ef-atxl.yaml | 31 +++++++
 .../display/panel/nlt,nl192108ac18-02d.txt    |  8 --
 .../display/panel/nlt,nl192108ac18-02d.yaml   | 31 +++++++
 .../bindings/display/panel/nvd,9128.txt       |  7 --
 .../bindings/display/panel/nvd,9128.yaml      | 31 +++++++
 .../display/panel/okaya,rs800480t-7x0gp.txt   |  7 --
 .../display/panel/okaya,rs800480t-7x0gp.yaml  | 31 +++++++
 .../panel/olimex,lcd-olinuxino-43-ts.txt      |  7 --
 .../panel/olimex,lcd-olinuxino-43-ts.yaml     | 31 +++++++
 .../display/panel/ontat,yx700wv03.txt         |  7 --
 .../display/panel/ontat,yx700wv03.yaml        | 31 +++++++
 .../display/panel/orisetech,otm8009a.txt      | 23 -----
 .../display/panel/orisetech,otm8009a.yaml     | 38 ++++++++
 .../display/panel/ortustech,com37h3m05dtc.txt | 12 ---
 .../panel/ortustech,com37h3m05dtc.yaml        | 32 +++++++
 .../display/panel/ortustech,com37h3m99dtc.txt | 12 ---
 .../panel/ortustech,com37h3m99dtc.yaml        | 31 +++++++
 .../display/panel/ortustech,com43h4m85ulc.txt |  7 --
 .../panel/ortustech,com43h4m85ulc.yaml        | 31 +++++++
 .../panel/osddisplays,osd070t1718-19ts.txt    | 12 ---
 .../panel/osddisplays,osd070t1718-19ts.yaml   | 31 +++++++
 .../panel/osddisplays,osd101t2045-53ts.txt    | 11 ---
 .../panel/osddisplays,osd101t2045-53ts.yaml   | 31 +++++++
 .../panel/osddisplays,osd101t2587-53ts.txt    | 14 ---
 .../panel/osddisplays,osd101t2587-53ts.yaml   | 35 ++++++++
 .../display/panel/panasonic,vvx10f004b00.txt  |  7 --
 .../display/panel/panasonic,vvx10f004b00.yaml | 31 +++++++
 .../display/panel/panasonic,vvx10f034n00.txt  | 20 -----
 .../display/panel/panasonic,vvx10f034n00.yaml | 34 +++++++
 .../display/panel/qiaodian,qd43003c0-40.txt   |  7 --
 .../display/panel/qiaodian,qd43003c0-40.yaml  | 31 +++++++
 .../display/panel/raydium,rm68200.txt         | 25 ------
 .../display/panel/raydium,rm68200.yaml        | 39 ++++++++
 .../display/panel/rocktech,rk070er9427.txt    | 25 ------
 .../display/panel/rocktech,rk070er9427.yaml   | 31 +++++++
 .../display/panel/samsung,lsn122dl01-c01.txt  |  7 --
 .../display/panel/samsung,lsn122dl01-c01.yaml | 31 +++++++
 .../display/panel/samsung,ltn101nt05.txt      |  7 --
 .../display/panel/samsung,ltn101nt05.yaml     | 31 +++++++
 .../display/panel/samsung,ltn140at29-301.txt  |  7 --
 .../display/panel/samsung,ltn140at29-301.yaml | 31 +++++++
 .../display/panel/sharp,lq035q7db03.txt       | 12 ---
 .../display/panel/sharp,lq035q7db03.yaml      | 32 +++++++
 .../display/panel/sharp,lq070y3dg3b.txt       | 12 ---
 .../display/panel/sharp,lq070y3dg3b.yaml      | 31 +++++++
 .../display/panel/sharp,lq101k1ly04.txt       |  7 --
 .../display/panel/sharp,lq101k1ly04.yaml      | 31 +++++++
 .../display/panel/sharp,lq123p1jx31.txt       |  7 --
 .../display/panel/sharp,lq123p1jx31.yaml      | 31 +++++++
 .../display/panel/sharp,ls020b1dd01d.txt      | 12 ---
 .../display/panel/sharp,ls020b1dd01d.yaml     | 32 +++++++
 .../display/panel/sharp,ls043t1le01.txt       | 22 -----
 .../display/panel/sharp,ls043t1le01.yaml      | 35 ++++++++
 .../display/panel/shelly,sca07010-bfn-lnn.txt |  7 --
 .../panel/shelly,sca07010-bfn-lnn.yaml        | 31 +++++++
 .../display/panel/starry,kr122ea0sra.txt      |  7 --
 .../display/panel/starry,kr122ea0sra.yaml     | 31 +++++++
 .../display/panel/tianma,tm070jdhg30.txt      |  7 --
 .../display/panel/tianma,tm070jdhg30.yaml     | 31 +++++++
 .../display/panel/tianma,tm070rvhg71.txt      | 29 ------
 .../display/panel/tianma,tm070rvhg71.yaml     | 32 +++++++
 .../display/panel/toshiba,lt089ac29000.txt    |  8 --
 .../display/panel/toshiba,lt089ac29000.yaml   | 30 +++++++
 .../bindings/display/panel/tpk,f07a-0102.txt  |  8 --
 .../bindings/display/panel/tpk,f07a-0102.yaml | 31 +++++++
 .../bindings/display/panel/tpk,f10a-0102.txt  |  8 --
 .../bindings/display/panel/tpk,f10a-0102.yaml | 31 +++++++
 .../display/panel/urt,umsh-8596md.txt         | 16 ----
 .../display/panel/urt,umsh-8596md.yaml        | 41 +++++++++
 .../display/panel/vl050_8048nt_c01.txt        | 12 ---
 .../display/panel/vl050_8048nt_c01.yaml       | 32 +++++++
 .../display/panel/winstar,wf35ltiacd.txt      | 48 ----------
 .../display/panel/winstar,wf35ltiacd.yaml     | 31 +++++++
 MAINTAINERS                                   |  1 -
 204 files changed, 3263 insertions(+), 1186 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b080uan01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,b080uan01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b101aw03.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,b101aw03.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b101ean01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,b101ean01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b101xtn01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,b101xtn01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b116xw03.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,b116xw03.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b133htn01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,b133htn01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b133xtn01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,b133xtn01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g070vvn01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g070vvn01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g101evn010.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g101evn010.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g104sn02.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g133han01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g133han01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g185han01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g185han01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,p320hvn03.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,p320hvn03.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,t215hvn01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/edt,et-series.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/edt,et-series.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/evervision,vgg804821.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/evervision,vgg804821.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,at043tn24.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,at043tn24.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,at070tn92.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,at070tn92.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,n116bge.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,n116bge.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lb070wv8.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lb070wv8.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp120up1.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp129qe.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp129qe.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/netron-dy,e231732.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/netron-dy,e231732.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nvd,9128.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/nvd,9128.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index 47950fced28d..a5e6735fe34b 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -85,7 +85,7 @@ examples:
         panel@0 {
                 compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
                 reg = <0>;
-                power-gpios = <&pio 1 7 0>; /* PB07 */
+                power-supply = <&reg>;
                 reset-gpios = <&r_pio 0 5 1>; /* PL05 */
                 backlight = <&pwm_bl>;
         };
diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt b/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
deleted file mode 100644
index 83e2cae1cc1b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "ampire,am800480r3tmqwa1h"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.yaml b/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.yaml
new file mode 100644
index 000000000000..c4b373132946
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ampire,am800480r3tmqwa1h.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: ampire,am800480r3tmqwa1h
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b080uan01.txt b/Documentation/devicetree/bindings/display/panel/auo,b080uan01.txt
deleted file mode 100644
index bae0e2b51467..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,b080uan01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-AU Optronics Corporation 8.0" WUXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,b101ean01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b080uan01.yaml b/Documentation/devicetree/bindings/display/panel/auo,b080uan01.yaml
new file mode 100644
index 000000000000..6df26d04e11a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,b080uan01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,b080uan01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 8.0" WUXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,b101ean01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b101aw03.txt b/Documentation/devicetree/bindings/display/panel/auo,b101aw03.txt
deleted file mode 100644
index 72e088a4fb3a..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,b101aw03.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-AU Optronics Corporation 10.1" WSVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,b101aw03"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b101aw03.yaml b/Documentation/devicetree/bindings/display/panel/auo,b101aw03.yaml
new file mode 100644
index 000000000000..77412b32da0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,b101aw03.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,b101aw03.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 10.1" WSVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,b101aw03
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b101ean01.txt b/Documentation/devicetree/bindings/display/panel/auo,b101ean01.txt
deleted file mode 100644
index 3590b0741619..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,b101ean01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-AU Optronics Corporation 10.1" WSVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,b101ean01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b101ean01.yaml b/Documentation/devicetree/bindings/display/panel/auo,b101ean01.yaml
new file mode 100644
index 000000000000..27022bac8b11
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,b101ean01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,b101ean01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 10.1" WSVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,b101ean01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b101xtn01.txt b/Documentation/devicetree/bindings/display/panel/auo,b101xtn01.txt
deleted file mode 100644
index 889d511d66c9..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,b101xtn01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-AU Optronics Corporation 10.1" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,b101xtn01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b101xtn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,b101xtn01.yaml
new file mode 100644
index 000000000000..4d68fbcfa148
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,b101xtn01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,b101xtn01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 10.1" WXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,b101xtn01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b116xw03.txt b/Documentation/devicetree/bindings/display/panel/auo,b116xw03.txt
deleted file mode 100644
index 690d0a568ef3..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,b116xw03.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-AU Optronics Corporation 11.6" HD (1366x768) color TFT-LCD panel
-
-Required properties:
-- compatible: should be "auo,b116xw03"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b116xw03.yaml b/Documentation/devicetree/bindings/display/panel/auo,b116xw03.yaml
new file mode 100644
index 000000000000..40dce0c037da
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,b116xw03.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,b116xw03.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 11.6" HD (1366x768) color TFT-LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,b116xw03
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b133htn01.txt b/Documentation/devicetree/bindings/display/panel/auo,b133htn01.txt
deleted file mode 100644
index 302226b5bb55..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,b133htn01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
-
-Required properties:
-- compatible: should be "auo,b133htn01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b133htn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,b133htn01.yaml
new file mode 100644
index 000000000000..9f96dfdc27fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,b133htn01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,b133htn01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,b133htn01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b133xtn01.txt b/Documentation/devicetree/bindings/display/panel/auo,b133xtn01.txt
deleted file mode 100644
index 7443b7c76769..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,b133xtn01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,b133xtn01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b133xtn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,b133xtn01.yaml
new file mode 100644
index 000000000000..52de4a125642
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,b133xtn01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,b133xtn01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,b133xtn01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.txt b/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.txt
deleted file mode 100644
index 49e4105378f6..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,g070vvn01"
-- backlight: phandle of the backlight device attached to the panel
-- power-supply: single regulator to provide the supply voltage
-
-Required nodes:
-- port: Parallel port mapping to connect this display
-
-This panel needs single power supply voltage. Its backlight is conntrolled
-via PWM signal.
-
-Example:
---------
-
-Example device-tree definition when connected to iMX6Q based board
-
-	lcd_panel: lcd-panel {
-		compatible = "auo,g070vvn01";
-		backlight = <&backlight_lcd>;
-		power-supply = <&reg_display>;
-
-		port {
-			lcd_panel_in: endpoint {
-				remote-endpoint = <&lcd_display_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.yaml
new file mode 100644
index 000000000000..6b2bbb2d4e2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,g070vvn01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,g070vvn01
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - backlight
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,g101evn010.txt b/Documentation/devicetree/bindings/display/panel/auo,g101evn010.txt
deleted file mode 100644
index bc6a0c858e23..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,g101evn010.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-AU Optronics Corporation 10.1" (1280x800) color TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,g101evn010"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-- enable-gpios: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,g101evn010.yaml b/Documentation/devicetree/bindings/display/panel/auo,g101evn010.yaml
new file mode 100644
index 000000000000..aeda2aecdf8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,g101evn010.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,g101evn010.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 10.1" (1280x800) color TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,g101evn010
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt b/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt
deleted file mode 100644
index 85626edf63e5..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,g104sn02"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-- enable-gpios: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,g104sn02.yaml b/Documentation/devicetree/bindings/display/panel/auo,g104sn02.yaml
new file mode 100644
index 000000000000..9684bb95a21e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,g104sn02.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,g104sn02.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,g104sn02
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,g133han01.txt b/Documentation/devicetree/bindings/display/panel/auo,g133han01.txt
deleted file mode 100644
index 3afc76747824..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,g133han01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,g133han01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,g133han01.yaml b/Documentation/devicetree/bindings/display/panel/auo,g133han01.yaml
new file mode 100644
index 000000000000..cfb57b0142d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,g133han01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,g133han01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,g133han01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,g185han01.txt b/Documentation/devicetree/bindings/display/panel/auo,g185han01.txt
deleted file mode 100644
index ed657c2141d4..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,g185han01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,g185han01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,g185han01.yaml b/Documentation/devicetree/bindings/display/panel/auo,g185han01.yaml
new file mode 100644
index 000000000000..7f41c530cb89
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,g185han01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,g185han01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,g185han01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.txt b/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.txt
deleted file mode 100644
index 59bb6cd8aa75..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,p320hvn03"
-- power-supply: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.yaml b/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.yaml
new file mode 100644
index 000000000000..0c0568456392
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,p320hvn03.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,p320hvn03
+
+  power-supply: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt b/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt
deleted file mode 100644
index cbd9da3f03b1..000000000000
--- a/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
-
-Required properties:
-- compatible: should be "auo,t215hvn01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.yaml
new file mode 100644
index 000000000000..5382d444509d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,t215hvn01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,t215hvn01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.txt b/Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.txt
deleted file mode 100644
index b6f2f3e8f44e..000000000000
--- a/Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
-
-Required properties:
-- compatible: should be "avic,tm070ddh03"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.yaml b/Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.yaml
new file mode 100644
index 000000000000..eb63b08e52f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/avic,tm070ddh03.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: avic,tm070ddh03
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.txt b/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.txt
deleted file mode 100644
index 55183d360032..000000000000
--- a/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "boe,hv070wsa-100"
-- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
-- enable-gpios: GPIO pin to enable and disable panel (active high)
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [1]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-	panel: panel {
-		compatible = "boe,hv070wsa-100";
-		power-supply = <&vcc_3v3_reg>;
-		enable-gpios = <&gpd1 3 GPIO_ACTIVE_HIGH>;
-		port {
-			panel_ep: endpoint {
-				remote-endpoint = <&bridge_out_ep>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.yaml b/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.yaml
new file mode 100644
index 000000000000..d88ec2b42454
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,hv070wsa-100.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: boe,hv070wsa-100
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - enable-gpios
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.txt b/Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.txt
deleted file mode 100644
index b258d6a91ec6..000000000000
--- a/Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "boe,nv101wxmn51"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.yaml b/Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.yaml
new file mode 100644
index 000000000000..c009f60535df
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,nv101wxmn51.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,nv101wxmn51.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: boe,nv101wxmn51
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt b/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt
deleted file mode 100644
index 50be5e2438b2..000000000000
--- a/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Boe Corporation 8.0" WUXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "boe,tv080wum-nl0"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.yaml
new file mode 100644
index 000000000000..29d2a76b82c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,tv080wum-nl0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Boe Corporation 8.0" WUXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: boe,tv080wum-nl0
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt b/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt
deleted file mode 100644
index 057f7f3f6dbe..000000000000
--- a/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
-
-Required properties:
-- compatible: should be "cdtech,s043wq26h-ct7"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-- enable-gpios: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.yaml b/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.yaml
new file mode 100644
index 000000000000..8b63f79d2a92
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/cdtech,s043wq26h-ct7.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: cdtech,s043wq26h-ct7
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt b/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt
deleted file mode 100644
index 505615dfa0df..000000000000
--- a/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD panel
-
-Required properties:
-- compatible: should be "cdtech,s070wv95-ct16"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-- enable-gpios: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.yaml b/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.yaml
new file mode 100644
index 000000000000..74b1a175b161
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/cdtech,s070wv95-ct16.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: cdtech,s070wv95-ct16
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt b/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt
deleted file mode 100644
index dd22685d2adc..000000000000
--- a/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "chunghwa,claa070wp03xg"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.yaml b/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.yaml
new file mode 100644
index 000000000000..d93fe97d03d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/chunghwa,claa070wp03xg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: chunghwa,claa070wp03xg
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.txt b/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.txt
deleted file mode 100644
index f24614e4d5ec..000000000000
--- a/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "chunghwa,claa101wa01a"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.yaml b/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.yaml
new file mode 100644
index 000000000000..827ab821beb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/chunghwa,claa101wa01a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: chunghwa,claa101wa01a
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.txt b/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.txt
deleted file mode 100644
index 0ab2c05a4c22..000000000000
--- a/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "chunghwa,claa101wb03"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.yaml b/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.yaml
new file mode 100644
index 000000000000..e7f2d42135d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/chunghwa,claa101wb03.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: chunghwa,claa101wb03
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt b/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt
deleted file mode 100644
index 897085ee3cd4..000000000000
--- a/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
-
-Required properties:
-- compatible: should be "dataimage,scf0700c48ggu18"
-- power-supply: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.yaml b/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.yaml
new file mode 100644
index 000000000000..80e372852122
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/dataimage,scf0700c48ggu18.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/dataimage,scf0700c48ggu18.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: dataimage,scf0700c48ggu18
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.txt b/Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.txt
deleted file mode 100644
index fbf5dcd15661..000000000000
--- a/Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
-
-Required properties:
-- compatible: should be "dlc,dlc1010gig"
-- power-supply: See simple-panel.txt
-
-Optional properties:
-- enable-gpios: See simple-panel.txt
-- backlight: See simple-panel.txt
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.yaml b/Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.yaml
new file mode 100644
index 000000000000..9d906a05dd35
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/dlc,dlc1010gig.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/dlc,dlc1010gig.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: dlc,dlc1010gig
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/edt,et-series.txt b/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
deleted file mode 100644
index b7ac1c725f97..000000000000
--- a/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Emerging Display Technology Corp. Displays
-==========================================
-
-
-Display bindings for EDT Display Technology Corp. Displays which are
-compatible with the simple-panel binding, which is specified in
-simple-panel.txt
-
-3,5" QVGA TFT Panels
---------------------
-+-----------------+---------------------+-------------------------------------+
-| Identifier      | compatbile          | description                         |
-+=================+=====================+=====================================+
-| ET035012DM6     | edt,et035012dm6     | 3.5" QVGA TFT LCD panel             |
-+-----------------+---------------------+-------------------------------------+
-
-4,3" WVGA TFT Panels
---------------------
-
-+-----------------+---------------------+-------------------------------------+
-| Identifier      | compatbile          | description                         |
-+=================+=====================+=====================================+
-| ETM0430G0DH6    | edt,etm0430g0dh6    | 480x272 TFT Display                 |
-+-----------------+---------------------+-------------------------------------+
-
-5,7" WVGA TFT Panels
---------------------
-
-+-----------------+---------------------+-------------------------------------+
-| Identifier      | compatbile          | description                         |
-+=================+=====================+=====================================+
-| ET057090DHU     | edt,et057090dhu     | 5.7" VGA TFT LCD panel              |
-+-----------------+---------------------+-------------------------------------+
-
-
-7,0" WVGA TFT Panels
---------------------
-
-+-----------------+---------------------+-------------------------------------+
-| Identifier      | compatbile          | description                         |
-+=================+=====================+=====================================+
-| ETM0700G0DH6    | edt,etm070080dh6    | WVGA TFT Display with capacitive    |
-|                 | edt,etm0700g0dh6    | Touchscreen                         |
-+-----------------+---------------------+-------------------------------------+
-| ETM0700G0BDH6   | edt,etm070080bdh6   | Same as ETM0700G0DH6 but with       |
-|                 |                     | inverted pixel clock.               |
-+-----------------+---------------------+-------------------------------------+
-| ETM0700G0EDH6   | edt,etm070080edh6   | Same display as the ETM0700G0BDH6,  |
-|                 |                     | but with changed Hardware for the   |
-|                 |                     | backlight and the touch interface   |
-+-----------------+---------------------+-------------------------------------+
-| ET070080DH6     | edt,etm070080dh6    | Same timings as the ETM0700G0DH6,   |
-|                 |                     | but with resistive touch.           |
-+-----------------+---------------------+-------------------------------------+
-
diff --git a/Documentation/devicetree/bindings/display/panel/edt,et-series.yaml b/Documentation/devicetree/bindings/display/panel/edt,et-series.yaml
new file mode 100644
index 000000000000..522af289b377
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/edt,et-series.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/edt,et-series.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Emerging Display Technology Corp. Displays
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |+
+  Display bindings for EDT Display Technology Corp. Displays
+
+  3,5" QVGA TFT Panels
+  --------------------
+  +-----------------+---------------------+------------------------------------+
+  | Identifier      | compatbile          | description                        |
+  +=================+=====================+====================================+
+  | ET035012DM6     | edt,et035012dm6     | 3.5" QVGA TFT LCD panel            |
+  +-----------------+---------------------+------------------------------------+
+
+  4,3" WVGA TFT Panels
+  --------------------
+
+  +-----------------+---------------------+------------------------------------+
+  | Identifier      | compatbile          | description                        |
+  +=================+=====================+====================================+
+  | ETM0430G0DH6    | edt,etm0430g0dh6    | 480x272 TFT Display                |
+  +-----------------+---------------------+------------------------------------+
+
+  5,7" WVGA TFT Panels
+  --------------------
+
+  +-----------------+---------------------+------------------------------------+
+  | Identifier      | compatbile          | description                        |
+  +=================+=====================+====================================+
+  | ET057090DHU     | edt,et057090dhu     | 5.7" VGA TFT LCD panel             |
+  +-----------------+---------------------+------------------------------------+
+
+  7,0" WVGA TFT Panels
+  --------------------
+
+  +-----------------+---------------------+------------------------------------+
+  | Identifier      | compatbile          | description                        |
+  +=================+=====================+====================================+
+  | ETM0700G0DH6    | edt,etm070080dh6    | WVGA TFT Display with capacitive   |
+  |                 | edt,etm0700g0dh6    | Touchscreen                        |
+  +-----------------+---------------------+------------------------------------+
+  | ETM0700G0BDH6   | edt,etm070080bdh6   | Same as ETM0700G0DH6 but with      |
+  |                 |                     | inverted pixel clock.              |
+  +-----------------+---------------------+------------------------------------+
+  | ETM0700G0EDH6   | edt,etm070080edh6   | Same display as the ETM0700G0BDH6, |
+  |                 |                     | but with changed Hardware for the  |
+  |                 |                     | backlight and the touch interface  |
+  +-----------------+---------------------+------------------------------------+
+  | ET070080DH6     | edt,etm070080dh6    | Same timings as the ETM0700G0DH6,  |
+  |                 |                     | but with resistive touch.          |
+  +-----------------+---------------------+------------------------------------+
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - edt,et035012dm6
+      - edt,etm0430g0dh6
+      - edt,et057090dhu
+      - edt,etm070080dh6
+      - edt,etm0700g0dh6
+      - edt,etm070080bdh6
+      - edt,etm070080edh6
+      - edt,etm070080dh6
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/evervision,vgg804821.txt b/Documentation/devicetree/bindings/display/panel/evervision,vgg804821.txt
deleted file mode 100644
index 82d22e191ac3..000000000000
--- a/Documentation/devicetree/bindings/display/panel/evervision,vgg804821.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
-
-Required properties:
-- compatible: should be "evervision,vgg804821"
-- power-supply: See simple-panel.txt
-
-Optional properties:
-- backlight: See simple-panel.txt
-- enable-gpios: See simple-panel.txt
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/evervision,vgg804821.yaml b/Documentation/devicetree/bindings/display/panel/evervision,vgg804821.yaml
new file mode 100644
index 000000000000..e5b895adac42
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/evervision,vgg804821.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/evervision,vgg804821.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: evervision,vgg804821
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.txt b/Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.txt
deleted file mode 100644
index b47f9d87bc19..000000000000
--- a/Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Foxlink Group 5" WVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "foxlink,fl500wvr00-a0t"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.yaml b/Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.yaml
new file mode 100644
index 000000000000..86960cb71dd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/foxlink,fl500wvr00-a0t.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Foxlink Group 5" WVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: foxlink,fl500wvr00-a0t
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt b/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
deleted file mode 100644
index 6c9156fc3478..000000000000
--- a/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-FriendlyELEC HD702E 800x1280 LCD panel
-
-HD702E lcd is FriendlyELEC developed eDP LCD panel with 800x1280
-resolution. It has built in Goodix, GT9271 captive touchscreen
-with backlight adjustable via PWM.
-
-Required properties:
-- compatible: should be "friendlyarm,hd702e"
-- power-supply: regulator to provide the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Optional nodes:
-- Video port for LCD panel input.
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Example:
-
-	panel {
-		compatible ="friendlyarm,hd702e", "simple-panel";
-		backlight = <&backlight>;
-		power-supply = <&vcc3v3_sys>;
-
-		port {
-			panel_in_edp: endpoint {
-				remote-endpoint = <&edp_out_panel>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml b/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml
new file mode 100644
index 000000000000..b24de901d41b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/friendlyarm,hd702e.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FriendlyELEC HD702E 800x1280 LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description:
+  HD702E lcd is FriendlyELEC developed eDP LCD panel with 800x1280 resolution.
+  It has built in Goodix, GT9271 captive touchscreen with backlight adjustable
+  via PWM.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: friendlyarm,hd702e
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.txt b/Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.txt
deleted file mode 100644
index 24b0b624434b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "giantplus,gpg48273qs5"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.yaml b/Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.yaml
new file mode 100644
index 000000000000..4bf0ffe556a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/giantplus,gpg482739qs5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: giantplus,gpg48273qs5
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt b/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt
deleted file mode 100644
index 3dab52f92c26..000000000000
--- a/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-GiantPlus 3.0" (320x240 pixels) 24-bit TFT LCD panel
-
-Required properties:
-- compatible: should be "giantplus,gpm940b0"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-- enable-gpios: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.yaml b/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.yaml
new file mode 100644
index 000000000000..6ff54527a55b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/giantplus,gpm940b0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GiantPlus 3.0" (320x240 pixels) 24-bit TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: giantplus,gpm940b0
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.txt b/Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.txt
deleted file mode 100644
index 7da1d5c038ff..000000000000
--- a/Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "hannstar,hsd070pww1"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.yaml b/Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.yaml
new file mode 100644
index 000000000000..41e44b9cb5b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hannstar,hsd070pww1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: hannstar,hsd070pww1
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.txt b/Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.txt
deleted file mode 100644
index 8270319a99de..000000000000
--- a/Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
-
-Required properties:
-- compatible: should be "hannstar,hsd100pxn1"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.yaml b/Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.yaml
new file mode 100644
index 000000000000..3599c04f40e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hannstar,hsd100pxn1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: hannstar,hsd100pxn1
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.txt b/Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.txt
deleted file mode 100644
index 04caaae19af6..000000000000
--- a/Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
-
-Required properties:
-- compatible: should be "hit,tx23d38vm0caa"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.yaml b/Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.yaml
new file mode 100644
index 000000000000..c1886d241d40
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hit,tx23d38vm0caa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: hit,tx23d38vm0caa
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
deleted file mode 100644
index 4a041acb4e18..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Ilitek ILI9881c based MIPI-DSI panels
-
-Required properties:
-  - compatible: must be "ilitek,ili9881c" and one of:
-    * "bananapi,lhr050h41"
-  - reg: DSI virtual channel used by that screen
-  - power-supply: phandle to the power regulator
-  - reset-gpios: a GPIO phandle for the reset pin
-
-Optional properties:
-  - backlight: phandle to the backlight used
-
-Example:
-panel@0 {
-	compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
-	reg = <0>;
-	power-supply = <&reg_display>;
-	reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL05 */
-	backlight = <&pwm_bl>;
-};
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
new file mode 100644
index 000000000000..473462863b33
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9881c based MIPI-DSI panels
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: bananapi,lhr050h41
+      - const: ilitek,ili9881c
+
+  reg:
+    maxItems: 1
+
+  port: true
+  power-supply: true
+  backlight: true
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - power-supply
+  - reset-gpios
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,at043tn24.txt b/Documentation/devicetree/bindings/display/panel/innolux,at043tn24.txt
deleted file mode 100644
index 4104226b61bc..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,at043tn24.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Innolux AT043TN24 4.3" WQVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,at043tn24"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,at043tn24.yaml b/Documentation/devicetree/bindings/display/panel/innolux,at043tn24.yaml
new file mode 100644
index 000000000000..e3e24e7185e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,at043tn24.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,at043tn24.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux AT043TN24 4.3" WQVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,at043tn24
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,at070tn92.txt b/Documentation/devicetree/bindings/display/panel/innolux,at070tn92.txt
deleted file mode 100644
index 3e10cd782491..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,at070tn92.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Innolux AT070TN92 7.0" WQVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,at070tn92"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,at070tn92.yaml b/Documentation/devicetree/bindings/display/panel/innolux,at070tn92.yaml
new file mode 100644
index 000000000000..4932fff7a3d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,at070tn92.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,at070tn92.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux AT070TN92 7.0" WQVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,at070tn92
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.txt b/Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.txt
deleted file mode 100644
index 7c234cf68e11..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Innolux G070Y2-L01 7" WVGA (800x480) TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,g070y2-l01"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-- enable-gpios: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.yaml b/Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.yaml
new file mode 100644
index 000000000000..ffa81b20b14e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,g070y2-l01.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,g070y2-l01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux G070Y2-L01 7" WVGA (800x480) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,g070y2-l01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.txt b/Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.txt
deleted file mode 100644
index 9e7590465227..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Innolux Corporation 10.1" G101ICE-L01 WXGA (1280x800) LVDS panel
-
-Required properties:
-- compatible: should be "innolux,g101ice-l01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.yaml b/Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.yaml
new file mode 100644
index 000000000000..a543e5bea8e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,g101ice-l01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,g101ice-l01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux Corporation 10.1" G101ICE-L01 WXGA (1280x800) LVDS panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,g101ice-l01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.txt b/Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.txt
deleted file mode 100644
index 2743b07cd2f2..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Innolux Corporation 12.1" WXGA (1280x800) TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,g121i1-l01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.yaml b/Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.yaml
new file mode 100644
index 000000000000..960f9db59229
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,g121i1-l01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux Corporation 12.1" WXGA (1280x800) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,g121i1-l01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.txt b/Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.txt
deleted file mode 100644
index 649744620ae1..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Innolux Corporation 12.1" G121X1-L03 XGA (1024x768) TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,g121x1-l03"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.yaml b/Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.yaml
new file mode 100644
index 000000000000..8528dd4aa532
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,g121x1-l03.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,g121x1-l03.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux Corporation 12.1" G121X1-L03 XGA (1024x768) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,g121x1-l03
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,n116bge.txt b/Documentation/devicetree/bindings/display/panel/innolux,n116bge.txt
deleted file mode 100644
index 081bb939ed31..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,n116bge.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,n116bge"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,n116bge.yaml b/Documentation/devicetree/bindings/display/panel/innolux,n116bge.yaml
new file mode 100644
index 000000000000..83c8067829aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,n116bge.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,n116bge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,n116bge
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.txt b/Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.txt
deleted file mode 100644
index 7825844aafdf..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-InnoLux 15.6" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,n156bge-l21"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.yaml b/Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.yaml
new file mode 100644
index 000000000000..1706559bd3bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,n156bge-l21.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: InnoLux 15.6" WXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,n156bge-l21
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
deleted file mode 100644
index 3ab8c7412cf6..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,p079zca"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-- enable-gpios: panel enable gpio
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	&mipi_dsi {
-		panel@0 {
-			compatible = "innolux,p079zca";
-			reg = <0>;
-			power-supply = <...>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.yaml
new file mode 100644
index 000000000000..539a871fa741
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,p079zca.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,p079zca
+
+  reg:
+    maxItems: 1
+
+  port: true
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - enable-gpios
+  - reg
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
deleted file mode 100644
index 513f03466aba..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Required properties:
-- compatible: should be "innolux,p120zdg-bf1"
-- power-supply: regulator to provide the supply voltage
-
-Optional properties:
-- enable-gpios: GPIO pin to enable or disable the panel
-- backlight: phandle of the backlight device attached to the panel
-- no-hpd: If HPD isn't hooked up; add this property.
-
-Example:
-	panel_edp: panel-edp {
-		compatible = "innolux,p120zdg-bf1";
-		enable-gpios = <&msmgpio 31 GPIO_ACTIVE_LOW>;
-		power-supply = <&pm8916_l2>;
-		backlight = <&backlight>;
-		no-hpd;
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
new file mode 100644
index 000000000000..d7fbeedfa2b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,p120zdg-bf1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,p120zdg-bf1
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+  no-hpd: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.txt b/Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.txt
deleted file mode 100644
index 824f87f1526d..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,zj070na-01p"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.yaml b/Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.yaml
new file mode 100644
index 000000000000..c843ea9e6130
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,zj070na-01p.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,zj070na-01p
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
deleted file mode 100644
index cfefff688614..000000000000
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
-
-Required properties:
-- compatible: should be "kingdisplay,kd097d04"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-- enable-gpios: panel enable gpio
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	&mipi_dsi {
-		panel@0 {
-			compatible = "kingdisplay,kd097d04";
-			reg = <0>;
-			power-supply = <...>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.yaml
new file mode 100644
index 000000000000..78b51257d24a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/kingdisplay,kd097d04.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: kingdisplay,kd097d04
+
+  reg:
+    maxItems: 1
+
+  port: true
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - enable-gpios
+  - reg
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
deleted file mode 100644
index be7ac666807b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-
-Required properties:
-- compatible: should be "koe,tx14d24vm1bpa"
-- backlight: phandle of the backlight device attached to the panel
-- power-supply: single regulator to provide the supply voltage
-
-Required nodes:
-- port: Parallel port mapping to connect this display
-
-This panel needs single power supply voltage. Its backlight is conntrolled
-via PWM signal.
-
-Example:
---------
-
-Example device-tree definition when connected to iMX53 based board
-
-	lcd_panel: lcd-panel {
-		compatible = "koe,tx14d24vm1bpa";
-		backlight = <&backlight_lcd>;
-		power-supply = <&reg_3v3>;
-
-		port {
-			lcd_panel_in: endpoint {
-				remote-endpoint = <&lcd_display_out>;
-			};
-		};
-	};
-
-Then one needs to extend the dispX node:
-
-	lcd_display: disp1 {
-
-		port@1 {
-			reg = <1>;
-
-			lcd_display_out: endpoint {
-				remote-endpoint = <&lcd_panel_in>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.yaml b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.yaml
new file mode 100644
index 000000000000..8c49805d4040
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/koe,tx14d24vm1bpa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: koe,tx14d24vm1bpa
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - backlight
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
deleted file mode 100644
index 6a036ede3e28..000000000000
--- a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Required properties:
-- compatible: should be "koe,tx31d200vm0baa"
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Optional nodes:
-- Video port for LVDS panel input.
-
-Example:
-	panel {
-		compatible = "koe,tx31d200vm0baa";
-		backlight = <&backlight_lvds>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml
new file mode 100644
index 000000000000..82d71adbaa6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/koe,tx31d200vm0baa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: koe,tx31d200vm0baa
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt b/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt
deleted file mode 100644
index a8e940fe731e..000000000000
--- a/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
-
-Required properties:
-- compatible: should be "kyo,tcg121xglp"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.yaml b/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.yaml
new file mode 100644
index 000000000000..136a68dcda16
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/kyo,tcg121xglp.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/kyo,tcg121xglp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: kyo,tcg121xglp
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt b/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt
deleted file mode 100644
index 74ee7ea6b493..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-LeMaker BL035-RGB-002 3.5" QVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "lemaker,bl035-rgb-002"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-- enable-gpios: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.yaml b/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.yaml
new file mode 100644
index 000000000000..2c4e7e783321
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lemaker,bl035-rgb-002.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LeMaker BL035-RGB-002 3.5" QVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lemaker,bl035-rgb-002
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt b/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt
deleted file mode 100644
index fc1e1b325e49..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
-
-Required properties:
-- compatible: must be "lg,acx467akm-7"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.yaml b/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.yaml
new file mode 100644
index 000000000000..3e136e136ef6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,acx467akm-7.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,acx467akm-7
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lb070wv8.txt b/Documentation/devicetree/bindings/display/panel/lg,lb070wv8.txt
deleted file mode 100644
index a7588e5259cf..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,lb070wv8.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-LG 7" (800x480 pixels) TFT LCD panel
-
-Required properties:
-- compatible: should be "lg,lb070wv8"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lb070wv8.yaml b/Documentation/devicetree/bindings/display/panel/lg,lb070wv8.yaml
new file mode 100644
index 000000000000..67f3c6f75a51
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,lb070wv8.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,lb070wv8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG 7" (800x480 pixels) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,lb070wv8
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt
deleted file mode 100644
index 5e649cb9aa1a..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-LG Corporation 7" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "lg,ld070wx3-sl01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
new file mode 100644
index 000000000000..6913540dff3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3-sl01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG Corporation 7" WXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,ld070wx3-sl01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt b/Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt
deleted file mode 100644
index a04fd2b2e73d..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-LG Corporation 5" HD TFT LCD panel
-
-Required properties:
-- compatible: should be "lg,lh500wx1-sd03"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.yaml b/Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.yaml
new file mode 100644
index 000000000000..ee3b9f8dc7f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,lh500wx1-sd03.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG Corporation 5" HD TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,lh500wx1-sd03
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.txt b/Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.txt
deleted file mode 100644
index b9877acad012..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
-
-Required properties:
-- compatible: should be "lg,lp079qx1-sp0v"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.yaml b/Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.yaml
new file mode 100644
index 000000000000..3126abf1788a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,lp079qx1-sp0v.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,lp079qx1-sp0v.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,lp079qx1-sp0v
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt b/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt
deleted file mode 100644
index 42141516f078..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-LG 9.7" (2048x1536 pixels) TFT LCD panel
-
-Required properties:
-- compatible: should be "lg,lp097qx1-spa1"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.yaml b/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.yaml
new file mode 100644
index 000000000000..89109097a97c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,lp097qx1-spa1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG 9.7" (2048x1536 pixels) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,lp097qx1-spa1
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt b/Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt
deleted file mode 100644
index 8c5de692c55c..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-LG 12.0" (1920x1280 pixels) TFT LCD panel
-
-Required properties:
-- compatible: should be "lg,lp120up1"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp120up1.yaml b/Documentation/devicetree/bindings/display/panel/lg,lp120up1.yaml
new file mode 100644
index 000000000000..f75879804b36
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,lp120up1.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,lp120up1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG 12.0" (1920x1280 pixels) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,lp120up1
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp129qe.txt b/Documentation/devicetree/bindings/display/panel/lg,lp129qe.txt
deleted file mode 100644
index 9f262e0c5a2e..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,lp129qe.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-LG 12.9" (2560x1700 pixels) TFT LCD panel
-
-Required properties:
-- compatible: should be "lg,lp129qe"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp129qe.yaml b/Documentation/devicetree/bindings/display/panel/lg,lp129qe.yaml
new file mode 100644
index 000000000000..4a258c69598b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,lp129qe.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,lp129qe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG 12.9" (2560x1700 pixels) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,lp129qe
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
deleted file mode 100644
index 7d8f6eeef6d9..000000000000
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "mitsubishi,aa070mc01-ca1"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.yaml
new file mode 100644
index 000000000000..4ade4f230939
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/mitsubishi,aa070mc01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: mitsubishi,aa070mc01-ca1
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt b/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt
deleted file mode 100644
index 71cbc49ecfab..000000000000
--- a/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-NEC LCD Technologies, Ltd. 12.1" WXGA (1280x800) LVDS TFT LCD panel
-
-Required properties:
-- compatible: should be "nec,nl12880bc20-05"
-- power-supply: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.yaml b/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.yaml
new file mode 100644
index 000000000000..d49c2b109851
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/nec,nl12880b20-05.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/nec,nl12880b20-05.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NEC LCD Technologies, Ltd. 12.1" WXGA (1280x800) LVDS TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: nec,nl12880bc20-05
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
diff --git a/Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt b/Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
deleted file mode 100644
index 8e1914d1edb8..000000000000
--- a/Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-NEC LCD Technologies,Ltd. WQVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "nec,nl4827hc19-05b"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.yaml b/Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.yaml
new file mode 100644
index 000000000000..356dc6daa987
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/nec,nl4827hc19-05b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NEC LCD Technologies,Ltd. WQVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: nec,nl4827hc19-05b
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/netron-dy,e231732.txt b/Documentation/devicetree/bindings/display/panel/netron-dy,e231732.txt
deleted file mode 100644
index c6d06b5eab51..000000000000
--- a/Documentation/devicetree/bindings/display/panel/netron-dy,e231732.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Netron-DY E231732 7.0" WSVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "netron-dy,e231732"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/netron-dy,e231732.yaml b/Documentation/devicetree/bindings/display/panel/netron-dy,e231732.yaml
new file mode 100644
index 000000000000..4bc4b27a56a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/netron-dy,e231732.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/netron-dy,e231732.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Netron-DY E231732 7.0" WSVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: netron-dy,e231732
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.txt b/Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.txt
deleted file mode 100644
index e78292b1a131..000000000000
--- a/Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Newhaven Display International 480 x 272 TFT LCD panel
-
-Required properties:
-- compatible: should be "newhaven,nhd-4.3-480272ef-atxl"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.yaml b/Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.yaml
new file mode 100644
index 000000000000..1d1971370def
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/newhaven,nhd-4.3-480272ef-atxl.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/newhaven,nhd-4.3-480272ef-atxl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Newhaven Display International 480 x 272 TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: newhaven,nhd-4.3-480272ef-atxl
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt b/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt
deleted file mode 100644
index 1a639fd8778d..000000000000
--- a/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
-
-Required properties:
-- compatible: should be "nlt,nl192108ac18-02d"
-- power-supply: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.yaml b/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.yaml
new file mode 100644
index 000000000000..f790b06ed6e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/nlt,nl192108ac18-02d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: nlt,nl192108ac18-02d
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/nvd,9128.txt b/Documentation/devicetree/bindings/display/panel/nvd,9128.txt
deleted file mode 100644
index 17bcd017c678..000000000000
--- a/Documentation/devicetree/bindings/display/panel/nvd,9128.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
-
-Required properties:
-- compatible: should be "nvd,9128"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/nvd,9128.yaml b/Documentation/devicetree/bindings/display/panel/nvd,9128.yaml
new file mode 100644
index 000000000000..0aaade580c9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/nvd,9128.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/nvd,9128.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: nvd,9128
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.txt b/Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.txt
deleted file mode 100644
index ddf8e211d382..000000000000
--- a/Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
-
-Required properties:
-- compatible: should be "okaya,rs800480t-7x0gp"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.yaml b/Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.yaml
new file mode 100644
index 000000000000..644c5a9cde2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/okaya,rs800480t-7x0gp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: okaya,rs800480t-7x0gp
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.txt b/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.txt
deleted file mode 100644
index 74540a090669..000000000000
--- a/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Olimex 4.3" TFT LCD panel
-
-Required properties:
-- compatible: should be "olimex,lcd-olinuxino-43-ts"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.yaml b/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.yaml
new file mode 100644
index 000000000000..95be97de9108
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/olimex,lcd-olinuxino-43-ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Olimex 4.3" TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: olimex,lcd-olinuxino-43-ts
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.txt b/Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.txt
deleted file mode 100644
index 3d8a5e029242..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-On Tat Industrial Company 7" DPI TFT panel.
-
-Required properties:
-- compatible: should be "ontat,yx700wv03"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.yaml b/Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.yaml
new file mode 100644
index 000000000000..016da42c96c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ontat,yx700wv03.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ontat,yx700wv03.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: On Tat Industrial Company 7" DPI TFT panel.
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: ontat,yx700wv03
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
deleted file mode 100644
index 203b03eefb68..000000000000
--- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
-
-The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
-a MIPI-DSI video interface. Its backlight is managed through the DSI link.
-
-Required properties:
-  - compatible: "orisetech,otm8009a"
-  - reg: the virtual channel number of a DSI peripheral
-
-Optional properties:
-  - reset-gpios: a GPIO spec for the reset pin (active low).
-  - power-supply: phandle of the regulator that provides the supply voltage.
-
-Example:
-&dsi {
-	...
-	panel@0 {
-		compatible = "orisetech,otm8009a";
-		reg = <0>;
-		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
-		power-supply = <&v1v8>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
new file mode 100644
index 000000000000..5e791bcff12b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/orisetech,otm8009a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
+  a MIPI-DSI video interface. Its backlight is managed through the DSI link.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: orisetech,otm8009a
+
+  reg:
+    maxItems: 1
+
+  port: true
+  power-supply: true
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.txt b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.txt
deleted file mode 100644
index c16907c02f80..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-OrtusTech COM37H3M05DTC Blanview 3.7" VGA portrait TFT-LCD panel
-
-Required properties:
-- compatible: should be "ortustech,com37h3m05dtc"
-
-Optional properties:
-- enable-gpios: GPIO pin to enable or disable the panel
-- backlight: phandle of the backlight device attached to the panel
-- power-supply: phandle of the regulator that provides the supply voltage
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.yaml b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.yaml
new file mode 100644
index 000000000000..078840a2ca05
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ortustech,com37h3m05dtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OrtusTech COM37H3M05DTC Blanview 3.7" VGA portrait TFT-LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: ortustech,com37h3m05dtc
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
deleted file mode 100644
index 06a73c3f46b5..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-OrtusTech COM37H3M99DTC Blanview 3.7" VGA portrait TFT-LCD panel
-
-Required properties:
-- compatible: should be "ortustech,com37h3m99dtc"
-
-Optional properties:
-- enable-gpios: GPIO pin to enable or disable the panel
-- backlight: phandle of the backlight device attached to the panel
-- power-supply: phandle of the regulator that provides the supply voltage
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.yaml b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.yaml
new file mode 100644
index 000000000000..3609adf664a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ortustech,com37h3m99dtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OrtusTech COM37H3M99DTC Blanview 3.7" VGA portrait TFT-LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: ortustech,com37h3m99dtc
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.txt b/Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.txt
deleted file mode 100644
index de19e9398618..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-OrtusTech COM43H4M85ULC Blanview 3.7" TFT-LCD panel
-
-Required properties:
-- compatible: should be "ortustech,com43h4m85ulc"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.yaml b/Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.yaml
new file mode 100644
index 000000000000..f82fbf058756
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ortustech,com43h4m85ulc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OrtusTech COM43H4M85ULC Blanview 3.7" TFT-LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: ortustech,com43h4m85ulc
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.txt b/Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.txt
deleted file mode 100644
index e57883ccdf2f..000000000000
--- a/Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-OSD Displays OSD070T1718-19TS 7" WVGA TFT LCD panel
-
-Required properties:
-- compatible: shall be "osddisplays,osd070t1718-19ts"
-- power-supply: see simple-panel.txt
-
-Optional properties:
-- backlight: see simple-panel.txt
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory. No other simple-panel properties than
-the ones specified herein are valid.
diff --git a/Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.yaml b/Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.yaml
new file mode 100644
index 000000000000..ab1b8b3d94b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/osddisplays,osd070t1718-19ts.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/osddisplays,osd070t1718-19ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OSD Displays OSD070T1718-19TS 7" WVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: osddisplays,osd070t1718-19ts
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.txt b/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.txt
deleted file mode 100644
index 85c0b2cacfda..000000000000
--- a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-One Stop Displays OSD101T2045-53TS 10.1" 1920x1200 panel
-
-Required properties:
-- compatible: should be "osddisplays,osd101t2045-53ts"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.yaml b/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.yaml
new file mode 100644
index 000000000000..048b3024fb7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2045-53ts.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/osddisplays,osd101t2045-53ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: One Stop Displays OSD101T2045-53TS 10.1" 1920x1200 panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: osddisplays,osd101t2045-53ts
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt b/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt
deleted file mode 100644
index 9d88e96003fc..000000000000
--- a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
-
-The panel is similar to OSD101T2045-53TS, but it needs additional
-MIPI_DSI_TURN_ON_PERIPHERAL message from the host.
-
-Required properties:
-- compatible: should be "osddisplays,osd101t2587-53ts"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.yaml b/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.yaml
new file mode 100644
index 000000000000..6d109a729e4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/osddisplays,osd101t2587-53ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description:
+  The panel is similar to OSD101T2045-53TS, but it needs additional
+  MIPI_DSI_TURN_ON_PERIPHERAL message from the host.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: osddisplays,osd101t2587-53ts
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.txt
deleted file mode 100644
index d328b0341bf4..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Panasonic Corporation 10.1" WUXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "panasonic,vvx10f004b00"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.yaml b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.yaml
new file mode 100644
index 000000000000..1488fdcbda05
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panasonic,vvx10f004b00.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Panasonic Corporation 10.1" WUXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: panasonic,vvx10f004b00
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
deleted file mode 100644
index 37dedf6a6702..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Panasonic 10" WUXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "panasonic,vvx10f034n00"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	mdss_dsi@fd922800 {
-		panel@0 {
-			compatible = "panasonic,vvx10f034n00";
-			reg = <0>;
-			power-supply = <&vreg_vsp>;
-			backlight = <&lp8566_wled>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.yaml b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.yaml
new file mode 100644
index 000000000000..fe9f7703c068
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panasonic,vvx10f034n00.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Panasonic 10" WUXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: panasonic,vvx10f034n00
+
+  reg:
+    maxItems: 1
+
+  port: true
+  power-supply: true
+  backlight: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.txt b/Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.txt
deleted file mode 100644
index 0fbdab89ac3d..000000000000
--- a/Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-QiaoDian XianShi Corporation 4"3 TFT LCD panel
-
-Required properties:
-- compatible: should be "qiaodian,qd43003c0-40"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.yaml b/Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.yaml
new file mode 100644
index 000000000000..94efb43f1cbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/qiaodian,qd43003c0-40.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/qiaodian,qd43003c0-40.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QiaoDian XianShi Corporation 4"3 TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: qiaodian,qd43003c0-40
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
deleted file mode 100644
index cbb79ef3bfc9..000000000000
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Raydium Semiconductor Corporation RM68200 5.5" 720p MIPI-DSI TFT LCD panel
-
-The Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
-panel connected using a MIPI-DSI video interface.
-
-Required properties:
-  - compatible: "raydium,rm68200"
-  - reg: the virtual channel number of a DSI peripheral
-
-Optional properties:
-  - reset-gpios: a GPIO spec for the reset pin (active low).
-  - power-supply: phandle of the regulator that provides the supply voltage.
-  - backlight: phandle of the backlight device attached to the panel.
-
-Example:
-&dsi {
-	...
-	panel@0 {
-		compatible = "raydium,rm68200";
-		reg = <0>;
-		reset-gpios = <&gpiof 15 GPIO_ACTIVE_LOW>;
-		power-supply = <&v1v8>;
-		backlight = <&pwm_backlight>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
new file mode 100644
index 000000000000..d8b9321ba2aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm68200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium Semiconductor Corporation RM68200 5.5" 720p MIPI-DSI TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |+
+  The Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
+  panel connected using a MIPI-DSI video interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: raydium,rm68200
+
+  reg:
+    maxItems: 1
+
+  port: true
+  power-supply: true
+  backlight: true
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt b/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt
deleted file mode 100644
index eb1fb9f8d1f4..000000000000
--- a/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Required properties:
-- compatible: should be "rocktech,rk070er9427"
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Optional nodes:
-- Video port for LCD panel input.
-
-Example:
-	panel {
-		compatible = "rocktech,rk070er9427";
-		backlight = <&backlight_lcd>;
-
-		port {
-			lcd_panel_in: endpoint {
-				remote-endpoint = <&lcd_display_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.yaml
new file mode 100644
index 000000000000..7fcbc65d9d50
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/rocktech,rk070er9427.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: rocktech,rk070er9427
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt b/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt
deleted file mode 100644
index dba298b43b24..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Samsung 12.2" (2560x1600 pixels) TFT LCD panel
-
-Required properties:
-- compatible: should be "samsung,lsn122dl01-c01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.yaml
new file mode 100644
index 000000000000..b3ab7e71f2ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,lsn122dl01-c01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung 12.2" (2560x1600 pixels) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,lsn122dl01-c01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.txt b/Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.txt
deleted file mode 100644
index ef522c6bb85f..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Samsung Electronics 10.1" WSVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "samsung,ltn101nt05"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.yaml
new file mode 100644
index 000000000000..28ed7e6adbf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ltn101nt05.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Electronics 10.1" WSVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ltn101nt05
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.txt b/Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.txt
deleted file mode 100644
index e7f969d891cc..000000000000
--- a/Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Samsung Electronics 14" WXGA (1366x768) TFT LCD panel
-
-Required properties:
-- compatible: should be "samsung,ltn140at29-301"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.yaml
new file mode 100644
index 000000000000..88d56a488e86
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ltn140at29-301.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Electronics 14" WXGA (1366x768) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq101k1ly04
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.txt
deleted file mode 100644
index 0753f6967279..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Sharp LQ035Q7DB03 3.5" QVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,lq035q7db03"
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-- enable-gpios: GPIO pin to enable or disable the panel
-- backlight: phandle of the backlight device attached to the panel
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.yaml
new file mode 100644
index 000000000000..a56950a3bdc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq035q7db03.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq035q7db03.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp LQ035Q7DB03 3.5" QVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq035q7db03
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt
deleted file mode 100644
index 95534b55ee5f..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Sharp LQ070Y3DG3B 7.0" WVGA landscape TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,lq070y3dg3b"
-
-Optional properties:
-- enable-gpios: GPIO pin to enable or disable the panel
-- backlight: phandle of the backlight device attached to the panel
-- power-supply: phandle of the regulator that provides the supply voltage
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.yaml
new file mode 100644
index 000000000000..65fdadd4643a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq070y3dg3b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp LQ070Y3DG3B 7.0" WVGA landscape TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq070y3dg3b
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt
deleted file mode 100644
index 4aff25b8dfe6..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Sharp Display Corp. LQ101K1LY04 10.07" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,lq101k1ly04"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.yaml
new file mode 100644
index 000000000000..1d4bb4d3d58e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq101k1ly04.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Display Corp. LQ101K1LY04 10.07" WXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq101k1ly04
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.txt
deleted file mode 100644
index bcb0e8a29f71..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Sharp 12.3" (2400x1600 pixels) TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,lq123p1jx31"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.yaml
new file mode 100644
index 000000000000..49df05acc14a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq123p1jx31.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp 12.3" (2400x1600 pixels) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq123p1jx31
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt
deleted file mode 100644
index e45edbc565a3..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Sharp 2.0" (240x160 pixels) 16-bit TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,ls020b1dd01d"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-- enable-gpios: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.yaml
new file mode 100644
index 000000000000..fa1e06ca9fc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls020b1dd01d.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ls020b1dd01d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp 2.0" (240x160 pixels) 16-bit TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ls020b1dd01d
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
deleted file mode 100644
index 3770a111968b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Sharp Microelectronics 4.3" qHD TFT LCD panel
-
-Required properties:
-- compatible: should be "sharp,ls043t1le01-qhd"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-- reset-gpios: a GPIO spec for the reset pin
-
-Example:
-
-	mdss_dsi@fd922800 {
-		panel@0 {
-			compatible = "sharp,ls043t1le01-qhd";
-			reg = <0>;
-			avdd-supply = <&pm8941_l22>;
-			backlight = <&pm8941_wled>;
-			reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
new file mode 100644
index 000000000000..ae0b72866f7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ls043t1le01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 4.3" qHD TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ls043t1le01-qhd
+
+  reg:
+    maxItems: 1
+
+  port: true
+  power-supply: true
+  backlight: true
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.txt b/Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.txt
deleted file mode 100644
index fc1ea9e26c94..000000000000
--- a/Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Shelly SCA07010-BFN-LNN 7.0" WVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "shelly,sca07010-bfn-lnn"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.yaml b/Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.yaml
new file mode 100644
index 000000000000..e7b9eddfea9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/shelly,sca07010-bfn-lnn.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Shelly SCA07010-BFN-LNN 7.0" WVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: shelly,sca07010-bfn-lnn
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt b/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
deleted file mode 100644
index 1e87fe6078af..000000000000
--- a/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Starry 12.2" (1920x1200 pixels) TFT LCD panel
-
-Required properties:
-- compatible: should be "starry,kr122ea0sra"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.yaml b/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.yaml
new file mode 100644
index 000000000000..f38da9c24bc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/starry,kr122ea0sra.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Starry 12.2" (1920x1200 pixels) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: starry,kr122ea0sra
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.txt b/Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.txt
deleted file mode 100644
index eb9501a82e25..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "tianma,tm070jdhg30"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.yaml b/Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.yaml
new file mode 100644
index 000000000000..23f4b07ade53
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tianma,tm070jdhg30.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: tianma,tm070jdhg30
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
deleted file mode 100644
index b25261e63a6d..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "tianma,tm070rvhg71"
-- power-supply: single regulator to provide the supply voltage
-- backlight: phandle of the backlight device attached to the panel
-
-Required nodes:
-- port: LVDS port mapping to connect this display
-
-This panel needs single power supply voltage. Its backlight is conntrolled
-via PWM signal.
-
-Example:
---------
-
-Example device-tree definition when connected to iMX6Q based board
-
-	panel: panel-lvds0 {
-		compatible = "tianma,tm070rvhg71";
-		backlight = <&backlight_lvds>;
-		power-supply = <&reg_lvds>;
-
-		port {
-			panel_in_lvds0: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.yaml b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.yaml
new file mode 100644
index 000000000000..7a61e064d6b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tianma,tm070rvhg71.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: tianma,tm070rvhg71
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - backlight
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt b/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
deleted file mode 100644
index 89826116628c..000000000000
--- a/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Toshiba 8.9" WXGA (1280x768) TFT LCD panel
-
-Required properties:
-- compatible: should be "toshiba,lt089ac29000"
-- power-supply: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.yaml b/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.yaml
new file mode 100644
index 000000000000..96b02f6b8174
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/toshiba,lt089ac29000.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba 8.9" WXGA (1280x768) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: toshiba,lt089ac29000
+
+  power-supply: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt b/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt
deleted file mode 100644
index a2613b9675df..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-TPK U.S.A. LLC Fusion 7" integrated projected capacitive touch display with,
-800 x 480 (WVGA) LCD panel.
-
-Required properties:
-- compatible: should be "tpk,f07a-0102"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.yaml b/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.yaml
new file mode 100644
index 000000000000..3f87679c4064
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tpk,f07a-0102.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tpk,f07a-0102.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TPK U.S.A. LLC Fusion 7" 800 x 480 (WVGA) LCD panel with capacitive touch
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: tpk,f07a-0102
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt b/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt
deleted file mode 100644
index b9d051196ba9..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-TPK U.S.A. LLC Fusion 10.1" integrated projected capacitive touch display with,
-1024 x 600 (WSVGA) LCD panel.
-
-Required properties:
-- compatible: should be "tpk,f10a-0102"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.yaml b/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.yaml
new file mode 100644
index 000000000000..3bc0707e5327
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tpk,f10a-0102.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tpk,f10a-0102.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TPK U.S.A. LLC Fusion 10.1" 1024 x 600 (WSVGA) LCD panel with capacitive touch
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: tpk,f10a-0102
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt b/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt
deleted file mode 100644
index 088a6cea5015..000000000000
--- a/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
-
-Supported are LVDS versions (-11T, -19T) and parallel ones
-(-T, -1T, -7T, -20T).
-
-Required properties:
-- compatible: should be one of:
-  "urt,umsh-8596md-t",
-  "urt,umsh-8596md-1t",
-  "urt,umsh-8596md-7t",
-  "urt,umsh-8596md-11t",
-  "urt,umsh-8596md-19t",
-  "urt,umsh-8596md-20t".
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.yaml b/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.yaml
new file mode 100644
index 000000000000..04facb45f431
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/urt,umsh-8596md.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |+
+  Supported are LVDS versions (-11T, -19T) and parallel ones
+  (-T, -1T, -7T, -20T).
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - urt,umsh-8596md-t
+      - urt,umsh-8596md-1t
+      - urt,umsh-8596md-7t
+      - urt,umsh-8596md-11t
+      - urt,umsh-8596md-19t
+      - urt,umsh-8596md-20t
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.txt b/Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.txt
deleted file mode 100644
index b42bf06bbd99..000000000000
--- a/Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-VXT 800x480 color TFT LCD panel
-
-Required properties:
-- compatible: should be "vxt,vl050-8048nt-c01"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-- enable-gpios: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.yaml b/Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.yaml
new file mode 100644
index 000000000000..86b21d16a37b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/vl050_8048nt_c01.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/vl050_8048nt_c01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VXT 800x480 color TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: vxt,vl050-8048nt-c01
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.txt b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.txt
deleted file mode 100644
index 2a7e6e3ba64c..000000000000
--- a/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
-
-Required properties:
-- compatible: should be "winstar,wf35ltiacd"
-- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Example:
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&hlcdc_pwm 0 50000 PWM_POLARITY_INVERTED>;
-		brightness-levels = <0 31 63 95 127 159 191 223 255>;
-		default-brightness-level = <191>;
-		power-supply = <&bl_reg>;
-	};
-
-	bl_reg: backlight_regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "backlight-power-supply";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-	};
-
-	panel: panel {
-		compatible = "winstar,wf35ltiacd", "simple-panel";
-		backlight = <&backlight>;
-		power-supply = <&panel_reg>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			panel_input: endpoint {
-				remote-endpoint = <&hlcdc_panel_output>;
-			};
-		};
-	};
-
-	panel_reg: panel_regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "panel-power-supply";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.yaml b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.yaml
new file mode 100644
index 000000000000..5009b48dc2a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/winstar,wf35ltiacd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: winstar,wf35ltiacd
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - power-supply
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d711f764dfb..ff8e38b269d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5431,7 +5431,6 @@ S:	Supported
 F:	drivers/gpu/drm/fsl-dcu/
 F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
 F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
-F:	Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
 DRM DRIVERS FOR FREESCALE IMX
-- 
2.20.1

