Return-Path: <SRS0=WBDS=5X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D8EC2D0EC
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 20:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C48A02074B
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 20:11:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuuoVvxO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgDGUL3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Apr 2020 16:11:29 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35442 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgDGUL2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Apr 2020 16:11:28 -0400
Received: by mail-ed1-f68.google.com with SMTP id c7so5689218edl.2;
        Tue, 07 Apr 2020 13:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O/BJQaeANbIKLpZe5KSFJnDJg0ZhPtLL0czLVqGibAc=;
        b=fuuoVvxO72e9A0KngBAmR45pLxeyY2fkBz+MSrvRxmJBijNKoT+hS/9CKwburDfnYn
         COwPvtLHal+LOGhW/c2e3jg1MnGDW5bFoOdQkD9UXeRuMaL/6kM2cBitYL2WrpnEX+ho
         B2m1N4nwQd7g2dxGUnsglBqWqz55w14tIEbuRcSoh4xjR7R+ebX9MJRKkXQ1nCJHoxXA
         IRYOw4SJcDXvRijVn64TAzmx9D1lAnBVfk5mwTFmvwa/lQ1s3Kvxfy1PdTSrV01X/cmP
         uwQPIMaCBJ1mvgDDlxLi9IXibvlVINo4dvPNQPbS83W6Bm0J+9wmOIlCF1JOM7XsnTb4
         hVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O/BJQaeANbIKLpZe5KSFJnDJg0ZhPtLL0czLVqGibAc=;
        b=PWjXsf4PIn8Um/6LNRhHp2fqKF4sAepTTixsNTGjFoFiQOJCKiAOSwGeQ54qTdg85g
         Jn6H/e1jDt5WVWQDmAt1vS3Zcj3XnFGEFw6YVxZvzcHQKQhyq9emV13x6A/0SXVwhgv1
         15h2mdgC9g22S0TJOPNfZPjcMq5gPv4PSwA1isfZUx5xz1vjKwzQ6AL19pHD4pNJhBu2
         KY+d60q/Yia7hvjJF5X0nO1fXsedBelpm4jN/Vprwa4fw62U5AWSnLedKuPwq91DJIpG
         tQaC7y5DtWEBq8AMB13ypyX9lNh+o2cX6imyjSjhQhk2kPr+PeWQWU7t4OyWDVNdoH4Y
         CdcQ==
X-Gm-Message-State: AGi0PuaFJ0eiOm5XmQmBfGlWy5ZOaUoPKLEdOCB7/TAskHCVSvB3F3pH
        Buz4y78BB74j0cJ+qBFxY4c=
X-Google-Smtp-Source: APiQypLjh8Y73aeBuCicCk/HIPysaQ6m8DET7luf/lR9IXrkt7ld59ZOtgryR6Ruq9iXw2xmD7mdcA==
X-Received: by 2002:a50:aa9c:: with SMTP id q28mr3577169edc.10.1586290286463;
        Tue, 07 Apr 2020 13:11:26 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id p20sm2901637edw.31.2020.04.07.13.11.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Apr 2020 13:11:25 -0700 (PDT)
Date:   Tue, 7 Apr 2020 22:11:25 +0200
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH v3 1/2] phy: cadence: salvo: add salvo phy driver
Message-ID: <20200407201125.GA14497@ripley>
References: <20200324071030.19801-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324071030.19801-1-peter.chen@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 24/03/20, Peter Chen wrote:
> Cadence SALVO PHY is a 28nm product, and is only used for USB3 & USB2.
> According to the Cadence, this PHY is a legacy Module, and Sierra and
> Torrent are later evolutions from it, and their sequence overlap is
> minimal, meaning we cannot reuse either (Sierra & Torrent) of the PHY
> drivers.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

Tested-by:  Oliver Graute <oliver.graute@kococonnector.com>
