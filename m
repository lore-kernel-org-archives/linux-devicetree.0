Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF30ECA9EC6
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 14:33:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B5DF2173E
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572445986;
	bh=Fv2yRJrcUoyk8QeLnGsP/rNu0PTRxKv8PkEoXLXYiY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=G+5n/BLuitLGqAHJUl5ugIfFsjhGpFqUdgGe5RfFePTf4YaEarI3Wm84B2eYt0B/6
	 7qRPUV5QftF8Y3IiJjBLf7MCQFOwMYbtHxZ1quDunHvfGRiZlU83RCrnevCihY1RjH
	 HO8Au71gb9gHhde4tfEVgS8N3MGSqnTf6zwY4f28=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfJ3OdF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 10:33:05 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41714 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfJ3OdF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 10:33:05 -0400
Received: by mail-ot1-f66.google.com with SMTP id 94so2260741oty.8;
        Wed, 30 Oct 2019 07:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JfzaI+5/WnJ1mGrlzlCMhTtSMu8cacfMya2nBVqocXA=;
        b=HTfQrMwH9rp+a6byEeMGBss51x4L4RqO/2oXBLCd31qM+/nAmZkF3q7fhtXMhGSDZV
         MpCiOd2ZLjWkmoXWBq34eGA2hEm7lL4bs6kEhf3EHh4zRxdl5SMb6EV/lX+VqJMzyCvV
         EZ1ZmRSJ+LPK8nzY5CVnF/Lk36O84hJhk7l1MPLgtcIT+mP56tzqTYP91/QdZz/JDK/K
         KXWJ7/F3+R2gM5WOg3n4DBLqk0kiRtFSbJDw+XAk/Wlu5q9D/SQXsrLmwKZJki5v93Kj
         k4S6HjDYj0YvinSx9giI71hKSD9oOUbqMO+1fxF+V3moJsHTaVp6ZTbVoFAhB9/1uf2b
         +oqg==
X-Gm-Message-State: APjAAAWq5pPosWN3hJI/d1K3orre1gA1BvR1c17wvjVuYOqG1qNQiStl
        ihgD0qCqt3c4DXpRfoPfFA==
X-Google-Smtp-Source: APXvYqwSl565DVcvOv5ryhMotFAeFTMieJr2P0U0v/KWVc89Kggyts3Mx1ORwVYFTHFRmOBFuHyjsg==
X-Received: by 2002:a05:6830:1399:: with SMTP id d25mr140641otq.113.1572445984277;
        Wed, 30 Oct 2019 07:33:04 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e102sm76404ote.78.2019.10.30.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 07:33:02 -0700 (PDT)
Date:   Wed, 30 Oct 2019 09:33:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, geert+renesas@glider.be,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Fix clock[-name]s properties
Message-ID: <20191030143301.GA10942@bogus>
References: <1572242850-9073-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1572242850-9073-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572242850-9073-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 28 Oct 2019 15:07:27 +0900, Yoshihiro Shimoda wrote:
> Since the hardware requires to enable both USB 2.0 host and peripheral
> functional clock, this patch fixes the documentation.
> Fortunately, no one has this device node for now, so that we don't
> need to think of backward compatibility.
> 
> Fixes: 311accb64570 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt     | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
