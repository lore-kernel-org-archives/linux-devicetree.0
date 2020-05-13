Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B519C2D0F6
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 02:22:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A49420714
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 02:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589336561;
	bh=MnzyUJbC1/Xp/QkUP2hjZ+cuj4GlQl6GKuTbfFwtIks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ef9ODgrFAKLRfA1oz/N/guIpZzU0nNhDeTJhr3Ir5tJ9QZ8C5e0tV6c+YhLeF9BZC
	 qx5J33ERcNBnKIyPUq8IcbF4goUMLUxc4DPUic7NKY9s5YLVBbXuccKpKYClSc/LWd
	 iSVnvGGlpDCtzlE9zkRV1tLhG1CbOm/d1XBAvC9g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgEMCWk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 22:22:40 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43051 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbgEMCWk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 May 2020 22:22:40 -0400
Received: by mail-oi1-f195.google.com with SMTP id i22so3534945oik.10
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 19:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AaR/7VLqy6LVKQz0uPuHWvPqsrRu/xq4udfPwcoi4i4=;
        b=ccmxhzT6iIPbvPTQOu0Dj2QOi9TXY6LHNt8EuCNTbXN16z2kxjuogTZiuTiBxTlSIN
         uKD1p6WxoAXKxBrX1hBS37jWDLT595jF5j8u5k9kY0n98Z9u/HQZAcwEkRV7b05wknDQ
         +S7aJEiCbHw/gnpOzIgqvcpV0UXP7YBNkPUqqF21Erinfh9DsIcCXcBneESyEgJEroXV
         vAyBUtFtGkYgeiV+eOvFrglAGBTfU7Cz6baX7QU7zbRmWyNpCY9wnjlLtEdiB1x4/4TM
         QSTnZ1vMzePKQw7CTaW+GeQW1YvPFmxy5aW8CIrad5bONvN7v/HY8wPbZLF/HImJlF0h
         glVQ==
X-Gm-Message-State: AGi0PubwcJ72qHniV/KV6NKLQskosYPSWM5yo7meqCby3ljZqEBOahN1
        W0dNuISgk5yKfKHSNNMMOg==
X-Google-Smtp-Source: APiQypINVeEjqdUUaUFDCRteAcuJFXQ0VcFRi9yLFbPpHTTIaQYCJC8fJUkJltCCW9Ho2P4Z1GY8Xw==
X-Received: by 2002:aca:1818:: with SMTP id h24mr26212488oih.71.1589336559137;
        Tue, 12 May 2020 19:22:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q3sm1359956oth.2.2020.05.12.19.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 19:22:38 -0700 (PDT)
Received: (nullmailer pid 22790 invoked by uid 1000);
        Wed, 13 May 2020 02:22:37 -0000
Date:   Tue, 12 May 2020 21:22:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: sun8i-mixer: Allow for an
 iommu property
Message-ID: <20200513022237.GA22733@bogus>
References: <cover.70f96f9afd2e04161ebece593ae6cd7e17eca41b.1588673353.git-series.maxime@cerno.tech>
 <ef88e9d96eafe3f921cfbe087c5f0a25a5dd41ac.1588673353.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef88e9d96eafe3f921cfbe087c5f0a25a5dd41ac.1588673353.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue,  5 May 2020 12:09:31 +0200, Maxime Ripard wrote:
> The H6 mixer is attached to an IOMMU, so let's allow that property to be
> set in the bindings.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
