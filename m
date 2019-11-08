Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427D0C5DF60
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 19:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1576E206DF
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 19:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573242258;
	bh=CYTJ8EkCmbONgQ+gSSZpuuJnZdhj19ctWYnfS2790fg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=lml5YZAPSbYytR+2dDqWucnc/9dUPUJm1HwJtOjS+iM51Mx7LZtgXoKAy0riLLzM6
	 ueQAyDRFfw5MEf+UhyyH7sABuJUXX10PLffIOwX8lxZqW8I+3doMLyjN4TZ4ebm7MS
	 F6oXWEUaUthNjoflFSAkLFJW2gYVJ46jHvrzC//s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731564AbfKHToR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 14:44:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:59022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729895AbfKHToR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 14:44:17 -0500
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95DD3206DF
        for <devicetree@vger.kernel.org>; Fri,  8 Nov 2019 19:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573242256;
        bh=CYTJ8EkCmbONgQ+gSSZpuuJnZdhj19ctWYnfS2790fg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K+fxwtzo8kpieI4ckDvG09ctQMVNVdEg2xHB6uGY8qoO16+TkaclAEXMknvQzSUhq
         T3gSkB2Srrtw+5R9AQEV7M7kTzvgWSG1jueqvZSFRDSzfl/rvrm1m4T2PFpdY0Mbti
         QTkLucRcdrqqJoD9VNV4Ydvnp5SG6zMsQOELwQm4=
Received: by mail-qk1-f169.google.com with SMTP id q70so6303443qke.12
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 11:44:16 -0800 (PST)
X-Gm-Message-State: APjAAAVZUko8L6MV1miAw/Lpz1QmDxM2LML/Gmzf60sxB4x0D1Z9BFlK
        fM82BljUrM/GLulu8OR27iDe4bYdSQ/Pwhjq8g==
X-Google-Smtp-Source: APXvYqyR6InH9U1ZQNnYFe7R+4+AwlzcFwQE6za+shn0A87ntD07L+I+SdXpy/7+IQlPo5d/oHQ/KPeWmY3Qvb44P8w=
X-Received: by 2002:a05:620a:205d:: with SMTP id d29mr10922713qka.152.1573242255720;
 Fri, 08 Nov 2019 11:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20191108175935.29766-1-laurent.pinchart@ideasonboard.com> <20191108175935.29766-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20191108175935.29766-2-laurent.pinchart@ideasonboard.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 8 Nov 2019 13:44:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKiQGmMsDkk6WQZU2Q4TfuXfDqMp-iUs62t23dfqpxdBg@mail.gmail.com>
Message-ID: <CAL_JsqKiQGmMsDkk6WQZU2Q4TfuXfDqMp-iUs62t23dfqpxdBg@mail.gmail.com>
Subject: Re: [PATCH v10 1/4] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 8, 2019 at 11:59 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Hyun Kwon <hyun.kwon@xilinx.com>
>
> The bindings describe the ZynqMP DP subsystem. They don't support the
> interface with the programmable logic (FPGA) or audio yet.
>
> Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v9:
>
> - Fix constraints on clock-names
> - Document dp_apb_clk as the APB clock, not the AXI clock
>
> Changes since v8:
>
> - Convert to yaml
> - Rename aclk to dp_apb_clk
> ---
>  .../display/xlnx/xlnx,zynqmp-dpsub.yaml       | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
