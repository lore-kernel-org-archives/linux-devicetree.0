Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A70C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 20:52:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50F9C20738
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 20:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597697558;
	bh=qq/Aq6gH91HmodHUuGstQfY62H36imeGZ9HxFm3ZU38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=C9x60fjtn+HPyVeRPk61cMPdjvkBYPBDJ835FkIZg+0D/VY/LQGODteZJh6jFDSbo
	 Ztg4ojHPW/bPwx4pzCWtY04ZRw1KhWYFSw9I8+IKzzevehLNV76XCZmsjY9CBbILCu
	 vnS+WMD3Et0iZl4AdzgtcBm61OBF7hhAadyfsi6Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgHQUwh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 16:52:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:35988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgHQUwg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 17 Aug 2020 16:52:36 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B15F22065D;
        Mon, 17 Aug 2020 20:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597697555;
        bh=qq/Aq6gH91HmodHUuGstQfY62H36imeGZ9HxFm3ZU38=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hS2LVsyU8NJ8bR4fK4TKRsh1j9DVIs2drJXjOHGbvQtu+jFjV4NV3NdQosReQua6P
         9n8I9NIi+xITfG7i7wnRkxOwy13Ki2qzGPcHipkdQ2Olz6dGmdQWupXmAiia2TjEKA
         6+d0V9wMAWqvt1xFEumTyNJVU6kYZstFp0EI0MSU=
Received: by mail-ot1-f45.google.com with SMTP id h22so14518413otq.11;
        Mon, 17 Aug 2020 13:52:35 -0700 (PDT)
X-Gm-Message-State: AOAM530JTTqA1twM3ko5WKkKKmVLX6/TD/V0YstDQh0GJExO2jrB98ur
        zUU6oqLB3SDpoM1lv6fhIVKYjl6m5sM4vsvUKg==
X-Google-Smtp-Source: ABdhPJxaF0nYdin2AdmlzdGbIHiRf2CI5TWBbErlxvKR1Popk5mGNuff8kbE7smq29spDmT37s+s0UIO+v4pPWaQ6I4=
X-Received: by 2002:a05:6830:1d8e:: with SMTP id y14mr12789084oti.129.1597697555093;
 Mon, 17 Aug 2020 13:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200817160037.255972-1-jacopo+renesas@jmondi.org> <20200817191855.u55o75iby6ib7hhe@uno.localdomain>
In-Reply-To: <20200817191855.u55o75iby6ib7hhe@uno.localdomain>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 17 Aug 2020 14:52:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJFaewwrqM_vfGWGS5RGcJ2h144wV8dgWgCtO3hQQwF0w@mail.gmail.com>
Message-ID: <CAL_JsqJFaewwrqM_vfGWGS5RGcJ2h144wV8dgWgCtO3hQQwF0w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: imx274: Convert to json-schema
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Leon Luo <leonl@leopardimaging.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Aug 17, 2020 at 1:15 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Slightly better with a subject  =)
>
> I made a formatting error, empty line between receivers list and Subject:
>
> Sorry about this :)

Just resend so all the tooling works. My scripts barfed on it as it
seems to not be in lore.

Rob
