Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0D9C47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 22:31:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDB78206FA
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 22:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588717881;
	bh=fKcM1dY0iNW8qqGDinGxm0DRNWNhZiKnwheyGuNzmrM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=XMgU7xLSEqwy8dCZISeGNgNZqF4v2lPODJ0O5V+MqhaLv8vsBEoyzShfLrqmzszPb
	 Cum2O5IeyrC2SJqBfhWtYW6cwf7A2O+qt1Dj3NLSaskgb+Wm9Zz1/DtJZu4VDacfBk
	 r04O/1qp8619hOlJy6E49wpUxtB9eciiZCCZKjpc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgEEWbU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 18:31:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:56100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbgEEWbU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 May 2020 18:31:20 -0400
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6624B20721;
        Tue,  5 May 2020 22:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588717879;
        bh=fKcM1dY0iNW8qqGDinGxm0DRNWNhZiKnwheyGuNzmrM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gyx/XcuVwrDHASq9pUr5aWebtwdf1QlEhGTBqZ+1suNaNkPCkb7X+POq3aFodBivL
         +QDQx0YZH0HJZnnZFDbqjDpCGmx3YHaCGaB1Jp4det8NJh/FGexKwxjipw9E9EK2L3
         iS9WL9IkKt41eC/gx5BOSp6XJyxZKBbHuym+PR6Q=
Received: by mail-oo1-f44.google.com with SMTP id u190so67405ooa.10;
        Tue, 05 May 2020 15:31:19 -0700 (PDT)
X-Gm-Message-State: AGi0PubBMCqA2gK3bIE9xc0Vob/Uu2FSnwteUW/haxF4uxafc4NXsSHs
        FM3eUrWLODkwW0rIHkGcyzprWybvE+qZxrQ/fw==
X-Google-Smtp-Source: APiQypILTo9QA1U67foGlHeZtsp1V6e4vkMZtEo170XuxA3msKoVEn9b99tFF6RWDZcpUjJEF4Nl5h5IGALQJYDJ7sA=
X-Received: by 2002:a4a:9c55:: with SMTP id c21mr4909896ook.25.1588717878704;
 Tue, 05 May 2020 15:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200505165212.76466-1-andre.przywara@arm.com>
 <20200505165212.76466-4-andre.przywara@arm.com> <eee99db5-4100-5064-97c0-abf54d2eec15@arm.com>
In-Reply-To: <eee99db5-4100-5064-97c0-abf54d2eec15@arm.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 5 May 2020 17:31:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJdt8j1U0R-gfHUi6NhJLyPqigWB-Y3rEfPtwRFKpBO+g@mail.gmail.com>
Message-ID: <CAL_JsqJdt8j1U0R-gfHUi6NhJLyPqigWB-Y3rEfPtwRFKpBO+g@mail.gmail.com>
Subject: Re: [PATCH 00/16] dts/dt-bindings: Fix Arm Ltd. ARMv8 "boards"
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Linux USB List <linux-usb@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, May 5, 2020 at 12:52 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-05-05 5:51 pm, Andre Przywara wrote:
> > Date: Mon, 4 May 2020 12:43:18 +0100
> > Subject: [PATCH 03/16] dt-bindings: ehci/ohci: Allow iommus property
> >
> > A OHCI/EHCI controller could be behind an IOMMU, in which case an iommus
> > property assigns the stream ID for this device.
>
> Hmm, pretty much any DMA master device could be behind an IOMMU, and in
> a way that's basically entirely irrelevant to the device itself (and
> thus the consumer of its binding). Is there a better way we can handle
> this than repeating such "semi-standard" properties in individual
> bindings for ever more?

We did that for pinctrl-* properties which I was somewhat lukewarm on.
I think a lot more nodes have pins than DMA, so I prefer to keep this
explicit. We do allow more than 1 iommus entry which might be device
specific, so somewhere we need to capture how many are allowed/valid.

We could define a 'dma-device.yaml' schema and reference that on all
DMA capable device. Not sure that saves much though.

Rob
