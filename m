Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A146C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ED342071B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioMBvp9t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgGPICh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 04:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPICb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 04:02:31 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86353C061755
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:02:31 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id o3so4257186ilo.12
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x8Ce9j7zk91Xc63rHhNEf95IY70/+EmDpEcw9U4m9jo=;
        b=ioMBvp9teLR1HYUEl0KtqdLDBB9P0+jiD7Ax4pKzABAY0HdU65W1xMtORZ22h/b7qj
         SdTCtQMgFZ53UTiaOoeA84t5mjXsFX42l9T5wG1CpPTC9tefdGmYlzjwg4WSh8/gM2BW
         qGKjV8XPylz02mcMFGG+nmthaR1MyjG/vnL3vxdIIkrvFESNSJoqEjbVJyWpHjFYaOi/
         fK8fUZ12GqF940Hl+5lpXF5puy9Is4RPwIL3V0vhp+2ffuUkTVkTP4GjTyJnSoakOtAT
         zQjxdE0TfBm1CT9r/LBfQDpxL7CAgR55sUbU1PoM8seFJ7A2VhVvkz8ixUtf3jk1xlnw
         FMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x8Ce9j7zk91Xc63rHhNEf95IY70/+EmDpEcw9U4m9jo=;
        b=Iz2LEFFg891D9A4RNjHLzC/PBRe60f6L4eHlRIKxfZg7ShJmNgMVi4zHEZ0Vn6qG+u
         sU19HWJA9OUhtZ2++WTAWtO3k5URGjM6UALOvq1wSFt5H9TxOXjEqW9yuqOgShqAVJt6
         RP/igDMMQmUt5LJ0Dr7YLD1ZANiYW2ZYDQ/FFPLExOhTtLyo91KX3yithq+QVfZDg+iU
         RnfcRQEz30+lvybHLCe51aprGuZm1G0lEdfE3r+o/1yzqr1J98g6i/aNcAneq1SWHpJB
         JRaSQcCcvIs8sKLdnJiy3/NaxZN0V8wnx9k2kZmVv7UKkXqIYcZ+FeRzfjAbuh/zP120
         1AZA==
X-Gm-Message-State: AOAM532t8JwtSpcBomo5KHCanJTOtGpmI0ZgrGLAJf1dUKdAPWLycGkW
        lfWXkuZKsVbCodKnrLWoKtCRdstnkIQihTvsqow=
X-Google-Smtp-Source: ABdhPJzcIm9z3NmSkVW5PNnnqLFE0Sg0Xe+eDAwGmuJuSVaGREwAbJNIJw8WDqyqqWpbQnInV7A0ByzS2XY68AtGWcY=
X-Received: by 2002:a92:5ecf:: with SMTP id f76mr3654015ilg.6.1594886550795;
 Thu, 16 Jul 2020 01:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200715160209.652-1-linux.amoon@gmail.com> <20200715160209.652-2-linux.amoon@gmail.com>
 <de587578-9da5-cd1d-826a-ab83b7c3dcc1@baylibre.com>
In-Reply-To: <de587578-9da5-cd1d-826a-ab83b7c3dcc1@baylibre.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Thu, 16 Jul 2020 13:32:20 +0530
Message-ID: <CANAwSgT9KPt5xTMd77LtSm3ojUiUqVHzJ3mKuKKbFW2c11J=Ag@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Neil,

Thanks for your review comments.

On Thu, 16 Jul 2020 at 12:38, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 15/07/2020 18:02, Anand Moon wrote:
> > Enable RTC PCF8563 node on Odroid-N2 SBC, In order
> > to support the RTC wakealarm feature for suspend and resume.
> >
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > $ sudo hwclock -r && date
> > 2020-07-15 13:11:53.862508+00:00
> > Wed Jul 15 13:11:54 UTC 2020
> >
> > $ hwclock --show
> > 2020-07-15 13:17:30.903300+00:00
> >
> > But RTC wake up is not working at my end.
> > Any inputs are welcome.
> >
> > $ time rtcwake -s 30 -m mem
> > rtcwake: /dev/rtc0 not enabled for wakeup events
> >
> > real    0m0.002s
> > user    0m0.002s
> > sys     0m0.000s
> > ---
> >  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index 169ea283d4ee..a447cba4dd53 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -391,6 +391,20 @@ hdmi_tx_tmds_out: endpoint {
> >       };
> >  };
> >
> > +&i2c3 {
> > +     pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> > +     pinctrl-names = "default";
> > +     status = "okay";
> > +
> > +     rtc: rtc@51 {
> > +             reg = <0x51>;
> > +             compatible = "nxp,pcf8563";
> > +             #clock-cells = <0>;
> > +             clock-frequency = <32768>;
> > +             clock-output-names = "rtc_clkout";
>
> The clkout output is not used, so I don't think these 3 lines are needed.

Ok Thanks I will drop these 3 clock lines.

>
> > +     };
> > +};
> > +
> >  &ir {
> >       status = "okay";
> >       pinctrl-0 = <&remote_input_ao_pins>;
> >
>
> Neil

-Anand
