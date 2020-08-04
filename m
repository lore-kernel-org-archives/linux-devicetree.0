Return-Path: <SRS0=zwrU=BO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FA4C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 02:00:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72F8C2076C
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 02:00:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDm9jUv4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgHDCAL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Aug 2020 22:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgHDCAL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Aug 2020 22:00:11 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0BCC06174A;
        Mon,  3 Aug 2020 19:00:11 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id j7so2798461vkk.12;
        Mon, 03 Aug 2020 19:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zc/mDTVc/rFnmhpO6xOJDxe4g+T9tpksSNoSLdk5qXU=;
        b=sDm9jUv4me+Jid9y9TV/h0O7dOHU3HW9DJx1YBNrF3oTm8AiEF0ODL8+DAF6wl758L
         +w7bIHPwK4W2s0RIDFv6uuLB3/1sLWUXM/RNzIIhveY29u5PTsdLZ7YLwU6Xl86wCNQO
         dDt7nGQaM/Kh/vRw+wUBGBIEkmTgmKzspVuO36Wo7if/AnO1RdGMd4BnTHuGHrFzdJ8h
         kdZijy1JBJqDSwu43zMk5he4zlyQIDOdAJNxaEcMV0MKM/WewdqqcJcI+iQnS5NNglzP
         J7rQI4wVkQPynaZuPM5ABcrhzToRWjZ7WjPNYoaBL1z0D/jOWVaTpzyFCxEoR4ClIKYM
         qfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zc/mDTVc/rFnmhpO6xOJDxe4g+T9tpksSNoSLdk5qXU=;
        b=lMTGDTuxfebatWaEdbOnYo/xePBffj/00NK3yzpUpX006OEVo2g9HOIw8hXutVs55C
         aUSMTpWUiGUfCHhPFrHptbq6juLdT2DplBagShawfKwM2HK8apHB9BO1H0jFmg29k1R0
         Heb1oSYVmtFULY6SgJlPm7x7xB96Ddye4R9lz8PHNqSWmQQOhid5SHx+LMkWNKFDy94R
         6499OoZZr8pTYC93EniMinliU7aBHVF2Oi0vejRcbBmuPaQgdAAKRCIyVPFO/BKBCyBa
         IXt1FGsE+9kz8lMxDtSMah8Ec6UkQdCTaOcdU0b8/PrkUSsN/keH4p1Z/wAUDZ+tk5bt
         cZvA==
X-Gm-Message-State: AOAM530GST0zzDaNad1znN0zTfDlhwSmcmZJZoLa2j8kYVxfN2CgB/MD
        hcbrSyWd+OccYMh6lAuTDkduIpWgZ5vWzlI8X7w=
X-Google-Smtp-Source: ABdhPJxqSILvUbt6upgFKnK/lKdwxMBXuAZWR7u1jK9nL4WatYyKakwn3tn3ma89xTNZNfkHl/SrS1gaa5wGbAblTbA=
X-Received: by 2002:a1f:2a48:: with SMTP id q69mr6191996vkq.69.1596506410281;
 Mon, 03 Aug 2020 19:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590415123.git.joglekar@synopsys.com> <83eba2e9f0069f20ccc94537e3b99cbaec209441.1590415123.git.joglekar@synopsys.com>
 <5534d9d6-5452-dade-e46e-f4b0910becdb@synopsys.com> <877dvhqh2e.fsf@kernel.org>
 <2f61133b-319d-80dc-f3f3-7e08e0228953@synopsys.com> <878sfdp5bk.fsf@kernel.org>
 <48f1764e-4383-a149-b93b-3851095394e7@synopsys.com> <7ae08b3d-3b5e-73cf-d196-325501a44e44@synopsys.com>
 <d4f895da-38c7-d553-cb3a-835da00ae687@synopsys.com>
