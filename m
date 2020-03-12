Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9420DC10DCE
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 20:41:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 63F31206CD
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 20:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584045687;
	bh=s7KWuIgyfKQ2G2+Rht2UARRIekG0qfA8p70o84uM9gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nApmopFtLs9QN5z9d/Qy55ZhuJ34kyK2kejzHPDjNNYxZ5QoaTaik45YB6RGFjHYZ
	 IIHewLvZ0LFMiEecxL4pcAsm+8lhEVGFIrziQEH5ZlMlOcgeSVuUBEz3KihIcZdiAY
	 HNHYymwo00DPZrO7iJbC+rHGnIU3Nh84V0cP0gUQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgCLUl0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 16:41:26 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40052 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgCLUl0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Mar 2020 16:41:26 -0400
Received: by mail-ot1-f65.google.com with SMTP id h17so7761499otn.7;
        Thu, 12 Mar 2020 13:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lQqiY6tmNjUHkNQANOD+21UHuEuuyz9Uj/UlRPk4zaE=;
        b=sqUBlLaRKsnjE83vfIvE6vp8/SYRJJQeLobaOwYBZB46WOyKU38i0fFHv0KCRO7gx8
         1bnHcjp2hu8hETk/GYZ7NxQPYcaWoNn8I4L1rfqiNF7cWPSYGGtKetWe+nKkhcZ9woHw
         xMML0j/4T5evrbA7n1a7lSgzd41Vz3jfK6Ocu7C61sHQls6MFAlrHfRXObT848T0EkZ4
         Oe7P1Y4lhqHuD0sm4m/z4TSCSfNQWXOZ4z98kqtvb6bay8e0cUCpS/gepI3PQpDyyaqs
         p1ME4MviIKMSYb99/Jm/YS0Nk+DWG9neqoKzNsdkO21exFSyPSogh7Zas5J6d0KZZbZk
         FBXA==
X-Gm-Message-State: ANhLgQ0ri/0m457oE/74aupddWffdQOnUCXPVYYcBFqyPfewbF47QpqV
        YyDjR1IpQPy83b+Jh93sQw==
X-Google-Smtp-Source: ADFU+vtgx3VGbl306xe9GChdHQZWgdhYWkFjTMPtXbdjcZ+SIqwKxnTbwCNcPNvx0sftxFTJlLnwYQ==
X-Received: by 2002:a9d:3f8:: with SMTP id f111mr8318017otf.204.1584045685657;
        Thu, 12 Mar 2020 13:41:25 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n25sm7084099oic.6.2020.03.12.13.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 13:41:24 -0700 (PDT)
Received: (nullmailer pid 4208 invoked by uid 1000);
        Thu, 12 Mar 2020 20:41:24 -0000
Date:   Thu, 12 Mar 2020 15:41:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/22] dt-bindings: Add vendor prefix for Baikal
 Electronics, JSC
Message-ID: <20200312204124.GA1756@bogus>
References: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
 <20200306124832.986FE8030793@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306124832.986FE8030793@mail.baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 06, 2020 at 03:46:47PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> Add "BAIKAL ELECTRONICS, JSC" to the list of devicetree vendor prefixes
> as "be".
> 
> Website: http://www.baikalelectronics.com
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

checkpatch is not happy that the author and S-o-b don't match.

> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 9e67944bec9c..8568713396af 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -141,6 +141,8 @@ patternProperties:
>      description: Shenzhen AZW Technology Co., Ltd.
>    "^bananapi,.*":
>      description: BIPAI KEJI LIMITED
> +  "^be,.*":
> +    description: BAIKAL ELECTRONICS, JSC
>    "^bhf,.*":
>      description: Beckhoff Automation GmbH & Co. KG
>    "^bitmain,.*":
> -- 
> 2.25.1
> 
