Return-Path: <SRS0=TSDT=YW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41D9CA9EC1
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 01:27:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E51621920
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 01:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572312444;
	bh=IjFZakfIlsCl47F373lhhTawdHdC5Q8Ssh+PGp0pNa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JHHvuc8Zhz6Q+RrdKSE/uHAIj6NhgqGsd24Nk8gXWu9dPHJpqa6ptsGxffxWjaI7A
	 spor5JN6kwAF7tZlXpOzQuzD0VZUS6va8FWnr5txEA+1eVUTws2jlTMIrq8PFOkeHW
	 6JKEpJ6ki3N7dOKd7dn0Xk1kaeGlefOepbw+j93E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbfJ2B1X (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 21:27:23 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34140 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfJ2B1X (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Oct 2019 21:27:23 -0400
Received: by mail-ot1-f67.google.com with SMTP id m19so8416829otp.1;
        Mon, 28 Oct 2019 18:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4SmlhZp58t9y7GCS89O6Xp3CZGiZODZNHsxfnbHisA4=;
        b=t3Dt/IsAtcYyo525LE+aY1rMpdEGnMyt+iA5WrDdAD3WihAYCvFFPFXi7gYjftYWJf
         u8F7jmOaHuL+2N9OeOx5KWmlymOGdVlAiXCgNbefzAc9c2EaRP3uHC52mF20lLoJD2ri
         dgfyhs2FY+ijJgkyVCRSALCTeDRkz0QrUozZqO1alyaqwunx1w9Qh2myEJMw8CFfZkPi
         FQlgKX9M49KeTB4UqHibBM/9mz+D4gJYHVsQf6UCEgeb6LBVj75+ZEJg2xj7XQJmWF8u
         yv6D3PZxZCHQE12kSPZ3zWDfcqgRmuZ3A4jhVVB3eG2HXaq7p0P0Zw4Y4gFyNUeX9D8+
         KOHw==
X-Gm-Message-State: APjAAAVOekn5qH68/u16p5OvbTelqa1kypDngcKg8MSn8Klc/LGjoduA
        I85r1+BN411/JRdp39DX6Q==
X-Google-Smtp-Source: APXvYqzWxw5mw0RITApmvE7mv3/xBaSdBf/g5e69rA/VZ5lbrTqHiaz2capCQhTXRMf4LdPjHo//Uw==
X-Received: by 2002:a9d:6141:: with SMTP id c1mr16424915otk.117.1572312442302;
        Mon, 28 Oct 2019 18:27:22 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w4sm325865otp.22.2019.10.28.18.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 18:27:21 -0700 (PDT)
Date:   Mon, 28 Oct 2019 20:27:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: clock: renesas: Remove R-Car Gen2 legacy DT
 bindings
Message-ID: <20191029012721.GA24761@bogus>
References: <20191016145207.29779-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016145207.29779-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 16 Oct 2019 16:52:07 +0200, Geert Uytterhoeven wrote:
> As of commit 362b334b17943d84 ("ARM: dts: r8a7791: Convert to new
> CPG/MSSR bindings"), all upstream R-Car Gen2 device tree source files
> use the unified "Renesas Clock Pulse Generator / Module Standby and
> Software Reset" DT bindings.
> 
> Hence remove the old R-Car Gen2 DT bindings describing a hierarchical
> representation of the various CPG and MSTP clocks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in clk-renesas-for-v5.5.
> 
> The abovementioned commit was part of the v4.15 release.
> The conversion was backported to v4.14.75-ltsi, and included in any
> R-Car BSP based on v4.14 (rcar-3.6.0 and later).
> ---
>  .../clock/renesas,rcar-gen2-cpg-clocks.txt    | 60 -------------------
>  1 file changed, 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-gen2-cpg-clocks.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
