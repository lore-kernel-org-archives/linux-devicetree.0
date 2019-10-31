Return-Path: <SRS0=y4GH=YY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD034CA9ECB
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 19:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96BE42080F
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 19:10:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CH4+kRM7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbfJaTKb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 31 Oct 2019 15:10:31 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53366 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbfJaTKb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 Oct 2019 15:10:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id n7so7117129wmc.3
        for <devicetree@vger.kernel.org>; Thu, 31 Oct 2019 12:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jmn2P1ld/NeoSnxg7DOmQ98R2sPr7Eaq2YhqfnjLpSs=;
        b=CH4+kRM7vdK1gdk6cFx9eWuWLEa5CnW1s/j51KQGHPAntwlwEXDzPQAaHQzhVhtT3b
         SnoQuscBwdZxOHLdTLp+VvZvGQI/nwKGRdb9tBUfc02zP4vWmS1Nn9SVrzdzs96hDP7r
         UXWe5pN0ERUBiFgUL5KU/JGcauynTOKyb3JLxwFuylDyq/mfxQLHsdoZ/BMK2yuaESij
         E1x4gYrPcmtwu8TTPFDu7FkaXXu7jAuFqSmXOswa3a8p04UX8YO0toA8AAumCVDK8Tql
         UAZKSbZ7WDBoEwyaD80rA5/KoMAF6MHq2eyEyK6xT4acDJf1P/zvlDjRLvm6EWB6qXpn
         P1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jmn2P1ld/NeoSnxg7DOmQ98R2sPr7Eaq2YhqfnjLpSs=;
        b=DQGhBFv9aplNXkcgYSOrf0d3S0udBrQUM75fMRqhTo1AUhF0nis14Jje27S9fAxAkG
         oxEmU32yvy2q4z2rff1AjlTVHgvkcNZ8m0GhTNbKvPA/Gt98tIrY0p6z612a52JnLRJh
         0a4JaIMZx/ODYf1QG11RSeAuh8H98mZE7q5T5QGK6TfTD4z8pHil75LDQHXguEYvlHF0
         +VBMvhKpGZRkAvAlyBIUmT3UwgzUhgYjRlmERTu+DiSUN+TGpIyJy9Ku53DfSPHl2FqL
         hQTCzF3axIoOVdgn3VcMs+PUUgX/hab/2sqqkW/kl9XkSyAwXH+qr8goDZOHisuTwFsJ
         VwOw==
X-Gm-Message-State: APjAAAUSNaqeITj0tJMsALpRWZZmBZyCKAAKmI7MPIuxc48VV7Z95CNT
        8ZbPNiPrvKN1iKrytfUut68Rksyh9qruQkD0zPc=
X-Google-Smtp-Source: APXvYqzD6tyzrMQtB5mYa7a1zAvNnZlKCvaIwiMX0TlT5De5CqiNFj8/i0WW76jPnlanpmKm1dLU9j4TzA2JBtH6+5c=
X-Received: by 2002:a1c:a512:: with SMTP id o18mr6335335wme.4.1572549027764;
 Thu, 31 Oct 2019 12:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <CA+E=qVeAR4AFN99ZVy8EZLW6p_8ucTewOdMis37wnpV3DObaGg@mail.gmail.com>
 <20190807115614.phm7sbyae6yajkug@flea> <CA+E=qVdh3MHMsEC9XKe5-7O8fGTHFh76WLOgVf+PZPv7c4JE9w@mail.gmail.com>
 <20190808162628.pthvy3tgf3naj76s@flea> <CA+E=qVeiWoRGn05HpMzx_5yidit4GM18tBrziW5MBo00f_-PKQ@mail.gmail.com>
 <20190812080420.saelmqb36vkelxn4@flea> <CA+E=qVchsqOF_hVD-qBuKwi7PTMYtUR-LE2dD_mpptFJcWE_yw@mail.gmail.com>
 <20190813053905.hu2hyi7fah2vujzz@flea> <CA+E=qVegU8M09tmbxGUaBSoueGU6PRsAtr9XWrc8V8HnCPjULg@mail.gmail.com>
 <CA+E=qVeArUV0u_17ty=HgaU35TwcBfQjSOJf0A5yM6L6+W-0Og@mail.gmail.com> <20190925110844.qfm5ris7xeze44th@gilmour>
In-Reply-To: <20190925110844.qfm5ris7xeze44th@gilmour>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Thu, 31 Oct 2019 20:10:16 +0100
Message-ID: <CAJiuCcfcmkb_BgDcDJziUwoZXAgLN4Bh0GGZKR3NVNRpnFhBEQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Drop PMU node
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Vasily Khoruzhick <anarsoul@gmail.com>,
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

Hi,

Just a remark here but the interrupt are from 152 to 155 SPI.
But there is an offset of 32 no (remove SGI/PPI)?
This should be from 120 to 123

Regards,
Cl=C3=A9ment

On Wed, 25 Sep 2019 at 13:09, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Sep 23, 2019 at 04:55:59PM -0700, Vasily Khoruzhick wrote:
> > On Mon, Sep 23, 2019 at 4:51 PM Vasily Khoruzhick <anarsoul@gmail.com> =
wrote:
> > >
> > > On Mon, Aug 12, 2019 at 10:39 PM Maxime Ripard
> > > <maxime.ripard@bootlin.com> wrote:
> > > >
> > > > On Mon, Aug 12, 2019 at 11:01:51AM -0700, Vasily Khoruzhick wrote:
> > > > > On Mon, Aug 12, 2019 at 1:04 AM Maxime Ripard <maxime.ripard@boot=
lin.com> wrote:
> > > > > >
> > > > > > On Thu, Aug 08, 2019 at 12:59:07PM -0700, Vasily Khoruzhick wro=
te:
> > > > > > > On Thu, Aug 8, 2019 at 9:26 AM Maxime Ripard <maxime.ripard@b=
ootlin.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Aug 07, 2019 at 10:36:08AM -0700, Vasily Khoruzhick=
 wrote:
