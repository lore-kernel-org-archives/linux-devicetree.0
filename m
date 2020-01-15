Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9906C33CB3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 15:24:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C5E924680
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579101846;
	bh=52AKeC8FlI5xJPhxeGGnhr6KtXi5d0SYX8QYJU6NnEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=uFN6ScPG+vmOSHFKiUjvvupaXpFzNXlvFxurhJHgBCRrxgsiJScXD6jPQck/n1/84
	 zO4H1SxXkDnyRL+X91QWWlm6lKVhgqIPOP+U61XXpO68xnH/iadtFXaEPB0KfzPTKz
	 D05ReLL42cWokt944Hpys1kUmmg2DtVFxflckI+0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbgAOPYF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 10:24:05 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43493 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729195AbgAOPYF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 10:24:05 -0500
Received: by mail-ot1-f65.google.com with SMTP id p8so16374465oth.10
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 07:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P/3+h18PWi0rPObNUTxyncVSLqQVYDEB0c+gxo42pyg=;
        b=N3wOEkgmUKoezx7ZJAmDBST8MWpcZ74YozqiYXZHa+/7Y/gv14E/ZwCBujETdE0vfE
         rxsCk4dxrg+LDVH15zn2CyYiyOGETOs+exjwg3QPNwYDXVVCFDBbHHTbL/LQ5j+pJSh3
         A8qchMSEyX1RL8j9RfJeMFS2pOqmgrSQQHnLuPCrnD9sasWSKA3ZnQAMYnqT5wnjASVY
         oaBnvssl4tLlmW98QlshVZC8t2xzMzMEmsL34/gRhR9segsMcJlbof8MiuKtbnD8R8C3
         pKGsVnkxmwtM5uxUsCWpU3LpBbZtGmW8LsjaxOibHsOohY0j0zIDMNeNEN2fkpab0s2P
         wZhA==
X-Gm-Message-State: APjAAAUlsNjVHhWctLvmvHuJ0XnA2+iNAVXVICXbEJ49FsxBGodDenGT
        neY17o6T+WBw/LfiIJ/lpvc2pzM=
X-Google-Smtp-Source: APXvYqxogr1W1WqxTYoUSnM776QmNEVj2ugfyF0K/huMmB3/Mv1R+wLX6nn+1uTUTGo921X/oqOZzQ==
X-Received: by 2002:a05:6830:1e30:: with SMTP id t16mr3213365otr.220.1579101844053;
        Wed, 15 Jan 2020 07:24:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f1sm6645555otq.4.2020.01.15.07.24.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 07:24:02 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22040c
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 09:24:01 -0600
Date:   Wed, 15 Jan 2020 09:24:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 4/5] dt-bindings: arm: sunxi: add binding for PineTab
 tablet
Message-ID: <20200115152401.GA15812@bogus>
References: <20200110155225.1051749-1-icenowy@aosc.io>
 <20200110155225.1051749-5-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110155225.1051749-5-icenowy@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 23:52:24 +0800, Icenowy Zheng wrote:
> Add the device tree binding for Pine64's PineTab tablet, which uses
> Allwinner A64 SoC.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
