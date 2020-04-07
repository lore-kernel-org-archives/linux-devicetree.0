Return-Path: <SRS0=WBDS=5X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DC1C2D0EC
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 20:01:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F41CC2074B
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 20:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbZRa7NA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgDGUBo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Apr 2020 16:01:44 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34345 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgDGUBo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Apr 2020 16:01:44 -0400
Received: by mail-ed1-f67.google.com with SMTP id o1so5677959edv.1;
        Tue, 07 Apr 2020 13:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MUp2c8y2HHIRTgmEPGs/ibkN5lEkspycNdWSfgTEUbc=;
        b=cbZRa7NAaCPaiw6zS3iRUdW4uzgbS0SWPdsGbxiwfadp2acuIijtujdC50n7iZ8NrE
         FIcWdhrcoI5RNwMfBlexxqdGQ0SKzDBKJuVly8+JLmH+KcDOo2TFS0eSynx1WEJaPbku
         LAqtf4x5pU40f+ftCz1Jomp6RE5xWIT6Dm1EPRaW28c9lSSr7yUzDt/EtyWq7XlvDsq/
         08j/h2TRfeRinXGaAl4BqB7u656k4a6oeu3/veMM7zc9g26ZyDvAAA/BXXFuPWEortT4
         lgWL6+pQBIwtuaAlLyAlXvWIb6DciwEerX99EigP+k+FUfWyR3nGIcArarq+CYp1hVYK
         dh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MUp2c8y2HHIRTgmEPGs/ibkN5lEkspycNdWSfgTEUbc=;
        b=Lr0QINsbrZxMLPmYx2EJdmmfod0qrQcUBVklEf7VrluYXD2/koY2fDflCuotafi6PE
         oeKZ5bETlpSgpBtc5kP8l4dHDuRJEUPEKjMdNAX8QIAMKOVeqIY+NgvT0NEqIavUTu3C
         xHEb+uu83i/Y18A4/9oaCOcYVdXT0/IAp9ias5xRjf6CTLfqWzYrj1vEdDPBvcJUhm2T
         /5X467HgI3008X94Solq3iGu5OLBv5EBSIox9Nq9irG8w41LkZZyOUgQz4OJhSNV5YIZ
         bckMUYh4U5Ni6MkE9azRXTjfvHudAVi9wEXXw7EeYYmabB8DtkGJAUGRHOxtlCEDkuao
         9q/g==
X-Gm-Message-State: AGi0PuaKzbikSg422Jp5mHmU6i0itUbOq/viMjUzW6U8USsd8jHnKWtp
        EQf/ESqP3s44wwiM9k6HrRc=
X-Google-Smtp-Source: APiQypLw2Bgw9Bv8VPrZlk8TUFwIQDQloArkzAbK/Bt5c3ZmgZ/x1wwX+mRUWbeYUPxRm8YxyuKo7w==
X-Received: by 2002:a17:906:9386:: with SMTP id l6mr3463879ejx.305.1586289700207;
        Tue, 07 Apr 2020 13:01:40 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id by11sm3245237ejc.89.2020.04.07.13.01.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Apr 2020 13:01:38 -0700 (PDT)
Date:   Tue, 7 Apr 2020 22:01:38 +0200
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH v3 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Message-ID: <20200407200138.GA13466@ripley>
References: <20200324071030.19801-1-peter.chen@nxp.com>
 <20200324071030.19801-2-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324071030.19801-2-peter.chen@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 24/03/20, Peter Chen wrote:
> Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
> and is only used for USB3 and USB2.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

Tested-by:  Oliver Graute <oliver.graute@kococonnector.com>