> > > > > > > > > On Wed, Aug 7, 2019 at 4:56 AM Maxime Ripard <maxime.ripa=
rd@bootlin.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Tue, Aug 06, 2019 at 07:39:26PM -0700, Vasily Khoruz=
hick wrote:
> > > > > > > > > > > On Tue, Aug 6, 2019 at 2:14 PM Robin Murphy <robin.mu=
rphy@arm.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On 2019-08-06 9:52 pm, Vasily Khoruzhick wrote:
> > > > > > > > > > > > > On Tue, Aug 6, 2019 at 1:19 PM Harald Geyer <hara=
ld@ccbib.org> wrote:
> > > > > > > > > > > > >>
> > > > > > > > > > > > >> Vasily Khoruzhick writes:
> > > > > > > > > > > > >>> On Tue, Aug 6, 2019 at 7:35 AM Robin Murphy <ro=
bin.murphy@arm.com> wrote:
> > > > > > > > > > > > >>>>
> > > > > > > > > > > > >>>> On 06/08/2019 15:01, Vasily Khoruzhick wrote:
> > > > > > > > > > > > >>>>> Looks like PMU in A64 is broken, it generates=
 no interrupts at all and
> > > > > > > > > > > > >>>>> as result 'perf top' shows no events.
> > > > > > > > > > > > >>>>
> > > > > > > > > > > > >>>> Does something like 'perf stat sleep 1' at lea=
st count cycles correctly?
> > > > > > > > > > > > >>>> It could well just be that the interrupt numbe=
rs are wrong...
> > > > > > > > > > > > >>>
> > > > > > > > > > > > >>> Looks like it does, at least result looks plaus=
ible:
> > > > > > > > > > > > >>
> > > > > > > > > > > > >> I'm using perf stat regularly (cache benchmarks)=
 and it works fine.
> > > > > > > > > > > > >>
> > > > > > > > > > > > >> Unfortunately I wasn't aware that perf stat is a=
 poor test for
> > > > > > > > > > > > >> the interrupts part of the node, when I added it=
. So I'm not too
> > > > > > > > > > > > >> surprised I got it wrong.
> > > > > > > > > > > > >>
> > > > > > > > > > > > >> However, it would be unfortunate if the node got=
 removed completely,
> > > > > > > > > > > > >> because perf stat would not work anymore. Maybe =
we can only remove
> > > > > > > > > > > > >> the interrupts or just fix them even if the HW d=
oesn't work?
> > > > > > > > > > > > >
> > > > > > > > > > > > > I'm not familiar with PMU driver. Is it possible =
to get it working
> > > > > > > > > > > > > without interrupts?
> > > > > > > > > > > >
> > > > > > > > > > > > Yup - you get a grumpy message from the driver, it =
will refuse sampling
> > > > > > > > > > > > events (the ones which weren't working anyway), and=
 if you measure
> > > > > > > > > > > > anything for long enough that a counter overflows y=
ou'll get wonky
> > > > > > > > > > > > results. But for counting hardware events over rela=
tively short periods
> > > > > > > > > > > > it'll still do the job.
> > > > > > > > > > >
> > > > > > > > > > > I tried to drop interrupts completely from the node b=
ut 'perf top' is
> > > > > > > > > > > still broken. Though now in different way: it complai=
ns "cycles: PMU
> > > > > > > > > > > Hardware doesn't support sampling/overflow-interrupts=
. Try 'perf
> > > > > > > > > > > stat'"
> > > > > > > > > >
> > > > > > > > > > I have no idea if that's the culprit, but what is the s=
tate of the
> > > > > > > > > > 0x09010000 register?
> > > > > > > > >
> > > > > > > > > What register is that and how do I check it?
> > > > > > > >
> > > > > > > > It's in the CPUX Configuration block, and the bits are labe=
lled as CPU
> > > > > > > > Debug Reset.
> > > > > > > >
> > > > > > > > And if you have busybox, you can use devmem.
> > > > > > >
> > > > > > > CPUX configuration block is at 0x01700000 according to A64 us=
er
> > > > > > > manual, and particular register you're interested in is at 0x=
01700080,
> > > > > > > its value is 0x1110110F.
> > > > > > >
> > > > > > > Bits 16-19 are not defined in user manual and are not set.
> > > > > >
> > > > > > Sorry, I somehow thought this was for the H6...
> > > > > >
> > > > > > I don't have any idea then :/
> > > > >
> > > > > OK, so what should we do? 'perf top'/'perf record' work fine if P=
MU
> > > > > node is dropped, but they don't work if PMU node is present (even=
 with
> > > > > interrupts dropped). I'd prefer to have 'perf top' and 'perf reco=
rd'
> > > > > working instead of 'perf stat'
> > > >
> > > > Well, it doesn't work so we should just remove the node, and if
> > > > someone wants it back, they should figure it out.
> > >
> > > Hey Maxime,
> > >
> > > So can you merge this patch?
> >
> > Added new Maxime's email to CC
>
> Queued as a fix for 5.4, thanks!
> Maxime
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
