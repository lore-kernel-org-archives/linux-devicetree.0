Return-Path: <SRS0=UR7X=ZK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14421C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 16:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD2992067D
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 16:08:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LcnAEJQf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfKRQIy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 Nov 2019 11:08:54 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:36652 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfKRQIy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 Nov 2019 11:08:54 -0500
Received: by mail-il1-f195.google.com with SMTP id s75so16500220ilc.3
        for <devicetree@vger.kernel.org>; Mon, 18 Nov 2019 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vGDUmknBAHHgnUGD6G/YP0BMVQ+t0TVHx52Qz9PZmwY=;
        b=LcnAEJQfcR+16B5xAU1duNVJ5mC51SCgsYmRJoEQik6hAY9yeHjfDpdnU6mZX/7YZS
         5b7TwjIsbX/45vF5T4i3YutHXRm2eLAe3l1Zd/IRiYEOPrNzYd5CdZdYEiPHgb8YpspE
         uMlrBkxoaQht9bPslaYl+l5boo7gzXta3VnnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vGDUmknBAHHgnUGD6G/YP0BMVQ+t0TVHx52Qz9PZmwY=;
        b=N5eycc2jfdzxuAzoYdDUesrQeiMVwyY9kR3uALmRihlEaZ28xp2vinxUd08z/DYEP6
         Tz3crQIOTEXJLUQnfI56977FFjLk9sP58yrqSckBImIAm3LrfkTvf1GjZTZ5dzvPsBDY
         8V8mHdlZf1QjzzoONeBsBgMeWaNt/xvejgLIrkdkhKN/ZTF0f7b2YrRd3RhYBvZ3nxuk
         mo5RBS/CbA/BJbk+qWz4pgrksxXy2wl1nYbrIavAKH2rUvnq80upwrl1cPN5qvhiHobY
         ftfbnlnpI8ILFY4XJochHT2t5xrZOFBL6UzGIIlknSY6se8b7KNOqmWTWqVIJi8tIHMr
         KtCg==
X-Gm-Message-State: APjAAAU2lR/IUWELwiCz4XFlAbCFtqBi0cdztBp0UnWpGMuN7EAnUCQ9
        MdefIxzXmxwOvHROpxrKzmoJ6il6plQ=
X-Google-Smtp-Source: APXvYqxnRFbFFjZIvyzS8ILGkaE9JVhfxkSiFkPlx0jWZ6zrBlQb5VaLA0tSk87BuJ8njYrjpJOO/Q==
X-Received: by 2002:a92:5d49:: with SMTP id r70mr16966528ilb.257.1574093331567;
        Mon, 18 Nov 2019 08:08:51 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id d11sm4528980ill.17.2019.11.18.08.08.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2019 08:08:49 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id j20so8317858ioo.11
        for <devicetree@vger.kernel.org>; Mon, 18 Nov 2019 08:08:49 -0800 (PST)
X-Received: by 2002:a6b:a0c:: with SMTP id z12mr5762767ioi.142.1574093329092;
 Mon, 18 Nov 2019 08:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20190301153348.29870-1-christoph.muellner@theobroma-systems.com>
 <2766673.iMURPl8gB5@phil> <69472c06-8b21-c3d8-acad-1a0a292c0fa2@fivetechno.de>
 <3460135.SDF8zhHPq4@diego>
In-Reply-To: <3460135.SDF8zhHPq4@diego>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 18 Nov 2019 08:08:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VnjyQJpRcW6P1f4+ZrSOzAe2Cnoej=it4aCz+F_ozukw@mail.gmail.com>
Message-ID: <CAD=FV=VnjyQJpRcW6P1f4+ZrSOzAe2Cnoej=it4aCz+F_ozukw@mail.gmail.com>
Subject: Re: arm64: dts: rockchip: Disable HS400 for mmc on rk3399-roc-pc
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Markus Reichl <m.reichl@fivetechno.de>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Tony Xie <tony.xie@rock-chips.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Vicente Bergas <vicencb@gmail.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Klaus Goger <klaus.goger@theobroma-systems.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
        Randy Li <ayaka@soulik.info>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Christoph Muellner <christoph.muellner@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,


On Fri, Nov 15, 2019 at 3:19 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Markus,
>
> Am Freitag, 15. November 2019, 11:37:58 CET schrieb Markus Reichl:
> > Am 14.11.19 um 14:10 schrieb Heiko Stuebner:
> > > $subject is missing the [PATCH] prefix
> > will fix.
>
> no need to resend just for this ... just to keep in mind for future patch=
es ;-)
>
>
> > > Am Montag, 11. November 2019, 10:51:04 CET schrieb Markus Reichl:
> > >> Working with rootfs on two 128GB mmcs on rk3399-roc-pc.
> > >>
> > >> One (mmc name 128G72, one screw hole) works fine in HS400 mode.
> > >> Other (mmc name DJNB4R, firefly on pcb, two screw holes) gets lots o=
f
> > >> mmc1: "running CQE recovery", even hangs with damaged fs,
> > >> when running under heavy load, e.g. compiling kernel.
> > >> Both run fine with HS200.
> > >>
> > >> Disabling CQ with patch mmc: core: Add MMC Command Queue Support ker=
nel parameter [0] did not help.
> > >> [0] https://gitlab.com/ayufan-repos/rock64/linux-mainline-kernel/com=
mit/54e264154b87dfe32a8359b2726e2d5611adbaf3
> > >
> > > I'm hoping for some input from other people in Cc but your mail heade=
rs
> > > also referenced the drive-impendance series from Christoph [0], which
> > > it seems we need to poke the phy maintainer again.
> > >
> > > Did you check if changing the impedance helped (like the signal dampe=
ning
> > > Philipp described in one of the replies there).
> >
> > checked with
> >
> > &emmc_phy {
> > +       drive-impedance-ohm =3D <33>;
> >
> > gives no improvement:
>
> That is sad ... I guess we really should disable hs400 then ...
> that may give others more incentive to dive deeper ;-)

Just out of curiosity, is the problem with the strobe line, or with
hs400?  Have you tried using the solution from "rk3399-gru.dtsi"?
Namely:

        /*
         * Signal integrity isn't great at 200 MHz and 150 MHz (DDR) gives =
the
         * same (or nearly the same) performance for all eMMC that are inte=
nded
         * to be used.
         */
        assigned-clock-rates =3D <150000000>;

IIRC hs400 on rk3399 was a bit iffy but running at 150 MHz made it
much more reliable and still gave you 300 MB/s transfer rate (so much
better than hs200).  In reality many eMMC chips can't do > 300 MB/s
anyway.

-Doug
