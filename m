Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_TVD_FUZZY_SECURITIES,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8705AC43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 21:28:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A7CA21D79
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 21:28:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxOTVPwD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbfKGV2l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 16:28:41 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:43251 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfKGV2l (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 16:28:41 -0500
Received: by mail-il1-f195.google.com with SMTP id r9so3173885ilq.10
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 13:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rEMu6Z7VX863Rke2ojvhLssySQQ5z0bSXubNYEOHlJU=;
        b=QxOTVPwDWM16plTYel4mnlBlwgHtfGmXJCoUkualToF7lFhIFLWrWgnzShSwzXMJji
         wLbssLv3wE35ENpwLYwzl890KDa2yqtlA2UbzZmY4/vMmqOJwW7TtGI9s3/c2ycnWMfX
         HiQVW+OsJcq96qC0lt5PYklfb1OQomvKEw29AI2T70b0+6PDyBQIdHH/Bp74gpISzoF4
         2rnjn/rYOalDRZgVkG71jC1Pq6FjvcPX45BQW19BMS+ECzCta7WHF19YnQX2hIcv8QnB
         Wuy2VVK7kD1qt2niwuOYrwxpZOiT0qGHcuMaZ/vtnddLqOAleKYA4/1xEpLB2i2HlAYG
         NsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rEMu6Z7VX863Rke2ojvhLssySQQ5z0bSXubNYEOHlJU=;
        b=LZuuvFETpOlSVGZP7JwIs9Zl4meazoXTHWmxEx93pT8LCy9eMhLe8VwrDfuimHvhEA
         6DUztmK6g1YUgnw48yfWHPINmoqWo5L9lJGL08Kee+arni4AHSkWF6iwC4VXjCwTBPAz
         zr3KhRXDsZJBcMZ0jNz22h1Mx98rAx7OjJ3nq5YdenMFarkG7QYr/CIA+ZYpZlGGl/Hh
         tShVGlOAPwy5fhcx80zQRT9YKcFW2y2wjXaXd+cOP79968+ZQh6FWyCGoAB+sTWfWUe9
         o/rRxF8jULlH1cKCOrk8E2k0zDsqNbys3GutqUquxzA4dtcn72sUPXMrl1Q4pM4dtifq
         Rg3g==
X-Gm-Message-State: APjAAAW+uK7qquHr0VCCBCCVi7Aua8zqdNscXeQr1uaiSOO0qdvFKGGD
        hqqzu7GuY2PfLwpyC2GfgBZwJTSdgdSsa00CfEM=
X-Google-Smtp-Source: APXvYqxqXdC5wMzXu9l7IjmuOgyYDDYV+cCJ9yQ93G9C6+FCBQlDMahhpSf7fPyOHEq/PxMVrBvRpemMBiRJh4l0ojQ=
X-Received: by 2002:a05:6e02:c2c:: with SMTP id q12mr7622748ilg.205.1573162120183;
 Thu, 07 Nov 2019 13:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20190417053211.2195-1-ping.bai@nxp.com> <AM0PR04MB42116FEB1EE2CAE68A1CAA8980250@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <1555503195.2317.19.camel@pengutronix.de> <VI1PR04MB55330105F4839FCF98B7CFC0EE250@VI1PR04MB5533.eurprd04.prod.outlook.com>
 <68aaace3-f66e-b4b8-30a0-57b8b66a7524@arm.com> <VI1PR04MB5533A1F87436C0839A772D03EE250@VI1PR04MB5533.eurprd04.prod.outlook.com>
 <20190418144330.GD7770@e107155-lin>
In-Reply-To: <20190418144330.GD7770@e107155-lin>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 7 Nov 2019 15:28:29 -0600
Message-ID: <CAHCN7xKK3zWE9i24prauPw0DSNTjASsMgDYY8w3OBJ+hb2y-sg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add power domain driver support for i.mx8m family
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Leonard Crestez <leonard.crestez@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Peng Fan <peng.fan@nxp.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Jacky Bai <ping.bai@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        =?UTF-8?Q?Cl=C3=A9ment_Faure?= <clement.faure@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        Silvano Di Ninno <silvano.dininno@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 18, 2019 at 9:43 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Apr 17, 2019 at 04:21:55PM +0000, Leonard Crestez wrote:
> > On 4/17/2019 4:33 PM, Sudeep Holla wrote:
> > >>> I don't yet buy the security argument. There are many more shared parts
> > >>> on the SoC, like the clock controller, that would need to be taken away
> > >>> from the non-secure world if one would want to run an untrusted OS
> > >>> kernel on a i.MX8M system.
> > >>>
> > >>> To properly implement security on any i.MX8M based system the firmware
> > >>> would need to grow something like a full ARM SCPI implementation, so
> > >>> all shared critical peripherals are solely under firmware control.
> > >>
> > >> It might be possible to rework this to use some form of SCMI-over-SMC
> > >> instead of vendor-specific SMCCC SIP calls

I was just curious to know if there is any progress being made on
this.  The i.mx8mm-evk is missing functionality upstream and I think
the power domain support would help enable some of these features.

thanks

adam
> > >
> > > Sounds feasible and good if all the custom IDs/calls/..etc are well
> > > hidden in the firmware(TF-A in this case) behind the existing
> > > abstraction in Linux kernel.
> >
> > >> Hiding everything critical for security (especially CCM) behind a SCMI
> > >> interface would be a large amount of work but introducing SCMI
> > >> incrementally (starting with imx8mm power) would be useful by itself
> > >> because it simplifies OS implementation.
> > >
> > > Agreed, but not at the expense of introducing and maintaining *random*
> > > *one-off* *custom* SMC extensions. Sorry, that's not open to debate.
> > >
> > >> Many at NXP have attempted to evaluate SCMI and their conclusion has
> > >> always been that "many extensions are required".
> > >
> > > I would like to hear the evaluation. Don't assume that you need to
> > > implement something similar to ARM SCMI reference design. All OSPM like
> > > Linux kernel cares is conformance to the interface, what/how you
> > > implement on the other side is left to you.
> >
> > Brief summary from some attempts at nudging NXP devs towards SCMI:
> >
>
> Thanks for providing the evaluation details.
>
> >
> > There is no SCMI-over-SMC support specified? This would make it possible
> > to use SCMI as a purely software solution on platforms which did not
> > take SCMI into account at hardware design time or which don't have a
> > dedicated SCP inside the SOC. This applies to all imx.
> >
>
> While I admit, the section of SCMI specification that touches transport
> is quite lean, I would view it as done intentionally as the specification
> is mainly concentrated on it's subject matter which is protocol and not
> the transport itself. So did the evaluation attempted to consider/try
> SMC as transport retaining protocol as is ?
>
> I can't see any issues with that and hence I am asking it loud here.
>
> > Peng has been looking at some out-of-tree arm-smc-mailbox patches so
> > it's not just NXP which would like the option of implementing SCMI
> > vendor side in ATF. Like this: https://lwn.net/Articles/726861/
> >
>
> OK, any inputs from that study ?
>
> > Blessing SCMI-over-SMC would allow stuff like intercepting a SCMI
> > message in EL2; checking if the guest is allowed to use that resource
> > and then either forward to EL3 or return an error.
> >
>
> Why are you mixing virtualisation and EL2 here ? Yes we need them but
> it should be optional and if a platform doesn't need it, it should be
> possible to skip it.
>
> >
> > SCMI clock protocol does not cover muxes? On imx the clk hierarchy is
> > very intricate and it relies on many clk core features (including
> > notifiers) and occasional assigned-clocks-parents properties to control
> > muxes from linux. Moving all that to firmware would be a huge amount of
> > effort.
> >
>
> Yes it may be huge amount of work. But is it completely safe as claimed ?
> Giving access to mux controls in OSPM is no so safe/secure in the modern
> world. So you either make it safe with that extra huge effort needed or
> just keep everything in OSPM. But IMO anything in between is not worth it.
>
> > If SCMI included a generic clk mux and allowed keeping the clk hierarchy
> > inside linux then the effort required for hiding the CCM would still be
> > large, but more approachable. It would not "simplify the rich OS" but it
> > would still improve security.
> >
>
> Why do you need to keep the clk hierarchy in Linux ?
>
> >
> > Last point is that SCMI does not cover pinctrl? This is a large chunk of
> > firmware functionality on some imx and security control over individual
> > pins is desirable.
> >
>
> Yes but is that something available at runtime ? Can't that be one-off
> firmware setting. Will Linux need to configure it differently on each boot ?
> Just trying to understand. You say security control here and is it really
> safe to give OS access to control those ?
>
> In short, if you had a full blown protocol like few other platforms, the
> push back would have been minimal. Instead, i.MX chose to implement a
> solution which doesn't have a design thought before and custom SMC APIs
> added on fly whenever a new request is raised by OSPM to control things
> that it thinks it should. I am sure, the very next platform will have it's
> own set of requirements and custom SMC APIs/interface and no one has even
> bothered about long term maintenance of these.
>
> So assuming that trend, I would NACK this as it stands.
>
> --
> Regards,
> Sudeep
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
