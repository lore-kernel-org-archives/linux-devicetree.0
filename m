Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D70CC433E4
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 10:36:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78B3020737
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 10:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6oG7iXA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgGWKgK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 06:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgGWKgJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 06:36:09 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DA8C0619DC;
        Thu, 23 Jul 2020 03:36:09 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id k7so2793938vso.2;
        Thu, 23 Jul 2020 03:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q5fcwqzyeN2BK6ysq+Tl8x1tNDX+a9sJ3ecuml0snGM=;
        b=F6oG7iXAtC/zl0+Q7zhbvOtlKZlSVsebnmMwKWsvkbJ9LJmsH5VRy0zlesptdQo24J
         mh+/WO7ZNKyYpYnoYeV1cTeJlXbxgGIMX/sc8kGjOeTd8eu4LfmQmHsaNo8qtAC4Psxu
         vJoZDfb77+fQktluk2m2J+qsSNvtPgnhWktSKapoRNipw5BAy1usagp0NtjX0hEz0whP
         bVkFMZmBkmGjOCbNU27w0cddYA2Kd/q3NydpmSie3G541GQhFPfhCcwebZkWZYVJSuhW
         l00yk9wMT52sQgi2IBrLqjX6udpP5hWzhEzqRdupzInO7ml9vFENTl4NRa13ruMDR5BV
         24dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q5fcwqzyeN2BK6ysq+Tl8x1tNDX+a9sJ3ecuml0snGM=;
        b=fO3nNDyczm1BhQ0QPStFmqHNrWnUppQyOUo4x8J6JMybNvYWk/EAqn8eL6fQZCwCWM
         ZcroxzSFtjmHwdFoSNit34pZWHzmSeaevJxObDVcOh5dWg3EqQBNsm91FUVB8YwsQQrA
         Vl+duVHIcADhONv4KXBg0VkMcHHNJP8QXHmMR6jrHltpTBny4nUcJJbjL9fGGuvcl4Nx
         PGeI9xbvgF3DVfXBfDkKgYo7CCw7V4SNkbUsXJqkbuHHFffjVgfVJuRL48wz7P0P17kN
         JOpOxQXXcZpB3JJM+GGdVSWkqeBc0F7OPFZfazb/hB8GEYOk0O07vTw9/wytvfPmtw9W
         b7bQ==
X-Gm-Message-State: AOAM5310nZEMF/eXeunTxxK4daaCLOZf0nj6Ti1haFkmIuWo97nyc4d5
        w80bMU0mDyr+FI/vs8XnWRCX+tiHGVjXWKiYN8Y=
X-Google-Smtp-Source: ABdhPJzmugMgE14NEn04xxeOenodVq+JdvJGnLsuEQK7cT39cfs9lwU1TO5hmvGeRAiUej2NUgJbIf4mmIPYGCKSuAk=
X-Received: by 2002:a67:2d8d:: with SMTP id t135mr3477330vst.23.1595500568378;
 Thu, 23 Jul 2020 03:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590415123.git.joglekar@synopsys.com>
In-Reply-To: <cover.1590415123.git.joglekar@synopsys.com>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Thu, 23 Jul 2020 18:35:57 +0800
Message-ID: <CAKgpwJX6awJeqVsa_3mX_+UbhC+3ns=dLeiXBz7Na5QkQRZpjQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add logic to consolidate TRBs for Synopsys xHC
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        John Youn <John.Youn@synopsys.com>, Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Tejas Joglekar <Tejas.Joglekar@synopsys.com> =E4=BA=8E2020=E5=B9=B45=E6=9C=
=8827=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:54=E5=86=99=E9=81=93=
=EF=BC=9A
>
> The Synopsys xHC has an internal TRB cache of size TRB_CACHE_SIZE for
> each endpoint. The default value for TRB_CACHE_SIZE is 16 for SS and 8
> for HS. The controller loads and updates the TRB cache from the
> transfer ring in system memory whenever the driver issues a start
> transfer or update transfer command.
>
> For chained TRBs, the Synopsys xHC requires that the total amount of
> bytes for all TRBs loaded in the TRB cache be greater than or equal to
> 1 MPS. Or the chain ends within the TRB cache (with a last TRB).
>
> If this requirement is not met, the controller will not be able to
> send or receive a packet and it will hang causing a driver timeout and
> error.

Hi Tejas Joglekar

I am debugging  a similar issue on Synipsys XHC, it's not the same case
but I am wondering if it also linked to this HW limitation.

