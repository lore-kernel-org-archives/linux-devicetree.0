Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E1EC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 13:50:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E48E520825
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591192208;
	bh=Fj0iOVs08jiwu5naUApH7MvVszFmEVZ9O5OdKBSK/BQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=qyeh4azKFAWRR/BtdmsLQKdZKbX0+C1YdqM7f9D0S99ALtxxFbVVyT6EjzIhwSr5H
	 alUUYgJkVONXh1JinbyiJ0JBOXRown2NkkO7AiLAkiHph6/raQiI+Tkg3zkmiJQ7MI
	 ZkDTJxG38Tr5jjuFqDS/VkxsrCMiw+cpAQs0HTJ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgFCNuI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 09:50:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:55034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbgFCNuH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 3 Jun 2020 09:50:07 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3B5320825
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591192207;
        bh=Fj0iOVs08jiwu5naUApH7MvVszFmEVZ9O5OdKBSK/BQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fyRXV0H8vSIeExulim9o0tksgr7SEAh2+R5VFhBJRxrMdrenEkDT8+DOiaiOOacOp
         D0vXZ/Nr1DEcduC4H+e2SMYAJmO/GY7jpso+6+yIQ6XSJQLqgwREMDcmVB3dxCTi8p
         oMs935DFnJWX142nv/Y1NX1kZt0nj0lASNmMt/M8=
Received: by mail-ot1-f45.google.com with SMTP id b18so1918097oti.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 06:50:06 -0700 (PDT)
X-Gm-Message-State: AOAM530NNaDBm3CMy/+vpPe6mpu4V7uqcqKKd6HrWbU3wCvuM/dfYwSE
        /oH0YGkOPMOYi/eNazcaZncdAmSWI6CrcgMCOQ==
X-Google-Smtp-Source: ABdhPJw+nAaODIOdecGluSxYY7HWI8UQEezTU6nVGm356t+p9EGwagFR+l+QCJoqrQqbzEaag6QgdNSqIXSrvH0MQd0=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr44862otr.107.1591192206147;
 Wed, 03 Jun 2020 06:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-5-andre.przywara@arm.com> <20200528024810.GA232303@roeck-us.net>
 <48afb8bb-a22a-54df-7751-55b7b84c3c88@arm.com> <22687572-becf-7b4e-9759-cfba44677a1d@arm.com>
 <CAL_JsqLgNDd-+rrYD=Y0Hm=NaV7f0NbBFb9uhhYhzM6LjxnXZg@mail.gmail.com> <1d111f40-1702-7ea0-825f-ab08d77353e9@arm.com>
In-Reply-To: <1d111f40-1702-7ea0-825f-ab08d77353e9@arm.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 3 Jun 2020 07:49:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKSH1Oy5yAw463dHuCxnBEgEa0DYR8EK-p=y957h5kNCw@mail.gmail.com>
Message-ID: <CAL_JsqKSH1Oy5yAw463dHuCxnBEgEa0DYR8EK-p=y957h5kNCw@mail.gmail.com>
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

On Wed, Jun 3, 2020 at 5:21 AM Andr=C3=A9 Przywara <andre.przywara@arm.com>=
 wrote:
>
> On 02/06/2020 00:12, Rob Herring wrote:
>
> Hi,
>
> > On Mon, Jun 1, 2020 at 4:15 AM Andr=C3=A9 Przywara <andre.przywara@arm.=
com> wrote:
> >>
> >> On 28/05/2020 14:30, Andr=C3=A9 Przywara wrote:
> >>
> >> Hi,
> >>
> >>> On 28/05/2020 03:48, Guenter Roeck wrote:
> >>>
> >>> Hi Guenter,
> >>>
> >>>> On Wed, May 13, 2020 at 11:30:00AM +0100, Andre Przywara wrote:
> >>>>> The devicetree compiler complains when DT nodes without a reg prope=
rty
> >>>>> live inside a (simple) bus node:
> >>>>> Warning (simple_bus_reg): Node /bus@8000000/motherboard-bus/refclk3=
2khz
> >>>>>                           missing or empty reg/ranges property
> >>>>>
> >>>>> Move the fixed clocks, the fixed regulator, the leds and the config=
 bus
> >>>>> subtree to the root node, since they do not depend on any busses.
> >>>>>
> >>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >>>>
> >>>> This patch results in tracebacks when booting the vexpress-a15 machi=
ne
> >>>> with vexpress-v2p-ca15-tc1 devicetree file in qemu. Reverting it as =
well
> >>>> as the subsequent patches affecting the same file (to avoid revert
> >>>> conflicts) fixes the problem.
> >>>
> >>> Many thanks for the heads up! I was able to reproduce it here. On the
> >>> first glance it looks like the UART is probed before the clocks now,
> >>> because the traversal of the changed DT leads to a different probe
> >>> order. I will look into how to fix this.
> >>
> >> Turned out to be a bit more complicated:
> >> The arm,vexpress,config-bus driver walks up the device tree to find a
> >> arm,vexpress,site property [1]. With this patch the first parent node
> >> with that property it finds is now the root node, with the wrong site =
ID
> >> (0xf instead of 0x0). So it queries the wrong clocks (those IDs are
> >> actually reserved there), and QEMU reports back "0", consequently [2].
> >> Finding a clock frequency in the range of [0, 0] won't get very far.
> >>
> >> Possible solutions are:
> >> 1) Just keep the mcc and its children at where it is in mainline right
> >> now, so *partly* reverting this patch. This has the problem of still
> >> producing a dtc warning, so kind of defeats the purpose of this patch.
> >>
> >> 2) Add a "arm,vexpress,site =3D <0>;" line to the "mcc" node itself.
> >> Works, but looks somewhat dodgy, as the mcc node should really be a
> >> child of the motherboard node, and we should not hack around this.
> >>
> >> 3) Dig deeper and fix the DT in a way that makes dtc happy. Might
> >> involve (dummy?) ranges or reg properties. My gut feeling is that
> >> arm,vexpress-sysreg,func should really have been "reg" in the first
> >> place, but that's too late to change now, anyway.
> >>
> >> I will post 2) as a fix if 3) turns out to be not feasible.
> >
> > I would just do 1).
> >
> > To some extent, the warnings are for avoiding poor design on new
> > bindings. We need a way to distinguish between existing boards and new
> > ones. Maybe dts needs to learn some warning disable annotations or we
> > need per target warning settings (DTC_FLAGS_foo.dtb ?). Or maybe this
> > check is just too strict.
>
> So I was always wondering about this check, actually. A simple-bus
> describes a bus which is mapped into the CPU address space (in contrast
> to say an I2C bus, for instance). So children of this bus node typically
> have a reg property.
>
> Now also those simple-bus nodes seem to be used to logically group
> hardware in a DT (see this "motherboard" node here). *If* we go with
> this, we should also allow other subnodes, for instance fixed-clocks:
> after all there is probably an actual fixed crystal oscillator on the
> motherboard, so it would also belong in there.

Yes, that's probably right. We'd want things grouped if this was
something applied as an overlay.

> I see that (ab)using simple-bus for *just* grouping nodes is probably
> not a good design, but I don't see why *every* child must be mapped into
> the address space.
>
> Maybe dtc's simple-bus check should indeed be relaxed, to just require
> *at least one* child with a reg or ranges property, but also allow other
> nodes?

It's made you think about the proper location, so it's accomplished
its goal. Maybe this is one that's not without false positives. It
would be good to distinguish between what's for sure a warning and
what's maybe a warning as just blindly fixing the warning is not the
answer.

Rob
