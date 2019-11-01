Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D1FCA9ECF
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 11:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9ECFB217F9
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 11:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n24VmXW/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfKALaZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 07:30:25 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38436 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKALaZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 07:30:25 -0400
Received: by mail-wr1-f67.google.com with SMTP id v9so9365304wrq.5
        for <devicetree@vger.kernel.org>; Fri, 01 Nov 2019 04:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=R4syCX2+rbby40ZaE8PkjBwbJN5LlvdrVrHq+IDW1jU=;
        b=n24VmXW/yTXjtCdA3Z1LUPWdyiOR0bcu7P9XIcl3wtpiguJwpGnd9fT8UkKEGhCmMc
         GA/xtbtt1+v6DrROZxBAu3SN9A1eKIrPylD8W4hPw0PauGppqHNFsQwZKt8cLXrt/EM4
         fFO5Ztn+07HB5TUTUHp5bgontyK2W0sN7PXc5Ieog5bs9qBcJGH2ZukuhtN0a9KMvINn
         lcSCUiOdlKBhN/ry941KF6PuphPp643x8C7AiJ/bhcssieElDw0m18JG4MmR3Ge1FhDV
         cZ7yzoSlsAFEBeEntGn3XmvbXHZqV7KKQgBeQVmZzIeGS3dawa+o3C/CORFHkwxVwfge
         DdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R4syCX2+rbby40ZaE8PkjBwbJN5LlvdrVrHq+IDW1jU=;
        b=tojLU5Bdvt1xolIgBqTSIl5ZVP0EBI4m0dHUA9W2+9uKlxvp3fct8xk8N1IJWjqRY/
         n2Df1vfBSbuTl5b2fk3D/PUaGoCZf1E2S8AX8EL368UtWDMvVRy3JfWDfxHMGKS6vAaf
         O2KRVcWZi8twVM8f3r3EKMKGKIN2oeBF0IBOufsC4MeJ3pEnVYa4RqiuNDDNiGx89wJz
         3TjSqVzhNf592tMiyXvfynnnAB+yDW4pYvOL2E8g0ls6uqESh2L0bcUZdjhDIe7bprXB
         ewEFDvuyeVfaFPc0ExPLzR2Re4rOvC9I6Azy+MgLJ831GPQP7D2FYHBMuwH2W8bVtgWZ
         LVwQ==
X-Gm-Message-State: APjAAAUgWF4y5js4nx9jETKwUuir7wuxFShp0jDlITwczSonLN9XuaqT
        +ffUV1w8DwWvduCr4MbRfBEni7Eulfh1md0/3e4=
X-Google-Smtp-Source: APXvYqyM/mqK/VWcCqRMAYxiKZnA437b7QfAY99b1X5lSRZ/Yi9364xcnYIHibsLYRCYUI2OcnfEaOxMv31oFWnTZcM=
X-Received: by 2002:a5d:63c1:: with SMTP id c1mr9800942wrw.332.1572607821817;
 Fri, 01 Nov 2019 04:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+E=qVeAR4AFN99ZVy8EZLW6p_8ucTewOdMis37wnpV3DObaGg@mail.gmail.com>
 <20190807115614.phm7sbyae6yajkug@flea> <CA+E=qVdh3MHMsEC9XKe5-7O8fGTHFh76WLOgVf+PZPv7c4JE9w@mail.gmail.com>
 <20190808162628.pthvy3tgf3naj76s@flea> <CA+E=qVeiWoRGn05HpMzx_5yidit4GM18tBrziW5MBo00f_-PKQ@mail.gmail.com>
 <20190812080420.saelmqb36vkelxn4@flea> <CA+E=qVchsqOF_hVD-qBuKwi7PTMYtUR-LE2dD_mpptFJcWE_yw@mail.gmail.com>
 <20190813053905.hu2hyi7fah2vujzz@flea> <CA+E=qVegU8M09tmbxGUaBSoueGU6PRsAtr9XWrc8V8HnCPjULg@mail.gmail.com>
 <CA+E=qVeArUV0u_17ty=HgaU35TwcBfQjSOJf0A5yM6L6+W-0Og@mail.gmail.com>
 <20190925110844.qfm5ris7xeze44th@gilmour> <CAJiuCcfcmkb_BgDcDJziUwoZXAgLN4Bh0GGZKR3NVNRpnFhBEQ@mail.gmail.com>
 <CA+E=qVeopby6zn1PBsOGb0JjA6-viTN_iXxRnWF6+NGtbZ_BtQ@mail.gmail.com>
