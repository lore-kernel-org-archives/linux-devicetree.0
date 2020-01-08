Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952D1C33CA1
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:32:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66E2B20705
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578515552;
	bh=7iZ2tljUaItpLMpsZM38icHKNVqC0jXeCD/XqBr3FK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ldXY7BvJIYCTu3Z2kgkc1XTVVF0x3jeZ/dvfgc02QFuHFWbVnHGIQMuRUXGs0Bbsc
	 iTIZMy+0KT64/NJkoBsaqgeUrWhiiqiZo5MFaZwiJdAfo6gPOp56Y1+HLK64Ze2/nv
	 RRRLo57eJDYBakkLXj3ssWnNMZaWfeb4BA1qjp4M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgAHUcb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 15:32:31 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44423 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgAHUc3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 15:32:29 -0500
Received: by mail-ot1-f65.google.com with SMTP id h9so4864383otj.11
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 12:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jcxZrCd2+72i2RRqwXRwqBU4vHF81GUXpnT3KHwf8To=;
        b=UR3CGth4dMO+IvToMtaPpYgfwGj25I8EI+ICm1lW71RCjazwR6q2jajPTjwuI0w7eG
         rZAu/i6DWXBnWDOWQEg/dlhVVy/fiX/jxaP7djiTVTEbz9UdJRBfFPiD4qQJ9juW6B1w
         2H3iiTd9ywVn73jF3RlNUadCHnU5I3ntG7JbfjA33sQaWeIs0q6/bFJbzj8UyXCK65bk
         BuWL2EUJOGANr+QdyVFxsUKc2d0LWimm7WdRuoo1LFVVB4VkSXSsCm3Lw1sAkOqk9FRq
         u5K2nJWd4lgV5I34M1iz9LuBe3hz+QBCcXRzIHuMkQ8MfHgPqElWpYUwAqx5ZsIZCDly
         b2Yw==
X-Gm-Message-State: APjAAAUnyJPIfyNgBTNU6KufZyHGq4viDzK5LnbkQ2UG6RLZkzWeVzT1
        5U43rYe5dCCOdJ6ALEIWiGoChPI=
X-Google-Smtp-Source: APXvYqzjqSi50D/KIwfZnO1+I3qzxfmnQ92KrROTNr8fnGxr+c2HYUpjJP+qRIGLyXd+Mlbj+1U0xg==
X-Received: by 2002:a05:6830:1bf9:: with SMTP id k25mr5616470otb.36.1578515548130;
        Wed, 08 Jan 2020 12:32:28 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a6sm877875otd.81.2020.01.08.12.32.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:32:27 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:32:26 -0600
Date:   Wed, 8 Jan 2020 14:32:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Markus Reichl <m.reichl@fivetechno.de>
Cc:     linux-rockchip@lists.infradead.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Markus Reichl <m.reichl@fivetechno.de>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: add vendor Monolithic Power Systems
Message-ID: <20200108203226.GA17283@bogus>
References: <20200106211633.2882-1-m.reichl@fivetechno.de>
 <20200106211633.2882-4-m.reichl@fivetechno.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106211633.2882-4-m.reichl@fivetechno.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  6 Jan 2020 22:16:26 +0100, Markus Reichl wrote:
> MPS produce power regulators like the MP8859.
> 
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
