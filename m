Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CE5C35242
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 02:00:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1EDA52082F
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 02:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581472826;
	bh=YBuislzk6Xz8UARY7Q2NfNTn8pbh+UcZupi41IbgmV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=g5EAIQzj2eRb2jteqpAzDLiYI7nwn8EV0G2bitPJ7gYBa+OZU8SUXFdgR+KGuHMV0
	 8GSbmr9m5tiVGHm6lJLHSZGRjwKDVIzNSN97UqJ6z7RTcY/RJVCNYq30ylrqshut++
	 8hzI8lyn0TVHb485wNSoXpssLfrx8DjVqBSFRXVc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgBLCAZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 21:00:25 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34727 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgBLCAZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Feb 2020 21:00:25 -0500
Received: by mail-ot1-f66.google.com with SMTP id j16so380040otl.1
        for <devicetree@vger.kernel.org>; Tue, 11 Feb 2020 18:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jqod8cU69ry9qG3LojCpBl21hmbku6HkUFKcyniElVE=;
        b=QYpjEJnX4u/QqHM1thBSTwPm+Rs0EFv0M77th8ewLJ8B/ZiFcgi/9z3MNBde+Y4Z3X
         lP1qYoFoZeeZSzmGLf3TdNzFaysClCt1mdfP5Kypc6cGYT//ZH+lNjUh4msCFxLStBgM
         iBteLH+HHSZ9tYyh4oRQJTI/vzUBupXQBaYiGxFEx/EGtdOO0ammK0t/yOjIYCvXrvbC
         CQ6tHaLP1az1au56VoNjWVoDm0InUtphrkJ9XTY/N6XzY4fv9IIGGn6X5DA5VaRGxW8a
         NHLnb5+Zb9K4mEYmEmeTKq0/qnhrZnz8GKEUUc1lemE3+VZLxU8JUADMmMRIVGafVqEw
         kb7g==
X-Gm-Message-State: APjAAAV6hljLt6jNJ1KSCSmNd6freWsRMtaU6wPwKPlBPp8ya8fE33Bw
        lMeaua5tz6eeOZsntXG2hA==
X-Google-Smtp-Source: APXvYqwcvyc/bDrzO7PYwZ9Gw6qyT118/V2dmcyG16awFTuze1a1Y5CAiNgAKs/f4t4BnTQMNMjxKg==
X-Received: by 2002:a05:6830:1f1c:: with SMTP id u28mr7747677otg.143.1581472824903;
        Tue, 11 Feb 2020 18:00:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l207sm1737003oih.25.2020.02.11.18.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 18:00:24 -0800 (PST)
Received: (nullmailer pid 17647 invoked by uid 1000);
        Wed, 12 Feb 2020 02:00:23 -0000
Date:   Tue, 11 Feb 2020 20:00:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nikolay Borisov <nborisov@suse.com>
Cc:     mripard@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, wens@csie.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nikolay Borisov <nborisov@suse.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: hwlock: Document A64 hwspinlock
 bindings
Message-ID: <20200212020023.GA16678@bogus>
References: <20200211122624.16484-1-nborisov@suse.com>
 <20200211122624.16484-4-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211122624.16484-4-nborisov@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 11 Feb 2020 14:26:24 +0200, Nikolay Borisov wrote:
> Add binding for the hwspinlock found on Allwinner A64 SoC.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  .../allwinner,sun50i-a64-hwspinlock.yaml      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/allwinner,sun50i-a64-hwspinlock.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Error: Documentation/devicetree/bindings/hwlock/allwinner,sun50i-a64-hwspinlock.example.dts:21.28-29 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/hwlock/allwinner,sun50i-a64-hwspinlock.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/hwlock/allwinner,sun50i-a64-hwspinlock.example.dt.yaml] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1236266
Please check and re-submit.