In-Reply-To: <CA+E=qVeopby6zn1PBsOGb0JjA6-viTN_iXxRnWF6+NGtbZ_BtQ@mail.gmail.com>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Fri, 1 Nov 2019 12:30:10 +0100
Message-ID: <CAJiuCcdZfbO+s2L-PcKA4PEm8B8=niYMO1w1nLVQ9hzq6Fjv=A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Drop PMU node
To:     Vasily Khoruzhick <anarsoul@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>
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

Hi

On Thu, 31 Oct 2019 at 21:35, Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> On Thu, Oct 31, 2019 at 12:10 PM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmai=
l.com> wrote:
> >
> > Hi,
> >
> > Just a remark here but the interrupt are from 152 to 155 SPI.
> > But there is an offset of 32 no (remove SGI/PPI)?
> > This should be from 120 to 123
>
> I already tried it (and I believe someone already suggested it above),
> it doesn't fix PMU interrupts though.

Ok thanks for the confirmation.

Made a research about the PMU for A64 and found that Andre Przywara
made a patch to enable it:
https://gist.github.com/apritzel/d025abaa1425fcaf5991b5ffcf18a0a3

Maybe he can confirm or not the issue on A64 ?

Regards,
Cl=C3=A9ment

>
> > Regards,
> > Cl=C3=A9ment
> >
> > On Wed, 25 Sep 2019 at 13:09, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Mon, Sep 23, 2019 at 04:55:59PM -0700, Vasily Khoruzhick wrote:
> > > > On Mon, Sep 23, 2019 at 4:51 PM Vasily Khoruzhick <anarsoul@gmail.c=
om> wrote:
> > > > >
> > > > > On Mon, Aug 12, 2019 at 10:39 PM Maxime Ripard
> > > > > <maxime.ripard@bootlin.com> wrote:
> > > > > >
> > > > > > On Mon, Aug 12, 2019 at 11:01:51AM -0700, Vasily Khoruzhick wro=
te:
> > > > > > > On Mon, Aug 12, 2019 at 1:04 AM Maxime Ripard <maxime.ripard@=
bootlin.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Aug 08, 2019 at 12:59:07PM -0700, Vasily Khoruzhick=
 wrote:
> > > > > > > > > On Thu, Aug 8, 2019 at 9:26 AM Maxime Ripard <maxime.ripa=
rd@bootlin.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Wed, Aug 07, 2019 at 10:36:08AM -0700, Vasily Khoruz=
hick wrote:
> > > > > > > > > > > On Wed, Aug 7, 2019 at 4:56 AM Maxime Ripard <maxime.=
ripard@bootlin.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Tue, Aug 06, 2019 at 07:39:26PM -0700, Vasily Kh=
oruzhick wrote:
> > > > > > > > > > > > > On Tue, Aug 6, 2019 at 2:14 PM Robin Murphy <robi=
n.murphy@arm.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On 2019-08-06 9:52 pm, Vasily Khoruzhick wrote:
> > > > > > > > > > > > > > > On Tue, Aug 6, 2019 at 1:19 PM Harald Geyer <=
harald@ccbib.org> wrote:
> > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > >> Vasily Khoruzhick writes:
> > > > > > > > > > > > > > >>> On Tue, Aug 6, 2019 at 7:35 AM Robin Murphy=
 <robin.murphy@arm.com> wrote:
