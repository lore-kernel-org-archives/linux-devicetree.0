Return-Path: <SRS0=y4GH=YY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AE8CA9ECB
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 20:35:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F9C720656
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 20:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyxJI54a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbfJaUfh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 31 Oct 2019 16:35:37 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36186 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfJaUfg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 Oct 2019 16:35:36 -0400
Received: by mail-ot1-f67.google.com with SMTP id c7so6600213otm.3
        for <devicetree@vger.kernel.org>; Thu, 31 Oct 2019 13:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t0DHiOISrXItcMrIJK7SNbmGlocu7WmjuFaA/UQvHXU=;
        b=LyxJI54a7aS6aahuK8tjqsI+3mX36WDCDNqP8G0+xINjLjsdsGEUOCNSBE1NQB0r9A
         73PRPl6P6FVHPLYa2wL5AOgtVDMwVzL3m5BlVDPY7l/LypJ5Ry0VKXlxO2YxR5b9/py0
         aB25HwbLUvvY4SMj84BJFGlrbNxQicZCwWpPvE5MVgqAm33bG6PakV32i7+EfXJcbdKq
         uNVT+sCHr5gBSV1Src6OFWyG9hVAyzfj03AuWJ/0h5DY2SFJchXi83YBzbW6+DgfdHgG
         zTu6YFMRtfkNPK5MaUEcI/A+L/4bs55GMkVNqEoLrAgojF4JkVrdbqHevSyox/Uc5Enw
         KBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t0DHiOISrXItcMrIJK7SNbmGlocu7WmjuFaA/UQvHXU=;
        b=L4HI5IZNi/SRZvt6vTYR10MEOs/t83wVazApDLpcZ5PEMl96X5R0CcXcvVEyPdLkPM
         dY6oRTkJH+tGM4KLcBk0Kc1GduskB3dGfs1SGrjYtKfIPCT9XBzOe4fclfZ5Q4KAvILD
         +y+VR52SQtOfLHwiE+ewQihtLo4TNu0WIxA5DGlCKOsNwq21qL0YhBu2JmbG7JAqH2nm
         xbfl5qZMulb1DSID88eFfxe87lEg0y7fXWqAZ6d5HBVk2vLDzOBovugr2w5TlAZopz/A
         eUbSazPyZK4pPrC/1DbSu4pw+5lMZeQl9rtdc6Oz6tBjtLvcv4XEl8KTpFuLu+2GFDDi
         UHVw==
X-Gm-Message-State: APjAAAVJo/Ae68hTDfcYsqh/gE4l06jgN26NMQGXg6ltin0s3gbHn19x
        gf1MYNKkHVeVJE7TDos1rA0KzM6y0HbkBbB9XxU=
X-Google-Smtp-Source: APXvYqzpZ6MXM1sZZcFyRs7iX1/khcpzkLOTHDYjc2b2ymiPQ1xiya5F8HnCwIYFgL8hKFRE/2gjCTkKwbI3k5QjxEM=
X-Received: by 2002:a05:6830:602:: with SMTP id w2mr6176723oti.312.1572554135273;
 Thu, 31 Oct 2019 13:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+E=qVeAR4AFN99ZVy8EZLW6p_8ucTewOdMis37wnpV3DObaGg@mail.gmail.com>
 <20190807115614.phm7sbyae6yajkug@flea> <CA+E=qVdh3MHMsEC9XKe5-7O8fGTHFh76WLOgVf+PZPv7c4JE9w@mail.gmail.com>
 <20190808162628.pthvy3tgf3naj76s@flea> <CA+E=qVeiWoRGn05HpMzx_5yidit4GM18tBrziW5MBo00f_-PKQ@mail.gmail.com>
 <20190812080420.saelmqb36vkelxn4@flea> <CA+E=qVchsqOF_hVD-qBuKwi7PTMYtUR-LE2dD_mpptFJcWE_yw@mail.gmail.com>
 <20190813053905.hu2hyi7fah2vujzz@flea> <CA+E=qVegU8M09tmbxGUaBSoueGU6PRsAtr9XWrc8V8HnCPjULg@mail.gmail.com>
 <CA+E=qVeArUV0u_17ty=HgaU35TwcBfQjSOJf0A5yM6L6+W-0Og@mail.gmail.com>
 <20190925110844.qfm5ris7xeze44th@gilmour> <CAJiuCcfcmkb_BgDcDJziUwoZXAgLN4Bh0GGZKR3NVNRpnFhBEQ@mail.gmail.com>
