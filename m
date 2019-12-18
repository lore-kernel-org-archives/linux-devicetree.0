Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FCCC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 01:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A15F21775
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 01:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576633362;
	bh=VGekl3HcpAeiyyat+gJEIZ3LhIJGu0Q6bOlKT+di1lI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PCF1VXNronhGatzyXzN+erSIoc83Um4XSlEndXzCYIeaCaPkeuBqiYXr4tMvTg0H6
	 MIXckPCgd1WHK+zytj3KTgfyh5NDnic44jsYhvCxpGIatTDOPlSUS6g6N5aF+8aLK1
	 909E4/ddK+qBYrkSfIouX9M4E6L9F+eWeHRJtVDA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfLRBml (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 20:42:41 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37535 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfLRBml (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 20:42:41 -0500
Received: by mail-ot1-f67.google.com with SMTP id k14so334439otn.4
        for <devicetree@vger.kernel.org>; Tue, 17 Dec 2019 17:42:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hey88KKmqccjKqtYDugzS1dzdOd1DvBoA8w9szQUp2M=;
        b=ibJ/ryKqdv6l4kYkLtAUgA28DUrfv4bwwp0y/PvBLJT8oTe5GHXZIzIwsR27pkd/ZF
         qEZNFZhO1aRTKgJX+pZ5ewB0HIhHqmKtr8S8r0wM8SU2rRCYkM056jSy1NikuY/FkTEY
         k8do2VsMzef3VZjGfMJgrNQ2BlZRcpMaSY1PlLAyYbyXKqfMtpygjVoR57bTDXuS1fLh
         qUjVfbLkI+oKqshB2josKJwPgK53hq2+ic7bf+8vEAd2YVRjTE2SoBliViziL44Putf6
         0+T4MKxpQ3cF5I3EqjobfqhnuR28JDvRTDmtHJLWzqQGDNhdwiXrJLtDJBA0X/gQh7jP
         8maw==
X-Gm-Message-State: APjAAAUTJqLcYzjoLWJLc2RiVZbAs30I7e/SQv6Q4yEUshON84xWbfCh
        wJ6Z7ESY/EI/ARqxJXIG9vfShMA=
X-Google-Smtp-Source: APXvYqwNneN4mJ5aJMqo5eilggPAFxYYbiSOKo2ZT++DojHIE81WFPWqbXf+gsMEkKMJS+itFE8zLg==
X-Received: by 2002:a05:6830:9:: with SMTP id c9mr311021otp.94.1576633360907;
        Tue, 17 Dec 2019 17:42:40 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a17sm220157otq.49.2019.12.17.17.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 17:42:40 -0800 (PST)
Date:   Tue, 17 Dec 2019 19:42:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, krzk@kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/4] dt-bindings: sram: Allow for more specific
 compatibles
Message-ID: <20191218014239.GA31784@bogus>
References: <20191209093441.50694-1-maxime@cerno.tech>
 <20191209093441.50694-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209093441.50694-2-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  9 Dec 2019 10:34:39 +0100, Maxime Ripard wrote:
> Even though the generic mmio-sram binding has a list of the sections
> compatible allowed, most device trees have more specific compatibles
> attached to those generic ones.
> 
> This creates warnings at the moment, and we don't really want to cripple
> the generic binding with all the vendor specific combinations that would
> prove to be hard to maintain.
> 
> Let's allow additional compatibles for the sections, and then we can have
> the vendor-specific bindings to reduce the scope of what's allowed exactly.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/sram/sram.yaml        | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 

Applied, thanks.

Rob
