Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8024AC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 05:49:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57AF420B1F
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 05:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PeM20mTF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgGUFtN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 01:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgGUFtM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jul 2020 01:49:12 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F768C061794
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 22:49:12 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id h7so2324760qkk.7
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 22:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J/VlXTBNzYr8hWPwvtPcB4lgFmJDE5C1OJFdc6g87I8=;
        b=PeM20mTFYvDuzMfpomPGFEV+VbCpyqNRz96/UTtSaaCROneoqwStaNoSWR9FvUGKj6
         6d1jx8OFvjMweiWfBfcFiQfN4UKiEHKdePqOtbxKGCfMEWNaKnIucQZmYDLnRSnQh59j
         WY+MsoAYB4zkLOknqmNqoYX/jcfhu+hAn9/Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/VlXTBNzYr8hWPwvtPcB4lgFmJDE5C1OJFdc6g87I8=;
        b=mNKMxDVXgzNQfX6o7vCVdHPm8nxReuIjyrUPtF3EIzTZcTw5CxKfH/19nsfC6e80Do
         15ssVyncrV5AFbRTFDaTpnKuroFaqej+dWZcvaUVAdCjeK4TuW+7bcpvJEKIQymaFzWn
         YmYhxW9BdavRuS90HtswZQtL93m8a4KPyeqy2aPrhzlGYw4BntB8uwuHcaHzFjQeaYo5
         jR4t8PssvcaOxLeimC/8vFPfoSrl5G9+Db/+LHU8wXZBa7yLZzphP1i9x/XcNKmWITG0
         JTo8BEctLvTMXxMKY6d+ATwcqCOlVDD4uqER88dBmypgM3iUYCJNMl3CsSUCYtytyaWd
         O94Q==
X-Gm-Message-State: AOAM532RK2BiJX6CW0qlmRuvMMTqd/bskGqbhIOw6xy1YELsIVvgE+9N
        PYbD0ZvY/50mtd5ZTqytDJjiAqnobRvb6fjepmlM+g==
X-Google-Smtp-Source: ABdhPJw77g3OeCWEh/vfgU+VObGbigGa4gwWnRtUgXrHgKPEHbJSVJ2NsPJ73ftijbPN4mYbIHY9ydyqGxwKveqNMh8=
X-Received: by 2002:a37:ae01:: with SMTP id x1mr23561539qke.179.1595310551419;
 Mon, 20 Jul 2020 22:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200714113617.10470-1-hdegoede@redhat.com> <20200714113617.10470-2-hdegoede@redhat.com>
 <20200721022610.GA3391383@bogus>
In-Reply-To: <20200721022610.GA3391383@bogus>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Mon, 20 Jul 2020 22:49:00 -0700
Message-ID: <CACeCKacEqZX5FKF2Gpaa_zEgf-sCrxsgk-WJ9VDdYsrwZNoCBg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb-connector: Add support for Type-C alternate-modes
To:     Rob Herring <robh@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Tobias Schramm <t.schramm@manjaro.org>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

HI Rob,

On Mon, Jul 20, 2020 at 7:26 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jul 14, 2020 at 01:36:14PM +0200, Hans de Goede wrote:
> > This commit adds the minimum bindings required to allow describing which
> > altmodes a port supports. Currently this is limited to just specifying:
> >
> > 1. The svid, which is the id of the altmode, e.g. displayport altmode has
> > a svid of 0xff01.
> >
> > 2. The vdo, a 32 bit integer, typically used as a bitmask describing the
> > capabilities of the altmode, the bits in the vdo are specified in the
> > specification of the altmode, the dt-binding simply refers to the
> > specification as that is the canonical source of the meaning of the bits.
>
> What if this information should be derived from information already in
> DT (or would be there if alt mode connections are described)?
>
> >
> > Later on we may want to extend the binding with extra properties specific
> > to some altmode, but for now this is sufficient to e.g. hook up
> > displayport alternate-mode.
>
> I don't think this is sufficient as it doesn't describe how alternate
> modes are connected to various components. This has been discussed some
> here[1] with the CrOS folks. Maybe this is orthogonal, IDK, but I really
> need something that is somewhat complete and not sprinkle a few new
> properties at a time.

Just thought I'd add a link[2] to some amendments which were made to
the "switch"
proposal in the thread you added a link to (it has many responses, so
not sure if my
responses got lost in the thread). I also wrote a short summary[3].

Please ignore these if you've already taken a look at them :)

Best regards,

-Prashant

[2] https://lkml.org/lkml/2020/6/12/602
[3] https://lkml.org/lkml/2020/7/10/234
>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > Note I hope I got the yaml correct, this is my first time writing a
> > dt-binding in the new yaml style. I did run:
> > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/connector/usb-connector.yaml
> > and that was happy.
>
> That aspect of it looks fine.
>
> Rob
>
> [1] https://lkml.org/lkml/2020/4/22/1819
>
