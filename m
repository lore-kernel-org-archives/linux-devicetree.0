Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25A4C35DF9
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 09:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78DA721927
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 09:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKjocvhq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbgBYJTA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 04:19:00 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37599 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgBYJS7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 04:18:59 -0500
Received: by mail-wm1-f67.google.com with SMTP id a6so2315764wme.2;
        Tue, 25 Feb 2020 01:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zhzQt0v4AKydtv7tO0DiTIl7lsQ5dKu2Jl12PT3jBCs=;
        b=YKjocvhq/JnPNg/hrU12NGFQsRbbx7F9fqnV7iEKGczlPz+xGVDSI1H7+/DYyEXYVL
         lyHCEqTmK4supfVMUGuWZ1Vk2Zbi9GlkxybRlucE0owRgxWc6DKkOHPbiQCrbYE9cf9k
         +FftO2Bl5//6vKIztfTIKgnqWq35ipFj8C+yafT3e91VPDEAzS+hGgaPUBNR8vBdy3hd
         2tuDdsobqNoBwnsNE6fDlKUBV2WFJL6PerFZJvn1zAxcL1WeLOaiGK4FqW2S0FAFBHyY
         QRhPiclu2MOHbBDc/CzPL0588YYJhyVIdB+WFlzdezZT6rDcddRuScv/mn5cKepB0FrK
         2hTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zhzQt0v4AKydtv7tO0DiTIl7lsQ5dKu2Jl12PT3jBCs=;
        b=B7/pndAGKI/+JACKMDBxA+uOzLzMuT2BnMoZuiJP0asUDGPG+ZXzskqdkSMbRyHL+7
         FjB+STmvAuiveYrwqj6taBy4gxZgls03GpYCyABLyov031BQ8gon2oji5oY6Bc39voui
         M8SpAn0yfh3YzNXGRkBPShZDZ28YotUMtOh/xmRMvdrTZphKN48ci7p2xGZLi5WXB3GN
         i6mWWXl9lrKR/AN1hh+fTihAMu/22+oF6VcFqcaE91k45joCP20MUEVclF4lP5yqaEOe
         Q+3yt2Pbk5iw1k7DQBhtbgQQcAXaoK0tL3SBNj8WfDzapL7ePvHPfGYl2Bz87ZulYkcK
         +egw==
X-Gm-Message-State: APjAAAUUBYPaoRqiYjqraxrXPnp4f3Adi2K8nZVY3WU6R3tMB0REbDwF
        fnxmUmmT0nEZ+qeS18A7ACw=
X-Google-Smtp-Source: APXvYqxoTOz26NdCMff5T3MAlktiniBZ3mI/36yXLv7IUZvGJmyvjDRu/tlExPeR3EkpU4HpBpM+fg==
X-Received: by 2002:a1c:451:: with SMTP id 78mr3980607wme.125.1582622336447;
        Tue, 25 Feb 2020 01:18:56 -0800 (PST)
Received: from localhost ([193.47.161.132])
        by smtp.gmail.com with ESMTPSA id p12sm23271786wrx.10.2020.02.25.01.18.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 01:18:55 -0800 (PST)
Date:   Tue, 25 Feb 2020 10:07:55 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, Rob Herring <robh+dt@kernel.org>,
        linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com,
        shawnguo@kernel.org, linux-clk@vger.kernel.org, peng.fan@nxp.com
Subject: Re: [PATCH RESEND v3 14/15] arm64: dts: imx: add imx8qm mek support
Message-ID: <20200225090755.GA17799@optiplex>
References: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
 <1573994635-14479-15-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573994635-14479-15-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 17/11/19, Dong Aisheng wrote:
> The i.MX8QuadMax is a Dual (2x) Cortex-A72 and Quad (4x) Cortex-A53
> proccessor with powerful graphic and multimedia features.
> This patch adds i.MX8QuadMax MEK board support.
> 
> Note that MX8QM needs a special workaround for TLB flush due to a SoC
> errata, otherwise there may be random crash if enable both clusters of
> A72 and A53. As the errata workaround is still not in mainline, so we
> disable A72 cluster first for MX8QM MEK.

can you point me to the errata workaround patch for the MMU/TLB Coherency
issue? I observe the same issue here with another imx8qm board.

Best Regards,

Oliver
