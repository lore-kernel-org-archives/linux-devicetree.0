Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5A5C4BA13
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 15:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB17F24680
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582731331;
	bh=28vmu0q7quSW0cR3UaCZfSXIlNoCjY1z4Jo+FpqhCAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1zyXFNA9pLvIjWEJnz1+XYViF5wjvROFVIt19DbHTIRUfKSrk7c+xZa0HddmL0Dvd
	 AnhhqIn56iDCBEuSq6IvpsHNQ6ipVYP/gJlm3Ty8ZB2pTEGLCGZ949NrNESj3vE4zJ
	 mLHOtpfE74MvJR9toA+KpUhM8JyRGETadUgojQ3A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgBZPfb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 10:35:31 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:32854 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728145AbgBZPfa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Feb 2020 10:35:30 -0500
Received: by mail-ot1-f65.google.com with SMTP id w6so3357077otk.0
        for <devicetree@vger.kernel.org>; Wed, 26 Feb 2020 07:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XnGLG9clIiWVR/UEx5xVvFVa9crmP5Vx5u2Nhw9fzTE=;
        b=XBhhNd8Mo3o09tQo9CbIeIWasgJ9ghShvR6XYekNCPhAlaKs1IVouDKpidGr5Ep/vK
         XT4VixzyOUUh8PAY/5cpWUXK/PpX1A+SCZp/7YxbD/934RNYXuS3uxZLpaoNTT99t2UD
         M4OtdOqca+Cpv1mDPIDnPN15iSPcJD19KLeLFldA1OnWP2+0YjMBYHPeXykG34RM29Ug
         /9juaB11X7/uUGdRONylP6rSaCrKomjPvLdo9YIvZsW8BYjctPA6pFMfYSmteZ3WTn7Z
         6sRmB+EHXbu95sFqOA/7xuJZZ8BSjktt+zq/XW6EYiIxOK2iAVMjuUrw9MfhU4eFjwHw
         oVdg==
X-Gm-Message-State: APjAAAWPIuOULxjUR+AXQcnoannJ/gMKA4T+DW3w9pzc0924OkSyW6Rp
        tt0cW8YFjUJrOjQWbrqoZw==
X-Google-Smtp-Source: APXvYqztgZrCoeheCIXvoWgscE51bHbHwWzAnlkPocT/ozf1zBU286if5/WIVhLFDKLOxqkXBmaTMw==
X-Received: by 2002:a9d:754e:: with SMTP id b14mr3466160otl.59.1582731329132;
        Wed, 26 Feb 2020 07:35:29 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e21sm917688oib.16.2020.02.26.07.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 07:35:28 -0800 (PST)
Received: (nullmailer pid 13898 invoked by uid 1000);
        Wed, 26 Feb 2020 15:35:27 -0000
Date:   Wed, 26 Feb 2020 09:35:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: example-schema: Drop double quotes around
 URLs
Message-ID: <20200226153527.GA13766@bogus>
References: <20200219153745.10922-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219153745.10922-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 19 Feb 2020 16:37:45 +0100, Geert Uytterhoeven wrote:
> It is no longer needed to wrap URLs in double quotes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/example-schema.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks.

Rob