In-Reply-To: <CAJiuCcfcmkb_BgDcDJziUwoZXAgLN4Bh0GGZKR3NVNRpnFhBEQ@mail.gmail.com>
From:   Vasily Khoruzhick <anarsoul@gmail.com>
Date:   Thu, 31 Oct 2019 13:35:40 -0700
Message-ID: <CA+E=qVeopby6zn1PBsOGb0JjA6-viTN_iXxRnWF6+NGtbZ_BtQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Drop PMU node
To:     =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        "Jared D . McNeill" <jmcneill@netbsd.org>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Harald Geyer <harald@ccbib.org>,
        Robin Murphy <robin.murphy@arm.com>,
        arm-linux <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Oct 31, 2019 at 12:10 PM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com> wrote:
>
> Hi,
>
> Just a remark here but the interrupt are from 152 to 155 SPI.
> But there is an offset of 32 no (remove SGI/PPI)?
> This should be from 120 to 123

I already tried it (and I believe someone already suggested it above),
it doesn't fix PMU interrupts though.

> Regards,
> Cl=C3=A9ment
>
> On Wed, 25 Sep 2019 at 13:09, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Mon, Sep 23, 2019 at 04:55:59PM -0700, Vasily Khoruzhick wrote:
> > > On Mon, Sep 23, 2019 at 4:51 PM Vasily Khoruzhick <anarsoul@gmail.com=
> wrote:
> > > >
> > > > On Mon, Aug 12, 2019 at 10:39 PM Maxime Ripard
> > > > <maxime.ripard@bootlin.com> wrote:
> > > > >
> > > > > On Mon, Aug 12, 2019 at 11:01:51AM -0700, Vasily Khoruzhick wrote=
:
> > > > > > On Mon, Aug 12, 2019 at 1:04 AM Maxime Ripard <maxime.ripard@bo=
otlin.com> wrote:
> > > > > > >
> > > > > > > On Thu, Aug 08, 2019 at 12:59:07PM -0700, Vasily Khoruzhick w=
rote:
> > > > > > > > On Thu, Aug 8, 2019 at 9:26 AM Maxime Ripard <maxime.ripard=
@bootlin.com> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Aug 07, 2019 at 10:36:08AM -0700, Vasily Khoruzhi=
ck wrote:
> > > > > > > > > > On Wed, Aug 7, 2019 at 4:56 AM Maxime Ripard <maxime.ri=
pard@bootlin.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Tue, Aug 06, 2019 at 07:39:26PM -0700, Vasily Khor=
uzhick wrote:
> > > > > > > > > > > > On Tue, Aug 6, 2019 at 2:14 PM Robin Murphy <robin.=
murphy@arm.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > On 2019-08-06 9:52 pm, Vasily Khoruzhick wrote:
> > > > > > > > > > > > > > On Tue, Aug 6, 2019 at 1:19 PM Harald Geyer <ha=
rald@ccbib.org> wrote:
> > > > > > > > > > > > > >>
> > > > > > > > > > > > > >> Vasily Khoruzhick writes:
> > > > > > > > > > > > > >>> On Tue, Aug 6, 2019 at 7:35 AM Robin Murphy <=
robin.murphy@arm.com> wrote:
> > > > > > > > > > > > > >>>>
> > > > > > > > > > > > > >>>> On 06/08/2019 15:01, Vasily Khoruzhick wrote=
:
> > > > > > > > > > > > > >>>>> Looks like PMU in A64 is broken, it generat=
es no interrupts at all and
> > > > > > > > > > > > > >>>>> as result 'perf top' shows no events.
> > > > > > > > > > > > > >>>>
> > > > > > > > > > > > > >>>> Does something like 'perf stat sleep 1' at l=
east count cycles correctly?
> > > > > > > > > > > > > >>>> It could well just be that the interrupt num=
bers are wrong...
> > > > > > > > > > > > > >>>
> > > > > > > > > > > > > >>> Looks like it does, at least result looks pla=
usible:
> > > > > > > > > > > > > >>
> > > > > > > > > > > > > >> I'm using perf stat regularly (cache benchmark=
s) and it works fine.
> > > > > > > > > > > > > >>
> > > > > > > > > > > > > >> Unfortunately I wasn't aware that perf stat is=
 a poor test for
