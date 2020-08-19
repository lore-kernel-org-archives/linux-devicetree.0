Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DF0C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 20:21:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB34C207FF
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 20:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597868503;
	bh=RaLxd/gMwrTSCZyog0lPEa+6j9iM5zZakXKT+oL+UK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tYtXyLiNs9EGWkT0jQC3YGiYY7oPcqnhW2ijJlv74kAOiQooz6bxnOcAL/O8P+PrX
	 vU7paMBw8KRuM7N2qO4OZp4Ewu3I17EQdBg9rc13xKXLWoLJZd/hJeTgpEYwU4Jzyd
	 ptQDDb4eZkkW8bkxdV9UlQTV2QUW5eQd55GvhaVY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgHSUVm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 16:21:42 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:45627 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgHSUVl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 16:21:41 -0400
Received: by mail-il1-f194.google.com with SMTP id k4so21811207ilr.12
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 13:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y2A56DitFYrItO/klK6N1pqtpCD5cg4rbI8nQrTnf5M=;
        b=UwwtXRhTa7Jqj7sxCtFz04yLNlDY7qp502puI6CNuxzJSnGzNoto6k5BauLOueGwYU
         fxIatbCp6Wz4eVglsiOpUgwAIfmpDm5d7nU01jGQMGG50mbEMc8hdfGtDzup2R9FBRbd
         t+GlwCIR8zvgM90Njs+lLMd7nh+iSoL333KD1hJzTguhM5JRUfmTzLjDXZ8GjJ8YPcdP
         dgUdB82f+gvRZNBG9FyI+mZd1/XM3zS4ibpaf1YUlJiYHMBKmsEOlv+InWzamAiT1zxP
         Attvf0aBb1Tl9eh1snuPVOFNsj+wLTWoyXEIIw04IYAWsAz6fCNPsjtRi241sDc2g+2q
         +Dwg==
X-Gm-Message-State: AOAM532z5/kNhCSfK9JNmdJqwBiOLfb4wM7qId1QzpUA0QvUDkHXEUCw
        MZuXoUc117gTFfpWXnM9FAKsvmyb8g==
X-Google-Smtp-Source: ABdhPJxqTgjd4ConJzMPxh0ohbhc/FHAuN557XVSGqAtdkRpvX7EF70KBrVcODgP9lXj3oABUHyFJA==
X-Received: by 2002:a92:5209:: with SMTP id g9mr24384176ilb.72.1597868500783;
        Wed, 19 Aug 2020 13:21:40 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id y19sm9148077ili.21.2020.08.19.13.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 13:21:40 -0700 (PDT)
Received: (nullmailer pid 1862895 invoked by uid 1000);
        Wed, 19 Aug 2020 20:21:39 -0000
Date:   Wed, 19 Aug 2020 14:21:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     devicetree@vger.kernel.org
Subject: Re: [PATCH resend] dt: writing-schema: Miscellaneous grammar fixes
Message-ID: <20200819202139.GA1862479@bogus>
References: <20200819124850.20543-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819124850.20543-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 19, 2020 at 02:48:50PM +0200, Geert Uytterhoeven wrote:
>   - Add missing verb,
>   - Fix accidental plural.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/writing-schema.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Rob
