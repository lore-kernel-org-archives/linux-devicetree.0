Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6159C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 12:49:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 836F0206A3
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 12:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="kPMSVVQH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbfKLMtD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 07:49:03 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43663 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbfKLMtC (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Nov 2019 07:49:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47C6xl61Bmz9sNT;
        Tue, 12 Nov 2019 23:48:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1573562940;
        bh=0H2ckzenIEUdMeCuWV8YnQ3qDS5tDmmeebFIVA9G0MI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kPMSVVQHO2yuVbDjgLxrErywmOK9wydgd407kEodq/NWXkZX01saj/9m1RMJGkBzO
         3hxIZ9nC/rE8GCWjMeISUpaQittbwWBLoKY+vbH1BttdhuBxAl5zTGUyOyODQXSZ0c
         vZlaxdsCVD6EkPewb9AxsaydNG17vqVzA7fteb2Q4j6ErkI2ui7LXS5Xgd2bjutVmI
         pasyZ1azAOahGlSTs4qf12ch64aVtzoY3DI+Xl1IrWdcYnNXn6F//Q19j9J+QJMk1U
         0O+uPTWcbDNl2nMuJNU8N4DCFX9S9UfEu2z3DNYdl43ga/fHQ3qH5TCojGVfHfZ0n2
         qA6di46GG0ApA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Andrew Murray <andrew.murray@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Cc:     devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 6/7] powerpc: dts: Use IRQ flags for legacy PCI IRQ interrupts
In-Reply-To: <20191104163834.8932-7-andrew.murray@arm.com>
References: <20191104163834.8932-1-andrew.murray@arm.com> <20191104163834.8932-7-andrew.murray@arm.com>
Date:   Tue, 12 Nov 2019 23:48:58 +1100
Message-ID: <87v9rp1cqt.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Andrew Murray <andrew.murray@arm.com> writes:
> Replace magic numbers used to describe legacy PCI IRQ interrupts
> with #define.
>
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> ---
>  arch/powerpc/boot/dts/bluestone.dts       | 12 +++--
>  arch/powerpc/boot/dts/charon.dts          | 12 +++--
>  arch/powerpc/boot/dts/digsy_mtc.dts       | 12 +++--
>  arch/powerpc/boot/dts/haleakala.dts       | 12 +++--
>  arch/powerpc/boot/dts/holly.dts           | 42 ++++++++--------
>  arch/powerpc/boot/dts/hotfoot.dts         | 12 +++--
>  arch/powerpc/boot/dts/kuroboxHD.dts       | 28 ++++++-----
>  arch/powerpc/boot/dts/kuroboxHG.dts       | 28 ++++++-----
>  arch/powerpc/boot/dts/lite5200.dts        | 12 +++--
>  arch/powerpc/boot/dts/lite5200b.dts       | 22 +++++----
>  arch/powerpc/boot/dts/media5200.dts       | 26 +++++-----
>  arch/powerpc/boot/dts/mpc5121ads.dts      | 20 ++++----
>  arch/powerpc/boot/dts/mpc8308rdb.dts      | 12 +++--
>  arch/powerpc/boot/dts/mpc8313erdb.dts     | 20 ++++----
>  arch/powerpc/boot/dts/mpc832x_mds.dts     | 60 ++++++++++++-----------
>  arch/powerpc/boot/dts/mpc832x_rdb.dts     | 22 +++++----
>  arch/powerpc/boot/dts/mpc8349emitxgp.dts  |  8 +--
>  arch/powerpc/boot/dts/mpc836x_mds.dts     | 60 ++++++++++++-----------
>  arch/powerpc/boot/dts/mpc836x_rdk.dts     | 16 +++---
>  arch/powerpc/boot/dts/mucmc52.dts         | 12 +++--
>  arch/powerpc/boot/dts/mvme5100.dts        | 48 +++++++++---------
>  arch/powerpc/boot/dts/pcm030.dts          | 22 +++++----
>  arch/powerpc/boot/dts/pcm032.dts          | 22 +++++----
>  arch/powerpc/boot/dts/pq2fads.dts         | 28 ++++++-----
>  arch/powerpc/boot/dts/socrates.dts        |  8 +--
>  arch/powerpc/boot/dts/storcenter.dts      | 28 ++++++-----
>  arch/powerpc/boot/dts/stx_gp3_8560.dts    | 36 +++++++-------
>  arch/powerpc/boot/dts/taishan.dts         | 20 ++++----
>  arch/powerpc/boot/dts/tqm5200.dts         | 12 +++--
>  arch/powerpc/boot/dts/tqm8540.dts         | 16 +++---
>  arch/powerpc/boot/dts/tqm8541.dts         | 16 +++---
>  arch/powerpc/boot/dts/tqm8555.dts         | 16 +++---
>  arch/powerpc/boot/dts/tqm8560.dts         | 16 +++---
>  arch/powerpc/boot/dts/virtex440-ml510.dts | 43 ++++++++--------
>  arch/powerpc/boot/dts/xcalibur1501.dts    | 13 +++--
>  arch/powerpc/boot/dts/xpedite5200.dts     |  8 +--
>  36 files changed, 437 insertions(+), 363 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
