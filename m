Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BC0C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 15:05:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C80C2077D
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595343909;
	bh=F6SxBfdl4wNRW/1mURa5CcBLgQWhe+UrLwqJXivNcng=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=0a0ywUI3Zp3b2SM3sBjWFKztAUOQpeGksrT+4qcn2oootZZFPwO+InJa48qJloEyQ
	 u6m+Awe5yPhdCv8K/CIPhpHcmbh2LX7vkMRqiq02RbVlxTQdJlyyGamfWuiuOmebsa
	 ojeV5jZ6CgA7CKRSK2fMhw23vC5QxT0UipFVTtZ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729781AbgGUPFI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 11:05:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:45246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgGUPFI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jul 2020 11:05:08 -0400
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57FC72077D;
        Tue, 21 Jul 2020 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595343907;
        bh=F6SxBfdl4wNRW/1mURa5CcBLgQWhe+UrLwqJXivNcng=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fzskyMThqWp3vPofTVlE7URWYrxG7mp9JN0O/mS8uUhQmQA8WSCgUg3QdybuMMXxe
         SlyYa2xaf1BaIlj1RXI80nywhjvqG0BwiTC3NWV8wE4urSHPG12KsiYMxqkkr1Gr23
         3sSt7KzI+692NrWW8WVxGo3d4n9/9gXrKkJ4imPA=
Received: by mail-ot1-f52.google.com with SMTP id c25so15298525otf.7;
        Tue, 21 Jul 2020 08:05:07 -0700 (PDT)
X-Gm-Message-State: AOAM5301IX8gm61xLx/ypE0v5bDO/uGXzus4KYq+W9fOzc0MlQl9U4Qe
        PIis6ynztSXDIYg5cWS5Ij3wAlcyI7o9gL+rSQ==
X-Google-Smtp-Source: ABdhPJwg1qFu+GHeVDp8NETJ9sN5dj3TU0LVw4V3/6K8ZBPyo2KYrQFu1CZaOPP1xtFqiOsO9MGIf0TUDpBxmjtDLIY=
X-Received: by 2002:a9d:46c:: with SMTP id 99mr5434638otc.192.1595343906622;
 Tue, 21 Jul 2020 08:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594935978.git.thinhn@synopsys.com> <9684a2b2adb01b6b1a8c513928ea49b4a6436184.1594935978.git.thinhn@synopsys.com>
 <20200721033908.GA3508628@bogus> <d7e3d5c6-05c1-f256-7773-2b88f6cd5ca3@synopsys.com>
In-Reply-To: <d7e3d5c6-05c1-f256-7773-2b88f6cd5ca3@synopsys.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 21 Jul 2020 09:04:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLSKKT__dJaML4SWCpFpFYV_Cpkor=mNh5-Z7hE4n4fMA@mail.gmail.com>
Message-ID: <CAL_JsqLSKKT__dJaML4SWCpFpFYV_Cpkor=mNh5-Z7hE4n4fMA@mail.gmail.com>
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

On Mon, Jul 20, 2020 at 11:01 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>
> Rob Herring wrote:
> > On Thu, Jul 16, 2020 at 02:59:08PM -0700, Thinh Nguyen wrote:
> >> Introduce num-lanes and lane-speed-mantissa-gbps for devices operating
> >> in super-speed-plus. DWC_usb32 IP supports multiple lanes and can
> >> operate in different sublink speeds. Currently the device controller
> >> does not have the information of the phy's number of lanes supported. As
> >> a result, the user can specify them through these properties if they are
> >> different than the default setting.
> >>
> >> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> >> ---
> >>   Documentation/devicetree/bindings/usb/dwc3.txt | 9 +++++++++
> >>   1 file changed, 9 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> >> index d03edf9d3935..4eba0615562f 100644
> >> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> >> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> >> @@ -86,6 +86,15 @@ Optional properties:
> >>    - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
> >>      register for post-silicon frame length adjustment when the
> >>      fladj_30mhz_sdbnd signal is invalid or incorrect.
> >> + - snps,num-lanes: set to specify the number of lanes to use. Valid inputs are
> >> +                    1 or 2. Apply if the maximum-speed is super-speed-plus
> >> +                    only. Default value is 2 for DWC_usb32. For DWC_usb31,
> >> +                    it is always 1 at super-speed-plus.
> >> + - snps,lane-speed-mantissa-gbps: set to specify the symmetric lane speed
> >> +                    mantissa in Gbps. Valid inputs are 5 or 10. Apply if
> >> +                    the maximum-speed is super-speed-plus only. Default
> >> +                    value is 10. For DWC_usb31, it's always 10 at
> >> +                    super-speed-plus.
> > This is all common USB things and should be common properties (which we
> > may already have).
>
> Sure. For "num-lanes" is simple, any objection if we use
> "lane-speed-mantissa-gbps"? Or should we add "lane-speed-exponent"?

'num-lanes' is good as that's what PCIe uses. Document that with
'maximum-speed'.

I think 'super-speed-plus' should mean gen 2 10G per lane. Then
between num-lanes and maximum-speed you can define all 4 possible
rates.

Rob