In-Reply-To: <d4f895da-38c7-d553-cb3a-835da00ae687@synopsys.com>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Tue, 4 Aug 2020 09:59:59 +0800
Message-ID: <CAKgpwJVx_96zSgT+ANumOj-AymABu=aZ9KPgLt=bBVgQ5skH+A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] usb: dwc3: Add device property sgl-trb-cache-size-quirk
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Thinh Nguyen <Thinh.Nguyen@synopsys.com> =E4=BA=8E2020=E5=B9=B48=E6=9C=884=
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=888:46=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Hi Rob,
>
> Tejas Joglekar wrote:
> > Hello Rob,
> > On 7/21/2020 10:27 PM, Tejas Joglekar wrote:
> >> Hello,
> >>
> >> On 7/21/2020 3:17 PM, Felipe Balbi wrote:
> >>> Tejas Joglekar <Tejas.Joglekar@synopsys.com> writes:
> >>>
> >>>> Hi Rob,
> >>>>
> >>>> On 7/6/2020 12:13 PM, Felipe Balbi wrote:
> >>>>> Hi,
> >>>>>
> >>>>> Tejas Joglekar <Tejas.Joglekar@synopsys.com> writes:
> >>>>>>> @@ -95,6 +95,10 @@ int dwc3_host_init(struct dwc3 *dwc)
> >>>>>>>         if (dwc->usb2_lpm_disable)
> >>>>>>>                 props[prop_idx++] =3D PROPERTY_ENTRY_BOOL("usb2-l=
pm-disable");
> >>>>>>>
> >>>>>>> +       if (dwc->sgl_trb_cache_size_quirk)
> >>>>>>> +               props[prop_idx++] =3D
> >>>>>>> +                       PROPERTY_ENTRY_BOOL("sgl-trb-cache-size-q=
uirk");
> >>>>>>> +
> >>>>>>>         /**
> >>>>>>>          * WORKAROUND: dwc3 revisions <=3D3.00a have a limitation
> >>>>>>>          * where Port Disable command doesn't work.
> >>>>>>>
> >>>>>> Does this implementation looks good to you? Rob has some concerned=
 over the DT entries,
> >>>>>> you suggested using compatible string with this quirk addition.
> >>>>>> Can you please brief about how you would like to have this quirk i=
mplemented?
> >>>>>> I can send the updated patch. My patch series is pending for merge=
 just because of the
> >>>>>> DT and quirk issue. Can you please help?
> >>>>> Yeah, you need to get into an agreement with Rob :-) I don't mind h=
aving
> >>>>> extra DT flags for things which can't be detected in runtime, Rob
> >>>>> disagrees.
> >>>>>
> >>>> The compatible string is not suitable option as it does not work wit=
h platform drivers
> >>>> with PCI based system. Also Synopsys controllers IP version register=
 is not visible to xhci
> >>>> driver and hence we don't have separate compatible string for each S=
ynopsys version on the
> >>>> xhci driver side.
> >>>> Due to which I depend on DT flag addition for the quirk. Can we add =
these DT flags and quirk?
> >>> As I said, I'm well aware of the situation regarding usage of compati=
ble
> >>> strings and the fact that dwc3 must work on PCI and non-PCI systems (=
I
> >>> wrote the thing as it is after all). The person blocking new quirk fl=
ags
> >>> is Rob, not me. You need to convince Rob that this is the way to go.
> >>>
> >> @Felipe: Sorry for confusion if any, previous mail was intended for Ro=
b asking about his approval.
> >>
> >>> Rob, ball's in your court. Sorry.>
> >> @Rob: As I and Felipe have mentioned before, it is very much necessary=
 to have quirk flags
> >> for the current changes as compatible string would not be a solution f=
or PCI and non-PCI
> >> systems. Can you please approve this change ? If you have any concern =
about naming or any
> >> other thing, please let us know.
> >>
> > Can you please comment?
> >
> > Thanks & Regards,
> > Tejas Joglekar
> >
> >
>
> Can you help provide pointers and changes that Tejas can make to help
> bring this issue to conclusion?

We really need a direction to handle growing dwc3 quirks/flags as dwc3
is widly used,
I have a patchset also pending there after tried both property[1] and
platform data[2].

[1] https://www.spinics.net/lists/linux-usb/msg196055.html
[2] https://www.spinics.net/lists/arm-kernel/msg824995.html

thanks
Li Jun
>
> Thanks,
> Thinh
