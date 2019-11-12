Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7B0C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 12:48:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51D322084F
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 12:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="QWldi17X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfKLMsn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 07:48:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44449 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbfKLMsm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Nov 2019 07:48:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47C6xM6z4Rz9sPJ;
        Tue, 12 Nov 2019 23:48:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1573562920;
        bh=yGPX0ihRsGHoBSHw3nM8YEYTqEx8IEUHP7uLcPtPQD0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QWldi17X64RcjmSvWnT6aPC+hWjq25kDxm7dwPNBxX4z+GBonz9DE9HXXTi8CMMbR
         VtZfk+dOMHWXlhcMyFsd8FlXMBK2u3KfqbufLY+vYO3hfouTGXhQ79ew06k1QxP6WX
         IsjwnuwLnCX3y0wS75aIicIcDnSGaUPv6FYLzzY7KAkl4kGnOix8kgjXgJpbCXGtqf
         EPlj0djpApJ8K7kvxH0ASlJBpJlHX5iQgSXFwkib3YEnavcCLqW5A0ubbcDaoaOj3D
         emI6LRjcoKeorCISgDPmt4KecfdMTwW3vhSmT/Un1TeVP0m32xgbZEegBAgfa71p3H
         jrv+/09Ut48QA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Andrew Murray <andrew.murray@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Cc:     devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 5/7] powerpc: dts: fsl: Use IRQ flags for legacy PCI IRQ interrupts
In-Reply-To: <20191104163834.8932-6-andrew.murray@arm.com>
References: <20191104163834.8932-1-andrew.murray@arm.com> <20191104163834.8932-6-andrew.murray@arm.com>
Date:   Tue, 12 Nov 2019 23:48:39 +1100
Message-ID: <87y2wl1crc.fsf@mpe.ellerman.id.au>
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
>  arch/powerpc/boot/dts/fsl/b4420qds.dts        |   4 +-
>  arch/powerpc/boot/dts/fsl/b4420si-post.dtsi   |   2 +-
>  arch/powerpc/boot/dts/fsl/b4860qds.dts        |   4 +-
>  arch/powerpc/boot/dts/fsl/b4860si-post.dtsi   |   2 +-
>  arch/powerpc/boot/dts/fsl/b4qds.dtsi          |   2 +-
>  arch/powerpc/boot/dts/fsl/b4si-post.dtsi      |  12 +-
>  arch/powerpc/boot/dts/fsl/bsc9132qds.dts      |   2 +-
>  arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi |  12 +-
>  arch/powerpc/boot/dts/fsl/c293pcie.dts        |   2 +-
>  arch/powerpc/boot/dts/fsl/c293si-post.dtsi    |  12 +-
>  arch/powerpc/boot/dts/fsl/gef_sbc310.dts      |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8536ds.dts       |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dts   |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8540ads.dts      | 100 ++++++------
>  arch/powerpc/boot/dts/fsl/mpc8544ds.dts       |  22 +--
>  arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi      |  22 +--
>  arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts  |  14 +-
>  arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts  |  14 +-
>  arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8560ads.dts      | 100 ++++++------
>  arch/powerpc/boot/dts/fsl/mpc8568mds.dts      |  22 +--
>  arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8569mds.dts      |   2 +-
>  arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts    | 150 +++++++++---------
>  .../powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts | 150 +++++++++---------
>  arch/powerpc/boot/dts/fsl/p2020ds.dts         |   2 +-
>  arch/powerpc/boot/dts/fsl/p2020ds.dtsi        |  46 +++---
>  arch/powerpc/boot/dts/fsl/ppa8548.dts         |   2 +-
>  arch/powerpc/boot/dts/fsl/sbc8641d.dts        |   4 +-
>  30 files changed, 408 insertions(+), 368 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
