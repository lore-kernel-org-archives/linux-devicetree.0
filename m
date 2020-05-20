Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADF3C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 18:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D73920671
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 18:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="X4Dyq5Ze"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgETS07 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 14:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgETS06 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 14:26:58 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85AFFC061A0E
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 11:26:58 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id h4so3397381wmb.4
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 11:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Y/fdBR4NjwtQDCcpCctgOyCn9js/D87HSWqbK2WjCk=;
        b=X4Dyq5Ze9JCoNjG3KsaNqU1dDeKCUMh00Xiz7+8OVNwUiocD0n54uYbDAPqVAc+JPG
         2jr4mRkAj3MRIH3H62IPk0SHcRtbUooIhrXZjOW4OXNF4scXgT5ySHRquY+Lgb61+whu
         mXsmvrHLfNQ3Jh8mB2zUaH1Hmo2Kd1wMnxKJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Y/fdBR4NjwtQDCcpCctgOyCn9js/D87HSWqbK2WjCk=;
        b=koRmctC2t2xpsZfeO+SDYaaYFRP1oOvJapxCjTsknU4x4+wt5fgVamlVqTW+pjSpcG
         qhGOQv4IG5/UODb/anQNSeWEEk8GRLNscO7CTOnB3LIM3ricbqCLLJz/g6W3mIHzTimP
         7uXcJPw2CSo6yMjl3vVUTmll2z+smQKllCPoJpLS8uMLAPVe95jbnOy98dSJFiC6zsd9
         za1OSLT2dQJIuBvZDfB/W2E1qQ2NIWJe7jO9t5kUFFVnnElUT2DA0L7S/6P5PjdnjdF4
         VJftIm+vGZwzohA4at6e/AYTEB2vFpUVEEnQbXo4hiaC+p2anTP5KwEzx4YwCMWVwmAT
         m/Jw==
X-Gm-Message-State: AOAM530AxIBiXYET9+AEy95ZM4et7RMeO8A5xmvmlAFSAk/cMRiYY7c+
        mlN+3YOK34RknsH1obNYlI0EMHKhdIjhxvt25LPQKQ==
X-Google-Smtp-Source: ABdhPJyKeMi9gaTkOXDaBSgAZ5jBfQr9fDEE+1qJ1e9vX2WhhGVEmL6fshDM82dD1DyIM9MqcUXl+6DgXk1CBF0SP+Y=
X-Received: by 2002:a1c:7305:: with SMTP id d5mr5874355wmb.85.1589999217222;
 Wed, 20 May 2020 11:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200519203419.12369-1-james.quinlan@broadcom.com>
 <20200519203419.12369-10-james.quinlan@broadcom.com> <20200520174216.GA11770@lst.de>
In-Reply-To: <20200520174216.GA11770@lst.de>
From:   Jim Quinlan <james.quinlan@broadcom.com>
Date:   Wed, 20 May 2020 14:26:43 -0400
Message-ID: <CA+-6iNzy_nELB0ptE0vH5KrGMFq4CctFKDipk3ZzXnjnT9hfuQ@mail.gmail.com>
Subject: Re: [PATCH 09/15] device core: Add ability to handle multiple dma offsets
To:     Christoph Hellwig <hch@lst.de>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Saravana Kannan <saravanak@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Sorry, I meant to put you on the to-list for all patches.   The last
time I sent out this many patches using a collective cc-list for all
patches I was told to reduce my cc-list.
Jim

On Wed, May 20, 2020 at 1:42 PM Christoph Hellwig <hch@lst.de> wrote:
>
> If you don't Cc me on the whole series I have absolutely no way to
> review it.  Don't ever do these stupid partial Ccs as they cause nothing
> but pain.
