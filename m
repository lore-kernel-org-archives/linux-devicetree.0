Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F606C2BB85
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:31:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E86B1208E4
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:31:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633286AbgDPLap (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 07:30:45 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37281 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505899AbgDPLJI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 07:09:08 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N4A1h-1jGgZn1t8T-0103T1; Thu, 16 Apr 2020 13:07:14 +0200
Received: by mail-qk1-f174.google.com with SMTP id y3so20748368qky.8;
        Thu, 16 Apr 2020 04:07:14 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ0HtBnhGYMaYQOLJpCyPgjWJpQF/FPXuoNeABZ+xQ43q/4+0e/
        iwuzvD7bQRjpZ9z2IuUym61FN3Sx5xYhi/YAW/c=
X-Google-Smtp-Source: APiQypK4+pWIjTlcQKHWs83hDUiq9HrROe6p4sKwqSeztDfxIRma7taMpjWbk4MOI+E9EtZHMoCq/s3VDhbpWUliCGE=
X-Received: by 2002:a37:851:: with SMTP id 78mr31161821qki.352.1587035233142;
 Thu, 16 Apr 2020 04:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <1583226206-19758-1-git-send-email-abel.vesa@nxp.com> <CAK8P3a3FLRotVmMnBAyBKFMbXeEx760S-Cvqr19VPMi81PKJgw@mail.gmail.com>
In-Reply-To: <CAK8P3a3FLRotVmMnBAyBKFMbXeEx760S-Cvqr19VPMi81PKJgw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 16 Apr 2020 13:06:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a26JS4FVt5wiaRQahF+OJZp9Ot84o8GSth9Rk2skkEMSQ@mail.gmail.com>
Message-ID: <CAK8P3a26JS4FVt5wiaRQahF+OJZp9Ot84o8GSth9Rk2skkEMSQ@mail.gmail.com>
Subject: Re: [RFC 00/11] Add generic MFD i.MX mix and audiomix support
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Anson Huang <anson.huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:XDrsoNce09dQF4v/GnqEBmnqKLXmtj6TBeZwkb0Q1p/Uh3G4zU2
 0k3IovXzNymJfDpYP+paFT5/eWoSFAeiBFdDU4Rni9XRQeX3O1+NLIdTwj2Pjh0XkF+TDll
 1IlwD9gwjHnD+odPwajh6GbLWG891MKN9Rx98amEyN7OMvBE52hiFWSTxA3GU6fNMtSEwOp
 pw5aRLFhsd4iHpP797jPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UrU3V50W3HM=:osuXuGqVgUdq7A200W2C78
 yvOogCC4ycYp8D/QQ51stxlPHzIbJ90W4XRdEyRUCdnqexIEE7FDxlI4GsR5V8NIIitmHuVbL
 K6P3HN+e2h2+LYjnjEvvPaKan3jh7ofMgum0GykZxVHbcS1LIXWD9fYNdA+FwceONMm+gJGpu
 fpjzfLg+HRuiW3GBZN06IGzRx9ssOTlYLy1WkdG5dYFkkQc7hd11NvNJDi5Xa17VaSgQ+RCFK
 DvpPp3QRxUcEocqxNER+D4HaduDW2UN65RjNDYp7GYKEZaMsznupKpvzsTI7jYxAyXebpF2Q8
 Pk2fHP6MnqQCoXIYCHD7uByrmvG51hnkkpoAG6YAsXIhCXCbg3lqm0CAJSRTEpFoYabab786w
 vBwEL528pv5zE8UaQXjFreu75DB2kGzxfZgQTEmnkOwZiXvlBrP+6LZugTdybEOIyYF4q/+ZI
 Ux26wrxjcQIy8pfywxkfCBy34rMgdt0C1hA+duNUz7PLTIQqEZ8AgL+5XDpG3Tv70Hlu3194z
 nov/DedOT2DQGVkMbkQe7QR5lQvisEw53LAyeayjfEVhm71WcS22yb91gPrxLYYQW09nbteD4
 XjjM3jPLRYthG9et4jy72VQ6FJkbt3hejBbu29Qk5f3uLT6DiWXPOxyL6yKvGW6hZwh8WWz4V
 TS0WRoeoagrV1zVFzyX0H/DS2yCp33jRNyOKAUa6I7v6v0f3oneYxFpTs3RWIZVvbmMZvlfx4
 WGxFBveJi9eps4+XhNmzT9ZHR7wEcaVAtlBYXhRHruKZF0dCKnije2DUlAPRAWvUisoNF6uhD
 0idC/tapiEphpZHxGmea2IpZEx9KYy8jkC0R5Oq+ItAj6U3zzQ=
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 16, 2020 at 1:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Mar 3, 2020 at 10:04 AM Abel Vesa <abel.vesa@nxp.com> wrote:
> >
> > The i.MX8MP has some new IPs called mixes. They are formed usually by some
> > GPRs that can be split into different functionalities. The first example
> > here is the audiomix which has dedicated registers that can be registered
> > as a clock controller and some other registers that can be registered as
> > a reset controller, plus some dedicated ones that will be registered as
> > syscon and used by each dedicated audio IP.
> >
> > More mixes to be following the same structure are to come, like hdmimix,
> > dispmix and mediamix. They will all be populated and registered by the MFD
> > imx-mix generic driver.
>
> Can you enumerate what functionality is in each one?
>
> I'm not convinced that using an MFD driver is the best solution here,
> compared to e.g. a clk driver with a few extra bits in it, if most of the
> code for the child drivers ends up being for the clk subsystem.
>
> Lee suggested maybe having a generic (platform independent) driver
> for it, which may help here, as it would let others share the trivial
> mfd portion.
>
> Another option that we are using on several platforms today is to
> have a single syscon node and have other drivers that reference
> that one using a phandle to get at the regmap.

Sorry I replied to the wrong thread, I meant to reply to the v3 version.

       Arnd
