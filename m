Return-Path: <SRS0=iyGu=CA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3970C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 19:35:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77C3B207CD
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 19:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SILZm/yT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgHVTfg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Aug 2020 15:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgHVTfe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Aug 2020 15:35:34 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B16C061573
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2020 12:35:33 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id o18so6830735eje.7
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2020 12:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWMxgBvmfFyawmFvMmHtQbFSjxdsaTc05buinE1Bj3k=;
        b=SILZm/yTNxrh78QIeeI8/0ZwVzwwOG5rVjnml/IdrXRNeTNBuvJha0FWKTzujPwGKK
         LyVlhYxe0my7eKLYXKW0WYq+XJmL0lZSe1auBZcOnRh+fNUmtJU1+B2VE07DbZrsvLLb
         kMTXIZT45EXQUANdZkpz3PmoPHvT7RYS929aaCk9DvUs1RdJd/9Y8rgaSjBnkbRKnogv
         W6y1GvNrVQllDiDtdgACatlGLPcJ5LnGOK2phbqRFmsvbIvW1PiAT1UtUKTKnAAyHM5T
         tofd708J11s7yy4V8FgjX+C+BlRzpiyjmkUPFxLF5Hr3XW4kNZioo30bjAX1LoNY3VKL
         nNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWMxgBvmfFyawmFvMmHtQbFSjxdsaTc05buinE1Bj3k=;
        b=mZK9IQZzld1cI+fWC3PpW92IxZBJL8m+H2YzbsDdbd5EZ35SMEha1mqbVl/K0UMCwy
         rnVnshXZRAhEIiDLcNx2Vg4w4PjdIY/4P8OhNuZ4BnIONLtmGHKAu1pLuaGTCTeKaSpO
         VmnOBaTyANfjtwtBduVReX+L5IM7pVcq7TjOA9y4Bqzj+t+ZciCcpowRl94Dra7ySI7t
         Xg8XcYoV4rdHNqUFPebZAR6swmuESX9Mpf6eRwMC/IPu4GMozE48Ly7m6UO1cIHWWVda
         pBg53ziiUSqxt3s+0t1avw6Kg6wfTtt/VGEAbnhSMteBrhXEO+atkeyzB6MVWTrntqdi
         BNnQ==
X-Gm-Message-State: AOAM530dMaQJQv00xaoVWPAlL81ywwPKYmEU/zedNNn6CZRWB0RGInDo
        OV+yHim7AtYphv+KdBgzglE=
X-Google-Smtp-Source: ABdhPJziHAmG8Bj99dgFaFHC+kcJQ5u8k3ckuArREtMVoTUqO0Prg16KpC6nG6eBFZdDYzJCZAB+oA==
X-Received: by 2002:a17:906:d9db:: with SMTP id qk27mr8122791ejb.230.1598124932571;
        Sat, 22 Aug 2020 12:35:32 -0700 (PDT)
Received: from debian64.daheim (p4fd09171.dip0.t-ipconnect.de. [79.208.145.113])
        by smtp.gmail.com with ESMTPSA id eb11sm3612855edb.76.2020.08.22.12.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 12:35:31 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
        (envelope-from <chunkeey@gmail.com>)
        id 1k9ZIP-000Enb-LD; Sat, 22 Aug 2020 21:35:21 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Cc:     Chris Blake <chrisrblake93@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/4] powerpc: apm82181: adding customer devices
Date:   Sat, 22 Aug 2020 21:35:17 +0200
Message-Id: <cover.1598124791.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

I've been holding on to these devices dts' for a while now.
But ever since the recent purge of the PPC405, I'm feeling
the urge to move forward.

The devices in question have been running with OpenWrt since
around 2016/2017. Back then it was linux v4.4 and required
many out-of-tree patches (for WIFI, SATA, CRYPTO...), that
since have been integrated. So, there's nothing else in the
way I think.

A patch that adds the Meraki vendor-prefix has been sent
separately, as there's also the Meraki MR32 that I'm working
on as well. Here's the link to the patch:
<https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-August/216949.html>

Now, I've looked around in the arch/powerpc for recent .dts
and device submissions to get an understanding of what is
required.
From the looks of it, it seems like every device gets a
skeleton defconfig and a CONFIG_$DEVICE symbol (Like:
CONFIG_MERAKI_MR24, CONFIG_WD_MYBOOKLIVE).

Will this be the case? Or would it make sense to further
unite the Bluestone, MR24 and MBL under a common CONFIG_APM82181
and integrate the BLUESTONE device's defconfig into it as well?
(I've stumbled across the special machine compatible
handling of ppc in the Documentation/devicetree/usage-model.rst
already.)

Cheers,
Christian

Note:
If someone has a WD MyBook Live (DUO) and is interested in
giving it a spin with 5.8. I've made a:
"build your own Debian System" sort of script that can be
found on github: <https://github.com/chunkeey/mbl-debian>
(the only remaining patch hack is for debian's make-kpkg crossbuild)

Furthermore, the OpenWrt project currently has images for the
following apm82181 devices:
 Cisco Meraki MX60(W) - Needs DSA for the AR8327
 Netgear WNDAP620/WNDAP660 - (Could be next)
 Netgear WNDR4700 - Needs DSA for the AR8327

Note2: I do have a stash of extensive APM82181 related documentation.

Christian Lamparter (4):
  powerpc: apm82181: create shared dtsi for APM bluestone
  powerpc: apm82181: add WD MyBook Live NAS
  powerpc: apm82181: add Meraki MR24 AP
  powerpc: apm82181: integrate bluestone.dts

 arch/powerpc/boot/dts/apm82181.dtsi        | 485 +++++++++++++++++++++
 arch/powerpc/boot/dts/bluestone.dts        | 456 +++++--------------
 arch/powerpc/boot/dts/meraki-mr24.dts      | 237 ++++++++++
 arch/powerpc/boot/dts/wd-mybooklive.dts    | 199 +++++++++
 arch/powerpc/platforms/44x/ppc44x_simple.c |   4 +-
 5 files changed, 1033 insertions(+), 348 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/apm82181.dtsi
 create mode 100644 arch/powerpc/boot/dts/meraki-mr24.dts
 create mode 100644 arch/powerpc/boot/dts/wd-mybooklive.dts

-- 
2.28.0

