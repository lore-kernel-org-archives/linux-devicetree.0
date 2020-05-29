Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60D2C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 06:10:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89A4C20721
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 06:10:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O8lfgxkj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgE2GKY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 02:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgE2GKX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 02:10:23 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFA9C08C5C6
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 23:10:23 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id y18so608647ybb.3
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 23:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P2nBGdPlsWRCWwz9C54BrqMhSnzVHF9pPpLpGAMC3UU=;
        b=O8lfgxkjb5WR31oIufsKmCgR0RXJD0+bBpmHJoOsGxw7evXX1GYYvx6gjpXXq/VVs/
         zg169dlblh4WbfJVT3QgVQ0BoduCOGUpZu8kBzC0BMDKv2L/NONRMsgkLCgTYrJ6ttbu
         wBJkHHw6+/hfmz6+UMgrJ19lMQDBVcOZ0oX+lPL9th15Mfn/MUpL3ruNOIi7JDk090In
         YTNXnLQ62K+wyGB7Nfl9wp8cPXWYf2cVtR976UsVbI/ZJbmqt33kisZ4ouKAiGzcj7Tu
         ohyiB/c1stAtRiJ+7q+xWoTIiHx6YXowHh/gwV6Ta9Fg6iEavCBgZv9VZPp3k5hT0Zn7
         c1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P2nBGdPlsWRCWwz9C54BrqMhSnzVHF9pPpLpGAMC3UU=;
        b=Pf7+RFZ5FJtxvQjwCVTI4kzJwnU1HPoOt8mSnrTbrcYwYZ36Wr5HgKX9BqRDT5KT5K
         82B0Z0CQIERUeZNC3PP2BA8XCK3KBMnkLNSjDl6vXQfptQwydsjTA01ijPlrQfUNAfu9
         9aMKhOJ1TnNgOYwYNQHOmuhLkVZ/DAbs61wPVNuRWZh7BSDuBx3hx6mSObwujU7rv9Ce
         HPSeABoNn0KZTB7q5dlkBxkcdpOcAKAFGq+t90dY3KOVHiTjHiGnS0dfgqyQQciU53ez
         glVxzF0lP+woxv26242Gni9eqch/A4av6q1Qwb/66oYacVtHWMFkpYAmOyZBLCqNuhxC
         aw5A==
X-Gm-Message-State: AOAM533Z1HBTupB7H/yH8op5UPdeh65QO1JH0j7VgHkZaoV0PEP0ZFqG
        cdhKt/8cU5hnn6eGkWreCR3jYUDBdUb8ag7qJW/pUg==
X-Google-Smtp-Source: ABdhPJz2Uo8OrbmMgdMlGpmHGp+6cso/2EXGuVofumuIcendMf7zvOHKG9MNc/X4vCTynXfldSDdgB3Pyi2z5THqJ7I=
X-Received: by 2002:a25:ba8f:: with SMTP id s15mr10984024ybg.34.1590732622543;
 Thu, 28 May 2020 23:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200529030012.254592-1-jnchase@google.com> <20200529030012.254592-3-jnchase@google.com>
 <CALTkaQ2OR+bc2QGeucA5aP3SiM5HLnx5=DoZQ51E_1d99Hb5Uw@mail.gmail.com>
In-Reply-To: <CALTkaQ2OR+bc2QGeucA5aP3SiM5HLnx5=DoZQ51E_1d99Hb5Uw@mail.gmail.com>
From:   Jeff Chase <jnchase@google.com>
Date:   Fri, 29 May 2020 02:10:11 -0400
Message-ID: <CALTkaQ0NLgjS7H7De=7jy9jRG1xMFSbzdmxrFNerNU+o1rRzpg@mail.gmail.com>
Subject: Fwd: [PATCH v3 2/2] media: cec: i2c: ch7322: Add ch7322 CEC
 controller driver
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

(Resending as plain text, sorry)

> +static int ch7322_cec_adap_enable(struct cec_adapter *adap, bool enable)
> +{
> +       struct ch7322 *ch7322 = cec_get_drvdata(adap);
> +       int ret;
> +
> +       if (enable)
> +               ret = ch7322_unmask_interrupt(ch7322);
> +       else
> +               ret = ch7322_mask_interrupt(ch7322);
> +
> +       return ret;
> +}
> +

I just realized that doing this here is broken -- the driver depends
on the interrupt to detect when the physical address changes. I could
mask only the tx/rx interrupt here instead but that is starting to
feel a bit pointless.

I haven't looked into the cec notifier mechanism yet but would it be
better to try to use that instead if possible and just ignore this
device's physical address detection? Then I could do more of a proper
reset in this enable op. But I'm not sure if I can properly associate
the device with an HDMI port on my platform unless I make some changes
to coreboot.

Thanks,
Jeff