> > > > > > > > > > > > > >> the interrupts part of the node, when I added =
it. So I'm not too
> > > > > > > > > > > > > >> surprised I got it wrong.
> > > > > > > > > > > > > >>
> > > > > > > > > > > > > >> However, it would be unfortunate if the node g=
ot removed completely,
> > > > > > > > > > > > > >> because perf stat would not work anymore. Mayb=
e we can only remove
> > > > > > > > > > > > > >> the interrupts or just fix them even if the HW=
 doesn't work?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I'm not familiar with PMU driver. Is it possibl=
e to get it working
> > > > > > > > > > > > > > without interrupts?
> > > > > > > > > > > > >
> > > > > > > > > > > > > Yup - you get a grumpy message from the driver, i=
t will refuse sampling
> > > > > > > > > > > > > events (the ones which weren't working anyway), a=
nd if you measure
> > > > > > > > > > > > > anything for long enough that a counter overflows=
 you'll get wonky
> > > > > > > > > > > > > results. But for counting hardware events over re=
latively short periods
> > > > > > > > > > > > > it'll still do the job.
> > > > > > > > > > > >
> > > > > > > > > > > > I tried to drop interrupts completely from the node=
 but 'perf top' is
> > > > > > > > > > > > still broken. Though now in different way: it compl=
ains "cycles: PMU
> > > > > > > > > > > > Hardware doesn't support sampling/overflow-interrup=
ts. Try 'perf
> > > > > > > > > > > > stat'"
> > > > > > > > > > >
> > > > > > > > > > > I have no idea if that's the culprit, but what is the=
 state of the
> > > > > > > > > > > 0x09010000 register?
> > > > > > > > > >
> > > > > > > > > > What register is that and how do I check it?
> > > > > > > > >
> > > > > > > > > It's in the CPUX Configuration block, and the bits are la=
belled as CPU
> > > > > > > > > Debug Reset.
> > > > > > > > >
> > > > > > > > > And if you have busybox, you can use devmem.
> > > > > > > >
> > > > > > > > CPUX configuration block is at 0x01700000 according to A64 =
user
> > > > > > > > manual, and particular register you're interested in is at =
0x01700080,
> > > > > > > > its value is 0x1110110F.
> > > > > > > >
> > > > > > > > Bits 16-19 are not defined in user manual and are not set.
> > > > > > >
> > > > > > > Sorry, I somehow thought this was for the H6...
> > > > > > >
> > > > > > > I don't have any idea then :/
> > > > > >
> > > > > > OK, so what should we do? 'perf top'/'perf record' work fine if=
 PMU
> > > > > > node is dropped, but they don't work if PMU node is present (ev=
en with
> > > > > > interrupts dropped). I'd prefer to have 'perf top' and 'perf re=
cord'
> > > > > > working instead of 'perf stat'
> > > > >
> > > > > Well, it doesn't work so we should just remove the node, and if
> > > > > someone wants it back, they should figure it out.
> > > >
> > > > Hey Maxime,
> > > >
> > > > So can you merge this patch?
> > >
> > > Added new Maxime's email to CC
> >
> > Queued as a fix for 5.4, thanks!
> > Maxime
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
