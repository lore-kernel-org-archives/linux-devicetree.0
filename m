Return-Path: <SRS0=7bfi=7X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20EBC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 00:19:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87D24206C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 00:19:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="OtKLqIV1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgFJATS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 20:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgFJATQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 20:19:16 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0B2C05BD1E
        for <devicetree@vger.kernel.org>; Tue,  9 Jun 2020 17:19:13 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dr13so573480ejc.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 17:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=osOp62FOVSqRL+E7gP5oUkLSdJ4xEblHVOQqnKObuJg=;
        b=OtKLqIV15kjEqxBBfDDaEcjwg6m5s832ETbdujbwQM40qfO4Qq+zCy7SC6tJ5bhZRP
         bZ75nPDnmazU6TczBrxPS4B3f1CLzJ2U+kRN1OxspFM37QOlrmqSrE66NHLlrgM7y/Kg
         5LasFEqyo5bXZ6lNswAmbGlOlDKlW6FyAHN4y6SIeeiiUawVAu3F1G1VhWKSZtDH3Gp4
         witYF+Dd6rHjnqrF4BgQxeQ/XJ94YL2U/KoHQHhdrZzmt9YeI4Jojy1y4tSqNY63KQ9G
         6qSTTZzj5PIgWKY6DQdCDy/2B8aQzjMToKKtYYk47XTWYccg+nOr2dV5/FkWnD0SGJid
         QIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=osOp62FOVSqRL+E7gP5oUkLSdJ4xEblHVOQqnKObuJg=;
        b=ikr6TGvrVVu5RFD0zdrwFRZR5qZOgRzGd+QsI0HxTxaaEM98rYOW0Fg+PGGzzrRywa
         DaGvb/660NP1htSfW3gNmynOx5y32MJJsnelUAobl5NfDmYKnPz/q0Vzeqy9b4fpZBb1
         jiyLbs1F82zS+JNCrGLconMSUSgZcdHG7Z3kOebnbxPemcO8baYpC+D2+cRW67QS+E76
         Az3sIVEHUl/t8SsOuNinnvvOFGCxKLkTP4saVSntYFZhs4Jgxc3smbO/S8ziBYZ17hrh
         7JrT+13s+BLlEhZ3ZnBW4Xjk4ShdZi6l98LADAthtGZIBgwF287GoH3ZqUdGb6I9cAAS
         lmuQ==
X-Gm-Message-State: AOAM532IOdqJKc81WAOGRstgNxWs3cM9oaUspErMafxOGVIhE1/3pn1c
        6AnMWDp3o98IVD5C4rWuJPvb7/SntVNJ98C7p64ncw==
X-Google-Smtp-Source: ABdhPJxSPuIjrsQ3IPmuQwBPRX78SQ9HxCf/DqzfA8M6A9Er87ytDIw9ZOT1GQgn2LQO1dOBTXPw/niqe343ffym53s=
X-Received: by 2002:a17:906:51c9:: with SMTP id v9mr817357ejk.337.1591748352024;
 Tue, 09 Jun 2020 17:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200320131256.23294-1-p.zabel@pengutronix.de>
 <20200320131256.23294-4-p.zabel@pengutronix.de> <58431830e527c8acb873487f5173e437bee712a6.camel@pengutronix.de>
 <ded561992900a23e9a0135855e9455a07c67ddaf.camel@collabora.com>
In-Reply-To: <ded561992900a23e9a0135855e9455a07c67ddaf.camel@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 9 Jun 2020 21:19:00 -0300
Message-ID: <CAAEAJfDm=XAhsTbUyuhKydyzX=1DAf75WUeY4E7qbhaNQE84Lw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] arm64: dts: imx8mq: enable Hantro G1/G2 VPU
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello Shawn,

Gentle ping.

Thanks a lot!
Ezequiel

On Wed, 27 May 2020 at 22:02, Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> On Wed, 2020-05-27 at 18:19 +0200, Philipp Zabel wrote:
> > Hi Shawn,
> >
> > On Fri, 2020-03-20 at 14:12 +0100, Philipp Zabel wrote:
> > > Add the i.MX8MQ VPU module which comprises Hantro G1 and G2 video
> > > decoder cores and a reset/control block.
> > >
> > > Hook up the bus clock to the VPU power domain to enable handshakes, and
> > > configure the core clocks to 600 MHz and the bus clock to 800 MHz by
> > > default.
> > >
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> >
> > could you pick up this patch? The driver and binding parts have been
> > merged in media/master.
> >
>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Tested-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> It looks good and it matches the downstream device tree.
>
> Thanks,
> Ezequiel
>
> > regards
> > Philipp
> >
> > > ---
> > > New in v6.
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 27 +++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > index 6a1e83922c71..98e464ecb68a 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > @@ -666,6 +666,7 @@
> > >                                     pgc_vpu: power-domain@6 {
> > >                                             #power-domain-cells = <0>;
> > >                                             reg = <IMX8M_POWER_DOMAIN_VPU>;
> > > +                                           clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> > >                                     };
> > >
> > >                                     pgc_disp: power-domain@7 {
> > > @@ -1130,6 +1131,32 @@
> > >                     status = "disabled";
> > >             };
> > >
> > > +           vpu: video-codec@38300000 {
> > > +                   compatible = "nxp,imx8mq-vpu";
> > > +                   reg = <0x38300000 0x10000>,
> > > +                         <0x38310000 0x10000>,
> > > +                         <0x38320000 0x10000>;
> > > +                   reg-names = "g1", "g2", "ctrl";
> > > +                   interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > > +                   interrupt-names = "g1", "g2";
> > > +                   clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> > > +                            <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> > > +                            <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> > > +                   clock-names = "g1", "g2", "bus";
> > > +                   assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
> > > +                                     <&clk IMX8MQ_CLK_VPU_G2>,
> > > +                                     <&clk IMX8MQ_CLK_VPU_BUS>,
> > > +                                     <&clk IMX8MQ_VPU_PLL_BYPASS>;
> > > +                   assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
> > > +                                            <&clk IMX8MQ_VPU_PLL_OUT>,
> > > +                                            <&clk IMX8MQ_SYS1_PLL_800M>,
> > > +                                            <&clk IMX8MQ_VPU_PLL>;
> > > +                   assigned-clock-rates = <600000000>, <600000000>,
> > > +                                          <800000000>, <0>;
> > > +                   power-domains = <&pgc_vpu>;
> > > +           };
> > > +
> > >             pcie0: pcie@33800000 {
> > >                     compatible = "fsl,imx8mq-pcie";
> > >                     reg = <0x33800000 0x400000>,
>
>
