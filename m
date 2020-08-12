Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51EDC433E3
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 22:42:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1F4C20781
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 22:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0ohq0JG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgHLWmB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 18:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgHLWl5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 18:41:57 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9598DC061383
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 15:41:57 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id d6so4041735ejr.5
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 15:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxVRjUiTs3nNJYC+q69G6u/88+5n3rbFDRYnY/zq97o=;
        b=H0ohq0JGTzqcqaklLMl2pEv/9wkZ8rXqSEg5T4pQV0FzG5ub5/y7mtpmMdwdH4VwH1
         pyuQmYqp/PSh0i0Ypv6/xSFp2ZWqehrKUmyBWCEwX2Q0P+cANKDHsHGoeFPdQ0LbMqUn
         7tvkOPsv+UtR+6hYYOatXTVXj1SnoUObAtXfSGPYgLZg/31xUF7g3zoH4ocfmj1i6bcO
         /jj+B67eL6kdLV5IzhjvPlugkrATrrr5+qtBb+CByIn3/ZkrhF4sfSEm9XagxhSJw/zU
         5shufL+pm2lhBJPv7gDUTe5nF4SM99VYwmuJvtC/Vxo8sHdgAxouec75pWEKtOLFEwM7
         p4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxVRjUiTs3nNJYC+q69G6u/88+5n3rbFDRYnY/zq97o=;
        b=dfUbPR1x6P9NsIiR4ZIu2x9JRNteNdccgPEFdQDhsSlZrkDn06WgEdtDF80/qcvw3N
         7P7PIhCXUX7IxM764rwUm/xLXOtU7SO/7lAykXklhYgLzqiQcVGt6YeDbFFAilfQOYf6
         SGO9sip/tOMQbSpWdVILJ7YA7Etad0GYNaM9zF9uQoV8NUaLkfmYgmdpVXc4VuBAbBdw
         osPoyb8reSokRghOaUGpfPU+72er3O/KPc19qvZQxPjPH9WuoaoC5p3VFkHtdObfAwD7
         zRs5PEIjatEhMu7TdCoSeau036VubI7dDIzpm2BWa8N7u3072YzkKMk9r5XXj4rAOQi+
         Bpig==
X-Gm-Message-State: AOAM531HJ7IjZYWaCbgKyPXhbRMU8nWkmWPmKBOattexOm0M+dapQuie
        vyZBGHHmeas56iLuEENi7WU=
X-Google-Smtp-Source: ABdhPJy10mWBadiF0bkqmhEe8WwO2/XoAa+J0VGawvCQ+WieFtPO8vVBxjFZueeK325mYmdRiYYwSA==
X-Received: by 2002:a17:907:11d0:: with SMTP id va16mr2136113ejb.426.1597272116232;
        Wed, 12 Aug 2020 15:41:56 -0700 (PDT)
Received: from debian64.daheim (pd9e293b6.dip0.t-ipconnect.de. [217.226.147.182])
        by smtp.gmail.com with ESMTPSA id g19sm2492418ejz.5.2020.08.12.15.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:41:54 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
        (envelope-from <chunkeey@gmail.com>)
        id 1k5zRR-005oDQ-Pq; Thu, 13 Aug 2020 00:41:53 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Cc:     Chris Blake <chrisrblake93@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v1 0/4] powerpc: apm82181: adding customer devices
Date:   Thu, 13 Aug 2020 00:41:49 +0200
Message-Id: <cover.1597271958.git.chunkeey@gmail.com>
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

Now, I've looked around in the arch/powerpc for recent .dts
and device submissions to get an understanding of what is
required.
From the looks of it, it seems like every device gets a
skeleton defconfig and a CONFIG_$DEVICE symbol (Like:
CONFIG_MERAKI_MR24, CONFIG_WD_MYBOOKLIVE).

Will this be the case? Or would it make sense to further
unite the Bluestone, MR24 and MBL under a common CONFIG_APM82181
and integrate the BLUESTONE device's defconfig into it as well?
(I've stumbled accross the special machine compatible
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

