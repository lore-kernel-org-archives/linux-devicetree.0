Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D10C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 22:11:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2AA8206DA
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 22:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576879875;
	bh=o3HlDsr/siqnvBypoqfes0hM1iU+w9VPO3GGDO30DCY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=U9P/nVQsxYoiN0i2LFZC84N2uVRd2MltfFHm5i935FOGA4syKfnd1qh/++GwvbOdi
	 aFAIUh2jFgzJtQlw4j3H9wFF62KM233/4166jPQSs5hPFq8fP6N6FIcGLv74pySl6i
	 fQCzvoTHK8ZdVVMBq8UMlEaKl/kfSyULm7EBtBYg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbfLTWLP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 17:11:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:35108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727473AbfLTWLP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Dec 2019 17:11:15 -0500
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34F43206DA;
        Fri, 20 Dec 2019 22:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576879874;
        bh=o3HlDsr/siqnvBypoqfes0hM1iU+w9VPO3GGDO30DCY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Bk+/AnavemaMi4clu0XTYMxgz8x2XpfFgSlxqSFF/S1nRrwSuF8yXBq6aNvJ1XzLq
         BXZY4LONqS80LLzvgCRmnS37q5qmxDt3Z6YlxZ//1p3OjVvaSVUC5qBaGr7xmp171b
         hnXW70Xm3h2XpCcFk7nrqn030tfE2TaXJCItrEpY=
Received: by mail-qv1-f53.google.com with SMTP id u10so4140478qvi.2;
        Fri, 20 Dec 2019 14:11:14 -0800 (PST)
X-Gm-Message-State: APjAAAWLgh5kEIYExJfOLrtzI1g7XrQ+BiT818QJzSPoNPLdsmdZ6GfY
        BfiWDuA+gr5/ipuxqLG9YSheFiGUWmRI761EJQ==
X-Google-Smtp-Source: APXvYqxrgGyYUnVQtwMdPxLJhjvv7v/OzHoM6VSqE3TWWKKTIdvS8IJO01k1ZQwCfgUv7ibbCHD2kx9PtSPl9rbZ9Yc=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr14223740qvo.20.1576879873293;
 Fri, 20 Dec 2019 14:11:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576118671.git.thinhn@synopsys.com> <b791f032edb8e6a739c342dbd0d2d5faa66ddfb8.1576118671.git.thinhn@synopsys.com>
 <87mubyvtuh.fsf@kernel.org> <6193f738-03ac-51b5-cdf0-d9b252a50146@synopsys.com>
 <87d0cswvs9.fsf@kernel.org> <20191219221704.GA29965@bogus> <b48e59f9-5339-b1c9-cc16-604900bd1cc4@synopsys.com>
In-Reply-To: <b48e59f9-5339-b1c9-cc16-604900bd1cc4@synopsys.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 20 Dec 2019 15:11:00 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKrRSk0NhqZ5tcus23rWfBzHcxBs8ZR6qv2qR4z_NrD_A@mail.gmail.com>
Message-ID: <CAL_JsqKrRSk0NhqZ5tcus23rWfBzHcxBs8ZR6qv2qR4z_NrD_A@mail.gmail.com>
Subject: Re: [RFC PATCH 13/14] usb: devicetree: dwc3: Add property to disable
 mult TRB fetch
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Youn <John.Youn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 19, 2019 at 3:52 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>
> Hi,
>
> Rob Herring wrote:
> > On Fri, Dec 13, 2019 at 09:04:54AM +0200, Felipe Balbi wrote:
> >> Hi,
> >>
> >> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> >>>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> >>>>> DWC_usb32 has a feature where it can issue multiple TRB fetch requests.
> >>>>> Add a new property to limit and only do only single TRB fetch request.
> >>>>>
> >>>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> >>>>> ---
> >>>>>    Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
> >>>>>    1 file changed, 2 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>>> index ff35fa6de2eb..29d6f9b1fc70 100644
> >>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>>> @@ -108,6 +108,8 @@ Optional properties:
> >>>>>     - snps,num-trb-prefetch: max value to do TRBs cache for DWC_usb32. The value
> >>>>>                           can be from 1 to DWC_USB32_CACHE_TRBS_PER_TRANSFER.
> >>>>>                           Default value is DWC_USB32_CACHE_TRBS_PER_TRANSFER.
> >>>>> + - snps,dis-mult-trb-fetch: set to issue only single TRB fetch request in
> >>>>> +                 DWC_usb32.
> >>>> two questions:
> >>>>
> >>>> - how is this different from passing 1 to the previous DT binding
> >>> The previous DT binding is related to the number TRBs to cache while
> >>> this one is related to whether the controller will send multiple
> >>> (internal) fetch commands to fetch the TRBs.
> >>>
> >>>> - do we know of anybody having issues with multi-trb prefetch?
> >>> No, we added this for various internal tests.
> >> We really a better way for you guys to have your test coverage enabled
> >> with upstream kernel. I wonder if DT guys would accept a set of bindings
> >> marked as "for testing purposes". In any case, we really need to enable
> >> Silicon Validation with upstream kernel.
> > Well, anything would be better than the endless stream of new
> > properties. Include 'test-mode' in the property names would be fine I
> > guess.
> >
>
> Generally the properties are for some quirks or configurations that the
> controller must use to work properly and not for debugging purposes.
> Unfortunately, this list can be long..

quirks or testing? Now I'm confused, which is it?

I'm sure I've said this before (for DWC3), but it is better to have a
compatible string for each implementation (usually an SoC) so you can
address new quirks without a dtb change and continually adding new
properties.

Rob
