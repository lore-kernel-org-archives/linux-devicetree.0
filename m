Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7327AC43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 09:28:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4398D20705
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 09:28:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="KFFzlOF8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dZIFWv5B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgC0J2d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 05:28:33 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:58693 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbgC0J2d (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Mar 2020 05:28:33 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 071275800A5;
        Fri, 27 Mar 2020 05:28:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 27 Mar 2020 05:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=LhbEX+PTcMuPpL/1ETXXhTFLIWQ
        COOvbBr7bWPk6nqo=; b=KFFzlOF8jEmg0DqntkIpgK2wxHlt/GqsgU2g+iagndP
        DdNijv3uS7jXI44crUGd4W3da3oMvV2EctegJACm/uDP2BfpRcTgKVQtM5q4odLs
        U+w9apbY7q3miOFvV7IPdjDVslaPPGcwgPjaTii+xtTtWrZvh/pPQYt1pW6vKDT9
        hwUrKpKm7R1mnKIggtJlW4ciPA6RCSYRK+tY8eiJzdHmd2Xn3zxffWrwC3VWLlYb
        iavPMGvPaiAqMV1H5JqGZ0AwUG+4C3owepqGJ7LCf14LV/ipNcJEI13msNrjB8vV
        BDFSXs0+tqBXuso3rQHpBjTOwIatLksQ4quDmQXnK+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LhbEX+
        PTcMuPpL/1ETXXhTFLIWQCOOvbBr7bWPk6nqo=; b=dZIFWv5B0fd9XhM75muntn
        mlezGQOSxqrOGQRHoKoYfJS4kNNCwLcKPPDIJ7yUTYo6p8s+EHYPMDoIAmgM1sex
        0hpnHd30iNy0TYtIu5lzzoUjfA8U57fwvgVChCMkZUFbBEbrz87iN4EpXWt70YM2
        wjKOYSVjcYGVprBHEKTXl9ulf3Oz+msYRIuvZ+RZUxFPUNvJxHUSg7anE4N5xLqW
        YZbs0EaeNAf5z94rKBH+Si0+81IDcBTPg1LHU2hhNQ/3Ud9YOeCGX8dTxqekI/tR
        iDuFunCHZ5RGAU55TUHDWikr/vxXVoq+xnUH+3RkmcRU2dj3jsjxs0Y1Wjw18flw
        ==
X-ME-Sender: <xms:Psd9XvPEofr28nUW4bHdiPDMjnTxtZWrhu31hu0jIGFBg066VQDtsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehledgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:Psd9XmIb0kbHJLhvnKnYMWl_Vpx_H3BXmHm1z0MGx4k6FlRru5sehA>
    <xmx:Psd9XhJrBqH0Z6921ZHPakUs-Ae6IQC67XnHOCnA6o_ImnU-qxwwBw>
    <xmx:Psd9XiXFiYAWb_VhBLLOFZpl00jqEC0FCe9MCxQJSNSLQ7On98BKeg>
    <xmx:QMd9Xvvp2qQ01S6DgBBHHgfrdena6ZBXSdyYS_7uV7H4yjaISUFDVA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 914AF306C109;
        Fri, 27 Mar 2020 05:28:29 -0400 (EDT)
Date:   Fri, 27 Mar 2020 10:28:26 +0100
From:   Greg KH <greg@kroah.com>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Fredrik Noring <noring@nocrew.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Raul E Rangel <rrangel@chromium.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RESENDING RFC PATCH 0/4] Add logic to consolidate TRBs for
 Synopsys xHC
Message-ID: <20200327092826.GB1693819@kroah.com>
References: <cover.1585297723.git.joglekar@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1585297723.git.joglekar@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 27, 2020 at 02:22:23PM +0530, Tejas Joglekar wrote:
> The Synopsys xHC has an internal TRB cache of size TRB_CACHE_SIZE for
> each endpoint. The default value for TRB_CACHE_SIZE is 16 for SS and 8
> for HS. The controller loads and updates the TRB cache from the
> transfer ring in system memory whenever the driver issues a start
> transfer or update transfer command.
> 
> For chained TRBs, the Synopsys xHC requires that the total amount of
> bytes for all TRBs loaded in the TRB cache be greater than or equal to
> 1 MPS. Or the chain ends within the TRB cache (with a last TRB).
> 
> If this requirement is not met, the controller will not be able to
> send or receive a packet and it will hang causing a driver timeout and
> error.
> 
> This patch set adds logic to the XHCI driver to detect and prevent this
> from happening along with the quirk to enable this logic for Synopsys
> HAPS platform.
> 
> Based on Mathias's feedback on previous implementation where consolidation
> was done in TRB cache, with this patch series the implementation is done
> during mapping of the URB by consolidating the SG list into a temporary
> buffer if the SG list buffer sizes within TRB_CACHE_SIZE is less than MPS.
> 
> 
> Tejas Joglekar (4):
>   dt-bindings: usb: Add snps,consolidate-sgl & consolidate-sgl
>   usb: xhci: Set quirk for XHCI_CONSOLIDATE_SG_LIST
>   usb: dwc3: Add device property consolidate-sgl
>   usb: xhci: Use temporary buffer to consolidate SG
> 
> Resending as 'umlaut' is not accepted by some servers in email.

Only patch 4/4 seems to have gone through :(

