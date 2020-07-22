Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3624C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 14:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A81F52071A
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595429167;
	bh=8louaXL847pY3o00IQW/f5w2GRunS/Ux/ip7Y5HgCpE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=lvaK0XGskgFkTgKFI9Nie7RtxXu6f2CBudjj09+RGVHoQR3Etbs+o01R+tG/N9O7L
	 dVF+83csDyylXkwXp5IaHj05Jd30QC8rCr1D5SVuCTxgbNRx2xj7+opjdmlMNfuROC
	 cl/V6zb+YQE/9asz0R1r/XmoP3EIxW38qF8E3odY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730346AbgGVOqH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 10:46:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:52030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728405AbgGVOqG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jul 2020 10:46:06 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2BD02071A;
        Wed, 22 Jul 2020 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595429166;
        bh=8louaXL847pY3o00IQW/f5w2GRunS/Ux/ip7Y5HgCpE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=py1Cfpioy4Qp2XeKb65tWCytMSDX8rwvwuaT1keFKB9BUjHUxe1JblG9JtKjYgwLR
         bkM9/7zZfAoQV/iLfvLC3uGrMCZK20avesNDzGY4wsKB4EfFd+CVp6IoMICLNdd8Dh
         CMI7mow2T6b0iSs97I3Q4+DUQUBlkRB3D0IA+oyQ=
Received: by mail-qk1-f170.google.com with SMTP id j187so2152106qke.11;
        Wed, 22 Jul 2020 07:46:05 -0700 (PDT)
X-Gm-Message-State: AOAM532jP+iMvn0vADI+Sh+pqeXDMMP0LeAQX7xK1CpvKfDapXoJ26Gw
        RjE34KJQJ8P8KNPF+HTarJKJqCY2qkOqpY1Daw==
X-Google-Smtp-Source: ABdhPJy9Bg/KZ4vjPWOjHikyRoWuC+VWai6K4uSq56CXhypZiNzMXdsVDsBCq50D6mCNdyM4eNptYu36uPt0S78nsyQ=
X-Received: by 2002:a37:34f:: with SMTP id 76mr306592qkd.68.1595429165106;
 Wed, 22 Jul 2020 07:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594935978.git.thinhn@synopsys.com> <9684a2b2adb01b6b1a8c513928ea49b4a6436184.1594935978.git.thinhn@synopsys.com>
 <20200721033908.GA3508628@bogus> <d7e3d5c6-05c1-f256-7773-2b88f6cd5ca3@synopsys.com>
 <CAL_JsqLSKKT__dJaML4SWCpFpFYV_Cpkor=mNh5-Z7hE4n4fMA@mail.gmail.com> <57fffdfb-a4fa-6e50-1156-1ada3765e362@synopsys.com>
In-Reply-To: <57fffdfb-a4fa-6e50-1156-1ada3765e362@synopsys.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 22 Jul 2020 08:45:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKSrs93wLrxy2gaBEhGfgZs7jpjFarQBoHGxMc6ur3WRQ@mail.gmail.com>
Message-ID: <CAL_JsqKSrs93wLrxy2gaBEhGfgZs7jpjFarQBoHGxMc6ur3WRQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 21, 2020 at 10:42 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>
> Rob Herring wrote:
> > On Mon, Jul 20, 2020 at 11:01 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> >> Rob Herring wrote:
> >>> On Thu, Jul 16, 2020 at 02:59:08PM -0700, Thinh Nguyen wrote:
> >>>> Introduce num-lanes and lane-speed-mantissa-gbps for devices operating
> >>>> in super-speed-plus. DWC_usb32 IP supports multiple lanes and can
> >>>> operate in different sublink speeds. Currently the device controller
> >>>> does not have the information of the phy's number of lanes supported. As
> >>>> a result, the user can specify them through these properties if they are
> >>>> different than the default setting.
> >>>>
> >>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> >>>> ---
> >>>>    Documentation/devicetree/bindings/usb/dwc3.txt | 9 +++++++++
> >>>>    1 file changed, 9 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>> index d03edf9d3935..4eba0615562f 100644
> >>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>> @@ -86,6 +86,15 @@ Optional properties:
> >>>>     - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
> >>>>       register for post-silicon frame length adjustment when the
> >>>>       fladj_30mhz_sdbnd signal is invalid or incorrect.
> >>>> + - snps,num-lanes: set to specify the number of lanes to use. Valid inputs are
> >>>> +                    1 or 2. Apply if the maximum-speed is super-speed-plus
> >>>> +                    only. Default value is 2 for DWC_usb32. For DWC_usb31,
> >>>> +                    it is always 1 at super-speed-plus.
> >>>> + - snps,lane-speed-mantissa-gbps: set to specify the symmetric lane speed
> >>>> +                    mantissa in Gbps. Valid inputs are 5 or 10. Apply if
> >>>> +                    the maximum-speed is super-speed-plus only. Default
> >>>> +                    value is 10. For DWC_usb31, it's always 10 at
> >>>> +                    super-speed-plus.
> >>> This is all common USB things and should be common properties (which we
> >>> may already have).
> >> Sure. For "num-lanes" is simple, any objection if we use
> >> "lane-speed-mantissa-gbps"? Or should we add "lane-speed-exponent"?
> > 'num-lanes' is good as that's what PCIe uses. Document that with
> > 'maximum-speed'.
> >
> > I think 'super-speed-plus' should mean gen 2 10G per lane. Then
> > between num-lanes and maximum-speed you can define all 4 possible
> > rates.
>
> That may confuse the user because now we'd use 'super-speed-plus' to
> define the speed of the lane rather than the device itself.
>
> According to the USB 3.2 spec, super-speed-plus can mean gen2x1, gen1x2,
> or gen2x2.

Then add new strings as needed to make it clear: super-speed-plus-gen1x2

It's obvious that what 'super-speed-plus' means is not clear since
USB-IF extended its meaning.

Rob