My Synopsys XHC based host enable UAS, when enumerates a UAS
HDD, one BULK-IN EP with stream enabled will not generate event for
trb(with stream ID 1) after a 16/4096 bytes(with stream ID 2) finished in
previous trb.

If I change the last OK urb/trb's buffer length from 4096 to 512, the issue
will gone.

following is the sequence of the question EP-IN:

<idle>-0     [000] d.h1   154.961710: xhci_urb_giveback: ep3in-bulk:
urb ffff0001775f6f00 pipe 3221324672 slot 1 length 36/36 sgs 1/1
stream 1 flags 00040200
<idle>-0     [000] d.h1   154.962023: xhci_urb_giveback: ep3in-bulk:
urb ffff000177d00400 pipe 3221324672 slot 1 length 96/96 sgs 1/1
stream 1 flags 00040200
<idle>-0     [000] d.h1   154.970395: xhci_urb_giveback: ep3in-bulk:
urb ffff000177d00400 pipe 3221324672 slot 1 length 11/255 sgs 1/1
stream 1 flags 00040200
<idle>-0     [000] d.h1   154.970562: xhci_urb_giveback: ep3in-bulk:
urb ffff000177d00400 pipe 3221324672 slot 1 length 20/255 sgs 1/1
stream 1 flags 00040200
<idle>-0     [000] d.h1   154.970786: xhci_urb_giveback: ep3in-bulk:
urb ffff000177d00400 pipe 3221324672 slot 1 length 60/255 sgs 1/1
stream 1 flags 00040200
<idle>-0     [000] d.h1   155.851600: xhci_urb_giveback: ep3in-bulk:
urb ffff000177d00200 pipe 3221324672 slot 1 length 16/4096 sgs 1/1
stream 2 flags 00040200

/* then the next ep3-in trb will not generate event and stopped, so
driver timeout in the end */
kworker/u8:2-349   [003] d..3   155.851987: xhci_urb_enqueue:
ep3in-bulk: urb ffff000170492400 pipe 3221324672 slot 1 length 0/32
sgs 1/1 stream 1 flags 00040200
kworker/u8:2-349   [003] d..4   155.851989: xhci_queue_trb: STREAM:
Buffer 00000000c19cf000 length 32 TD size 0 intr 0 type 'Normal' flags
b:i:I:c:s:I:e:c
kworker/u8:2-349   [003] d..4   155.851991: xhci_inc_enq: STREAM
ffff000177f86f80: enq 0x00000000be0eb060(0x00000000be0eb000) deq
0x00000000be0eb050(0x00000000be0eb000) segs 2 stream 1 free_trbs 508
bounce 1024 cycle 1

Do you have any ideas?

thanks
Li Jun
>
> This patch set adds logic to the XHCI driver to detect and prevent this
> from happening along with the quirk to enable this logic for Synopsys
> HAPS platform.
>
> Based on Mathias's feedback on previous implementation where consolidatio=
n
> was done in TRB cache, with this patch series the implementation is done
> during mapping of the URB by consolidating the SG list into a temporary
> buffer if the SG list buffer sizes within TRB_CACHE_SIZE is less than MPS=
.
>
> Changes since v2:
>  - Modified the xhci_unmap_temp_buffer function to unmap dma and clear
>    the dma flag
>  - Removed RFC tag
>
> Changes since v1:
>  - Comments from Greg are addressed on [PATCH 4/4] and [PATCH 1/4]
>  - Renamed the property and quirk as in other patches based on [PATCH 1/4=
]
>
> Tejas Joglekar (4):
>   dt-bindings: usb: Add documentation for SG trb cache size quirk
>   usb: xhci: Set quirk for XHCI_SG_TRB_CACHE_SIZE_QUIRK
>   usb: dwc3: Add device property sgl-trb-cache-size-quirk
>   usb: xhci: Use temporary buffer to consolidate SG
>
>  Documentation/devicetree/bindings/usb/dwc3.txt     |   4 +
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |   3 +
>  drivers/usb/dwc3/core.c                            |   2 +
>  drivers/usb/dwc3/core.h                            |   2 +
>  drivers/usb/dwc3/dwc3-haps.c                       |   1 +
>  drivers/usb/dwc3/host.c                            |   6 +-
>  drivers/usb/host/xhci-pci.c                        |   3 +
>  drivers/usb/host/xhci-plat.c                       |   4 +
>  drivers/usb/host/xhci-ring.c                       |   2 +-
>  drivers/usb/host/xhci.c                            | 135 +++++++++++++++=
++++++
>  drivers/usb/host/xhci.h                            |   5 +
>  11 files changed, 165 insertions(+), 2 deletions(-)
>
> --
> 2.11.0
>
