Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB06AC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 23:13:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7214207D5
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 23:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591053189;
	bh=QjmorbqlDGfNfmG/jRLD/FFAzah/loEc/rFGjs/2nSU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=N7oWERbv7SlhYPBsbo6Q57XQq88/EKW+WaK31Mw5lYQL3VPB1w13glulCKewgy61t
	 NLNSuQLtcqnWE77H7E06RVnb3B4vkiyDryBF+E1K4i/+FFw4mPGAPEmeE/fY0rAkNb
	 6fSkOn7VdZb2m87iaAav7aHUOyLSR23/tmr4qEho=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgFAXNJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 19:13:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:52042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbgFAXNI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 1 Jun 2020 19:13:08 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB9CA207D5
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 23:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591053188;
        bh=QjmorbqlDGfNfmG/jRLD/FFAzah/loEc/rFGjs/2nSU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aWpvh9cJbAHrcUJ0DtC2CVoMrdKtGC+qwnREjVbN6kNV1hw5MQ68jEvCClgZZ5InK
         Dk/Ot+tn+2xeZM+JUMClbhOs23ckiFo9qGiOf3AhpsNOp3rVCw4iLlkURDNP5+T6gP
         MzyjKQlM9oxjyMXG4tVO9WbUVH75yDwjfG+vtoo0=
Received: by mail-oi1-f172.google.com with SMTP id x202so9918886oix.11
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 16:13:07 -0700 (PDT)
X-Gm-Message-State: AOAM532VgwN3tpXAh/cH38EQW/B2hoT/LDu21E1wKTzJ9l51RUn5SdrE
        qf7d8KxpXLZIdFzUfTLi+3B4CkFd5AQHgpBDMA==
X-Google-Smtp-Source: ABdhPJwTLGMeFHhzeNeGSkirnsYqDpNgDMfVQCkPvIwg+63gjEopfekc02y7O5fOCKqGSpuy3uOOFy9kYwDGxedk7N0=
X-Received: by 2002:aca:4e55:: with SMTP id c82mr1144810oib.147.1591053187169;
 Mon, 01 Jun 2020 16:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-5-andre.przywara@arm.com> <20200528024810.GA232303@roeck-us.net>
 <48afb8bb-a22a-54df-7751-55b7b84c3c88@arm.com> <22687572-becf-7b4e-9759-cfba44677a1d@arm.com>
In-Reply-To: <22687572-becf-7b4e-9759-cfba44677a1d@arm.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 1 Jun 2020 17:12:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLgNDd-+rrYD=Y0Hm=NaV7f0NbBFb9uhhYhzM6LjxnXZg@mail.gmail.com>
Message-ID: <CAL_JsqLgNDd-+rrYD=Y0Hm=NaV7f0NbBFb9uhhYhzM6LjxnXZg@mail.gmail.com>
Subject: Re: [PATCH v3 04/20] arm64: dts: arm: vexpress: Move fixed devices
 out of bus node
To:     =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 1, 2020 at 4:15 AM Andr=C3=A9 Przywara <andre.przywara@arm.com>=
 wrote:
>
> On 28/05/2020 14:30, Andr=C3=A9 Przywara wrote:
>
> Hi,
>
> > On 28/05/2020 03:48, Guenter Roeck wrote:
> >
> > Hi Guenter,
> >
> >> On Wed, May 13, 2020 at 11:30:00AM +0100, Andre Przywara wrote:
> >>> The devicetree compiler complains when DT nodes without a reg propert=
y
> >>> live inside a (simple) bus node:
> >>> Warning (simple_bus_reg): Node /bus@8000000/motherboard-bus/refclk32k=
hz
> >>>                           missing or empty reg/ranges property
> >>>
> >>> Move the fixed clocks, the fixed regulator, the leds and the config b=
us
> >>> subtree to the root node, since they do not depend on any busses.
> >>>
> >>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >>
> >> This patch results in tracebacks when booting the vexpress-a15 machine
> >> with vexpress-v2p-ca15-tc1 devicetree file in qemu. Reverting it as we=
ll
> >> as the subsequent patches affecting the same file (to avoid revert
> >> conflicts) fixes the problem.
> >
> > Many thanks for the heads up! I was able to reproduce it here. On the
> > first glance it looks like the UART is probed before the clocks now,
> > because the traversal of the changed DT leads to a different probe
> > order. I will look into how to fix this.
>
> Turned out to be a bit more complicated:
> The arm,vexpress,config-bus driver walks up the device tree to find a
> arm,vexpress,site property [1]. With this patch the first parent node
> with that property it finds is now the root node, with the wrong site ID
> (0xf instead of 0x0). So it queries the wrong clocks (those IDs are
> actually reserved there), and QEMU reports back "0", consequently [2].
> Finding a clock frequency in the range of [0, 0] won't get very far.
>
> Possible solutions are:
> 1) Just keep the mcc and its children at where it is in mainline right
> now, so *partly* reverting this patch. This has the problem of still
> producing a dtc warning, so kind of defeats the purpose of this patch.
>
> 2) Add a "arm,vexpress,site =3D <0>;" line to the "mcc" node itself.
> Works, but looks somewhat dodgy, as the mcc node should really be a
> child of the motherboard node, and we should not hack around this.
>
> 3) Dig deeper and fix the DT in a way that makes dtc happy. Might
> involve (dummy?) ranges or reg properties. My gut feeling is that
> arm,vexpress-sysreg,func should really have been "reg" in the first
> place, but that's too late to change now, anyway.
>
> I will post 2) as a fix if 3) turns out to be not feasible.

I would just do 1).

To some extent, the warnings are for avoiding poor design on new
bindings. We need a way to distinguish between existing boards and new
ones. Maybe dts needs to learn some warning disable annotations or we
need per target warning settings (DTC_FLAGS_foo.dtb ?). Or maybe this
check is just too strict.


Rob
