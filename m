Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5554C47247
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 18:10:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C41E0206B8
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 18:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730184AbgEESK1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 14:10:27 -0400
Received: from foss.arm.com ([217.140.110.172]:47066 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729315AbgEESK1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 May 2020 14:10:27 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 727811FB;
        Tue,  5 May 2020 11:10:26 -0700 (PDT)
Received: from [10.57.39.240] (unknown [10.57.39.240])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A450F3F305;
        Tue,  5 May 2020 11:10:24 -0700 (PDT)
Subject: Re: [PATCH 00/16] dts/dt-bindings: Fix Arm Ltd. ARMv8 "boards"
To:     Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-kernel@lists.infradead.org
References: <20200505165212.76466-1-andre.przywara@arm.com>
 <20200505165212.76466-2-andre.przywara@arm.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <a96c83b3-dc58-e1da-de52-d36bdfc0533f@arm.com>
Date:   Tue, 5 May 2020 19:10:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505165212.76466-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-05-05 5:51 pm, Andre Przywara wrote:
> Date: Mon, 4 May 2020 12:41:55 +0100
> Subject: [PATCH 01/16] dt-bindings: mali-midgard: Allow dma-coherent
> 
> Add the boolean dma-coherent property to the list of allowed properties,
> since some boards (Arm Juno) integrate the GPU this way.

The same comment as for "iommus" applies to some degree here too. 
There's a bit more likelihood that the device itself does want to know 
whether it's integrated coherently, so that it can choose what memory 
attributes to use (as is the case here), but with protocols like 
ACE-lite it's possible to hard-wire any old dumb device to behave 
coherently without even realising. Thus this is another property that 
could legitimately turn up more or less anywhere.

Robin.

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> index 0407e45eb8c4..5d7165385e1f 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> @@ -87,6 +87,8 @@ properties:
>     "#cooling-cells":
>       const: 2
>   
> +  dma-coherent: true
> +
>   required:
>     - compatible
>     - reg
> 
