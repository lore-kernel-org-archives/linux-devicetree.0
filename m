Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7719C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 22:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C03D320890
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 22:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.b="Fgom0UCJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgETWga (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 18:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgETWg3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 18:36:29 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C11C061A0E
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 15:36:29 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id d24so4980786eds.11
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GvwSKpaoA5x+DSqsB+f1AMPpFVRxKHKEv8uKqvEucYw=;
        b=Fgom0UCJlXX6ZYR7ap+K4eVw6kw8QxPm179ZYKb9zJL1ujJpwqE+yUcYYVKhISNCKw
         eUIQaWUe3fIt6OpRVq9Ow1v3BRUVMxeFwBNOWlT0rnL7AS49gmO9Xw4h9OIl14fCirK2
         FQfW+BFCJLJPRy4aHwTKnMRM5TTXt/qv0UQQUPJGmlDDAZpWofyqRgko5igoobKJyV38
         +5ZHqbzjGWZC3YPOjJ33hygbzTUqyIEtsYXE14kO8S9yd8eSNWi4I3wXOHKUlX2Fo1Pt
         U3ogH66IRdy/zoRJoFEk8/rEbmVKMP4ECMXL7fpIBt6nYq2jYm69D7ABBcGcbPCGGfLT
         RbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GvwSKpaoA5x+DSqsB+f1AMPpFVRxKHKEv8uKqvEucYw=;
        b=BLD8GymYABfZ5yWzqvmmohxnYBClkvqj+HxZCkOCAWbN88bCvLTZlw4n4aUySOfwHA
         zPR2Gm/NVZKsFLrkKiv9XpiVuaM4X1mh3cXeBzydx5kg6Qh4i1lIl59ANbXw0mkthm+7
         v3kuVfM1Cbr7RMZWR3psQpPAaoHBdFtcWoIzTTu/2N3bEzpWK8/lrJxx34p5/6KmeSfh
         RIe0sZT0T2wig9hhgr5lanWTnJJWSM1XUEwcd22Lrux6XSSD8S178it0cY7oveGmqQIQ
         7iFK1rJugNL8Jz+CJrVGAYMJExdV3N+9O0sDWeo+QCNFoTjSLbe9w064a005pAE9qYO/
         zpcg==
X-Gm-Message-State: AOAM533k0APbQ1VWrCQBwowXIeqdUkw2SYT543mz/guGpzorjeVTleDZ
        K7l7/UpbRJ//r4QshSaiSQPQTChiJu56lo3YpXw4Mw==
X-Google-Smtp-Source: ABdhPJy8SxNT7xctFY/cpsgQsvbHUXb6kaGpLDboGiOV9UTKzcQNszwcdpuF74K9ew+mqEwKaaO+9CyvU7oVeY7VHro=
X-Received: by 2002:a50:c2d9:: with SMTP id u25mr5738913edf.123.1590014188051;
 Wed, 20 May 2020 15:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200519203419.12369-1-james.quinlan@broadcom.com>
 <20200519203419.12369-10-james.quinlan@broadcom.com> <20200520174216.GA11770@lst.de>
 <CA+-6iNzy_nELB0ptE0vH5KrGMFq4CctFKDipk3ZzXnjnT9hfuQ@mail.gmail.com>
In-Reply-To: <CA+-6iNzy_nELB0ptE0vH5KrGMFq4CctFKDipk3ZzXnjnT9hfuQ@mail.gmail.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 20 May 2020 15:36:16 -0700
Message-ID: <CAPcyv4jOGE0F4wCFM+cC8g=SofiXaNCBfAEPumUv=7nCM6KJ6Q@mail.gmail.com>
Subject: Re: [PATCH 09/15] device core: Add ability to handle multiple dma offsets
To:     Jim Quinlan <james.quinlan@broadcom.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Saravana Kannan <saravanak@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 20, 2020 at 11:27 AM Jim Quinlan <james.quinlan@broadcom.com> wrote:
>
> Sorry, I meant to put you on the to-list for all patches.   The last
> time I sent out this many patches using a collective cc-list for all
> patches I was told to reduce my cc-list.

You'd be forgiven. There are some developers that are ok to go read
the thread on something like lore if they are cc'd only a subset and
some that require the whole thread copied to them. Perhaps we need an
entry in MAINTAINERS that makes this preference discoverable? To date
I have been manually keeping track of those who want full threads and
those that would prefer to just be cc'd on the cover letter and the
one patch that directly affects their maintenance area.

Certainly blindly cc'ing everyone recommended by
scripts/get_maintainers.pl is overkill, but finding that subset is a
bit of an art.
