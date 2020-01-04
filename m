Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3E1C32767
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 01:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48B95222C3
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 01:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578099604;
	bh=CkS7KDb6XHDSfjfPpDrnwvtUxcp32wuD/+tFDkY4bNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kxYtQ4GRjVQdNVvzN9E4s4BArz48po9BCxsl5GacBOjDcWHQVhBqVAXISxyGzV+y+
	 rc6c8TlbSvP2sKf2FCU3ALUyWxbRfXRezLf8SngT4dBIs2sscOkRptowemcZafROSN
	 L2qQ+VIiCEE2tJ/ZMzRRRZANWtNQ0WsUMiDXL830=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgADBAD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 20:00:03 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:46638 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727152AbgADBAD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 20:00:03 -0500
Received: by mail-il1-f193.google.com with SMTP id t17so37994241ilm.13
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 17:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I+/EbHTtG3XdToYbfWwK52tIPgUdmxs5X56AS9/kYW4=;
        b=Qt1354XB85ciuPP3jsjPTVganEKh1Ap/uk1h7NRTxL4uTrxmrK12YEHEFTmqGR3ZUg
         L8QRsWzyS5fydvuRmuMUb+IGPgANDj5oIajC20HMs0VCvK/A5nt0M2rdaBb7zlDG0jNJ
         wCN3lILZeG+0Xlx4VyN7S46BDYTeEUB5g8E31A2ojAw8c/Y9+cZ/oUSD1qOKDaCqTz+q
         76aKrE2lRjXbGlKvwH+t5ZSVJm/yAfAUxQet8lVN9G1WepHLjO47cdYw+thj0rYJpy1+
         3b5qT21vwfPpAvlxuwsOsjVRHMzQ4gI2ykX6oW+IsMUNvKML6pDShZ0B9oxU7Oh3gXau
         Ap4Q==
X-Gm-Message-State: APjAAAUFebMuYnXPRxqOab9ANOOpbtuAOTxsBell3FBCH5JLvg1bbAXg
        46Cad57gucT/eKxVBhyIQpph3gE=
X-Google-Smtp-Source: APXvYqz39T9t2ErJ2TEiskc6QYj4Y1Bud56Q4rx2XX6stK8dtExxz6YDyl3jL+xoxe/JUCZ+0UUTew==
X-Received: by 2002:a92:d151:: with SMTP id t17mr61948953ilg.175.1578099601982;
        Fri, 03 Jan 2020 17:00:01 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id t88sm21433982ill.51.2020.01.03.17.00.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 17:00:01 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:59:59 -0700
Date:   Fri, 3 Jan 2020 17:59:59 -0700
From:   Rob Herring <robh@kernel.org>
To:     Govind Singh <govinds@codeaurora.org>
Cc:     robh@kernel.org, devicetree@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v3 1/2] dt: bindings: add dt entry flag to skip SCM call
 for msa region
Message-ID: <20200104005959.GA15965@bogus>
References: <20200103134414.15457-1-govinds@codeaurora.org>
 <20200103134414.15457-2-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103134414.15457-2-govinds@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri,  3 Jan 2020 19:14:13 +0530, Govind Singh wrote:
> Add boolean context flag to disable SCM call for statically
> mapped msa region.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
