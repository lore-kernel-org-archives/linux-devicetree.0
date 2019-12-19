Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68032C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 22:17:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34EF824679
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 22:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576793829;
	bh=hBitebeHLpRJrPRWGnWKAypqkhFpKyFeoVOBqiwoKOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WQ1CnPiIVaNAPPjgVYjtDZv4dvSlFGi5Vlf2B+7Z7ygarH1+0yBRhxvRJSlc1PkHT
	 mI6wFoPV6YK1Jn65kFxPfpyYMTtsdpbfu1p/5icNzLU7K+5CzzcYc2P3TPqtyZyTBw
	 GQmJZywXpkc/1eqSwKnuv0oSr4JiZg7hEngNJ2FY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfLSWRI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 17:17:08 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38909 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfLSWRI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 17:17:08 -0500
Received: by mail-ot1-f68.google.com with SMTP id d7so4718700otf.5;
        Thu, 19 Dec 2019 14:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5ILXDN1450NSoTBVRQ9h8p5BBXStd/5/sYnUN4gZkEU=;
        b=AfcCnxw66Xm4xj3/uaj96hUih/wZPWp/39S37oqu1AXBgSrPH/uohnYPdWQMPRQbID
         nMmUuLKnBbe8PPGRG/uqYJYbB/XmsbzgZ5vhLMB0B7GLeQ7pJWkkxAxLNNPH+bhG681+
         0u2suoR1abdpNr8RBWkITO27Jyd3w5yNwqYKEJn/UmkwaJ72H4XUixNEotg//kn6rMHe
         C6gniUcBc9Q7zHjqYHE85iXRlSQbr2jihh6U7kIBr+xrg8Apmsyb9nBlkL7lBcdSHV/t
         51iczsUGblldhoAnlXE7SpsyWNWPvF1axwkfi08fSnUAM2saMceeM+KSJgeTCg34jt1W
         95LA==
X-Gm-Message-State: APjAAAXvjOLV4Sr1DCBrgJdKX1zlKHrql32TDdmam1piHFesmBNMtEZy
        fNewOtetDKBiYw5B3vWFk724esfouK+E
X-Google-Smtp-Source: APXvYqzgo2yxPw/RLQelQ/Toif55vOb7c6TRuzug4aYI/qpUspauUD8BYilEuy4TBwLluzpi2tS75g==
X-Received: by 2002:a9d:367:: with SMTP id 94mr10557603otv.329.1576793827572;
        Thu, 19 Dec 2019 14:17:07 -0800 (PST)
Received: from localhost (ip-184-205-0-249.ftwttx.spcsdns.net. [184.205.0.249])
        by smtp.gmail.com with ESMTPSA id n16sm2605492otk.25.2019.12.19.14.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 14:17:07 -0800 (PST)
Date:   Thu, 19 Dec 2019 16:17:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 13/14] usb: devicetree: dwc3: Add property to disable
 mult TRB fetch
Message-ID: <20191219221704.GA29965@bogus>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <b791f032edb8e6a739c342dbd0d2d5faa66ddfb8.1576118671.git.thinhn@synopsys.com>
 <87mubyvtuh.fsf@kernel.org>
 <6193f738-03ac-51b5-cdf0-d9b252a50146@synopsys.com>
 <87d0cswvs9.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d0cswvs9.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 13, 2019 at 09:04:54AM +0200, Felipe Balbi wrote:
> 
> Hi,
> 
> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> >> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> >>> DWC_usb32 has a feature where it can issue multiple TRB fetch requests.
> >>> Add a new property to limit and only do only single TRB fetch request.
> >>>
> >>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> >>> ---
> >>>   Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
> >>>   1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>> index ff35fa6de2eb..29d6f9b1fc70 100644
> >>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> >>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>> @@ -108,6 +108,8 @@ Optional properties:
> >>>    - snps,num-trb-prefetch: max value to do TRBs cache for DWC_usb32. The value
> >>>   			can be from 1 to DWC_USB32_CACHE_TRBS_PER_TRANSFER.
> >>>   			Default value is DWC_USB32_CACHE_TRBS_PER_TRANSFER.
> >>> + - snps,dis-mult-trb-fetch: set to issue only single TRB fetch request in
> >>> +			DWC_usb32.
> >> two questions:
> >>
> >> - how is this different from passing 1 to the previous DT binding
> >
> > The previous DT binding is related to the number TRBs to cache while 
> > this one is related to whether the controller will send multiple 
> > (internal) fetch commands to fetch the TRBs.
> >
> >> - do we know of anybody having issues with multi-trb prefetch?
> >
> > No, we added this for various internal tests.
> 
> We really a better way for you guys to have your test coverage enabled
> with upstream kernel. I wonder if DT guys would accept a set of bindings
> marked as "for testing purposes". In any case, we really need to enable
> Silicon Validation with upstream kernel.

Well, anything would be better than the endless stream of new 
properties. Include 'test-mode' in the property names would be fine I 
guess.

However, why do they need to be in DT rather than module params or 
debugfs settings? Changing at runtime or reloading the module is a 
better experience than editting a DT and rebooting.

Rob
