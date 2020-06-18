Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40E5C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 16:25:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8065207DD
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 16:25:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kEL4bK1d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgFRQZm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 12:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgFRQZk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 12:25:40 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2471FC06174E
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 09:25:39 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id b15so3389742ybg.12
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EgmY/bq5WADl2wSclx81HU3mqmUZ2s6wpM2K8ozYh/I=;
        b=kEL4bK1dZihZhgR0VJn0n8rVXRz97FPvI/9DomeJV+waSl8+8r9Za2shd+TkuUNHkC
         b+18+cX2chruXAaqwmI/EAgUqJoBI+d2ppIh4a78ZpCXlHZy7Jry0515kr1wUP0hu5fN
         Us2n0H6ot/ceJ6RGgcVesjzKEUlJdHdHQIGkCN3S2/7AX/pXwZA6pRyLW+/uiS5wDA1B
         mwLjIUIotTejrOlCP4TKBJ5iXHgA7Yvsc2ikxD19VbNFprTsdStiyFfEW/mMBrqynKgZ
         /MQlf3tefU1IjF4EErrxHkjBiojIFdvqx0Wi4p1cgZrGHTra4jtUq1J6vuUWTVcK6Az8
         4fCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EgmY/bq5WADl2wSclx81HU3mqmUZ2s6wpM2K8ozYh/I=;
        b=pLqxT/9oOR7RMXkwNB2wjCtMU1YzsE1s3hfCVi33EEAtmaEBMO6RSwyM2LhwZ6AwK5
         1FS7EISSQ3xQE84yroUGMYAZeob+i+XpmorrLvKXymdVk/Edkq2jfHxEDl5mFteHFQtt
         XNXlz+7lpLi+fxTM0ljFsWJtZs4cfI4RgoJNw4yXu5QEI5z1hKyosqSowC8FFMcRlTvj
         4pwBqn41NIPROLdmIlGVrrU/4jIA+rLZXGcqNd/nzgtRdHv4RsGlbs+rvVlJ/ejNTCQ0
         3vcozqiB9SKqdIHhrZ4uVJCPfLMBseAG/RGHIAQlY4K5hMuo3xGH53/Bx4Tp3Oec7dtw
         X6xg==
X-Gm-Message-State: AOAM532xS5qrzgYd40f+v3ChHX2XTpXg0mrUYWpohm0edDibhxJTCYFm
        qc87QILuJbI45axMYbVpkO7sN15FxlU+N5OVjJnnbg==
X-Google-Smtp-Source: ABdhPJys2YF54jyVQf4tf4V70Bc9TNuyAA2nv2hmqW+kJgty7KpaY2znKEl/u7pwsvwCS082rBUbvAPgJZqdo/+5+Fk=
X-Received: by 2002:a25:ca45:: with SMTP id a66mr7951696ybg.164.1592497538900;
 Thu, 18 Jun 2020 09:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200615193811.233737-1-jnchase@google.com> <20200615193811.233737-3-jnchase@google.com>
 <3aefc5c4-2af1-59f2-0797-9a5baf91482e@xs4all.nl> <CALTkaQ3n30nS-b1XuMiu_Z4+FfD0horJDagCPBaUqCCx4JhtdA@mail.gmail.com>
 <e45bf5a1-3862-66a2-213b-f7e5563e5a5d@xs4all.nl>
In-Reply-To: <e45bf5a1-3862-66a2-213b-f7e5563e5a5d@xs4all.nl>
From:   Jeff Chase <jnchase@google.com>
Date:   Thu, 18 Jun 2020 09:25:27 -0700
Message-ID: <CALTkaQ02_ttD52h=74hGos09a0ihQwv-rQS5vwpDsrdnK_rYrg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 18, 2020 at 3:05 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 18/06/2020 10:59, Jeff Chase wrote:
> > Hi Hans,
> >
> > We are using two of these in an Intel-based Chromebox. I see that the
> > cros-ec and seco drivers just statically define the PCI BDF of the
> > Intel graphics device for their boards. I don't see an example of ACPI
> > passing this information. I can copy cros-ec and seco by adding a
> > board table and then use the UID of each device to select the correct
> > port. Adding board-specific configuration to the driver doesn't seem
> > ideal but I'm not sure what the proper way to pass this using ACPI is.
>
> You are right, it's not ACPI, it's using DMI matching.
>
> I have zero knowledge about ACPI, so I have no idea if there is some standard
> method of retrieving this association via ACPI.

I'm not very familiar with ACPI either. I looked for but did not find
an ACPI equivalent of_get_mac_address().

I believe it's possible to reference the PCI node but it would take a
bit of work on both the coreboot and linux side.

>
> This particular chip can actually be used both with DMI matching but also
> on an ARM with device tree, but since you can't test this on an ARM board,
> there is no point in adding support for that.
>
> However, compared to the cros-ec and seco drivers you can do something a bit
> different here: those drivers just return -ENODEV if there is no match, but
> since this driver reads the EDID it can just continue as long as it does not
> set the CEC_CAP_CONNECTOR_INFO capability.

Is it necessary to add support if we don't set CEC_CAP_CONNECTOR_INFO?

Thanks,
Jeff