> > > > > > > > > > > > > > >>>>
> > > > > > > > > > > > > > >>>> On 06/08/2019 15:01, Vasily Khoruzhick wro=
te:
> > > > > > > > > > > > > > >>>>> Looks like PMU in A64 is broken, it gener=
ates no interrupts at all and
> > > > > > > > > > > > > > >>>>> as result 'perf top' shows no events.
> > > > > > > > > > > > > > >>>>
> > > > > > > > > > > > > > >>>> Does something like 'perf stat sleep 1' at=
 least count cycles correctly?
> > > > > > > > > > > > > > >>>> It could well just be that the interrupt n=
umbers are wrong...
> > > > > > > > > > > > > > >>>
> > > > > > > > > > > > > > >>> Looks like it does, at least result looks p=
lausible:
> > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > >> I'm using perf stat regularly (cache benchma=
rks) and it works fine.
> > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > >> Unfortunately I wasn't aware that perf stat =
is a poor test for
> > > > > > > > > > > > > > >> the interrupts part of the node, when I adde=
d it. So I'm not too
> > > > > > > > > > > > > > >> surprised I got it wrong.
> > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > >> However, it would be unfortunate if the node=
 got removed completely,
> > > > > > > > > > > > > > >> because perf stat would not work anymore. Ma=
ybe we can only remove
> > > > > > > > > > > > > > >> the interrupts or just fix them even if the =
HW doesn't work?
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > I'm not familiar with PMU driver. Is it possi=
ble to get it working
> > > > > > > > > > > > > > > without interrupts?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Yup - you get a grumpy message from the driver,=
 it will refuse sampling
> > > > > > > > > > > > > > events (the ones which weren't working anyway),=
 and if you measure
> > > > > > > > > > > > > > anything for long enough that a counter overflo=
ws you'll get wonky
> > > > > > > > > > > > > > results. But for counting hardware events over =
relatively short periods
> > > > > > > > > > > > > > it'll still do the job.
> > > > > > > > > > > > >
> > > > > > > > > > > > > I tried to drop interrupts completely from the no=
de but 'perf top' is
> > > > > > > > > > > > > still broken. Though now in different way: it com=
plains "cycles: PMU
> > > > > > > > > > > > > Hardware doesn't support sampling/overflow-interr=
upts. Try 'perf
> > > > > > > > > > > > > stat'"
> > > > > > > > > > > >
> > > > > > > > > > > > I have no idea if that's the culprit, but what is t=
he state of the
> > > > > > > > > > > > 0x09010000 register?
> > > > > > > > > > >
> > > > > > > > > > > What register is that and how do I check it?
> > > > > > > > > >
> > > > > > > > > > It's in the CPUX Configuration block, and the bits are =
labelled as CPU
> > > > > > > > > > Debug Reset.
> > > > > > > > > >
> > > > > > > > > > And if you have busybox, you can use devmem.
> > > > > > > > >
> > > > > > > > > CPUX configuration block is at 0x01700000 according to A6=
4 user
> > > > > > > > > manual, and particular register you're interested in is a=
t 0x01700080,
> > > > > > > > > its value is 0x1110110F.
> > > > > > > > >
> > > > > > > > > Bits 16-19 are not defined in user manual and are not set=
.
> > > > > > > >
> > > > > > > > Sorry, I somehow thought this was for the H6...
> > > > > > > >
> > > > > > > > I don't have any idea then :/
> > > > > > >
> > > > > > > OK, so what should we do? 'perf top'/'perf record' work fine =
if PMU
> > > > > > > node is dropped, but they don't work if PMU node is present (=
even with
> > > > > > > interrupts dropped). I'd prefer to have 'perf top' and 'perf =
record'
> > > > > > > working instead of 'perf stat'
> > > > > >
> > > > > > Well, it doesn't work so we should just remove the node, and if
> > > > > > someone wants it back, they should figure it out.
> > > > >
> > > > > Hey Maxime,
> > > > >
> > > > > So can you merge this patch?
> > > >
> > > > Added new Maxime's email to CC
> > >
> > > Queued as a fix for 5.4, thanks!
> > > Maxime
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
