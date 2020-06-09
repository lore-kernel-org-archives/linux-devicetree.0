Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17786C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 19:47:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA00220734
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 19:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591732051;
	bh=b98zM1r+w7H4G1OfeA3ig8hCQL8dQWQ7IXoaPcT693M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=loUdwpWeK1LqYibT7n2cLL7wPNtznzchEvGcBeMe1ZRyjA6TLQn1hqVovlxy1HpvE
	 B/ys5nGBSyb5O01OB7AkkdRM+QAm00yNgmXcTl7tSfj2WZYIcvyaKhXeBxC2WgGc+S
	 MW+NtQ8iGHDslyO+wP1Ang8WzL2IJbrq80U2Ty+8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730644AbgFITra (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 15:47:30 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:34784 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731247AbgFITr2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 15:47:28 -0400
Received: by mail-io1-f49.google.com with SMTP id m81so24202052ioa.1;
        Tue, 09 Jun 2020 12:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t2PNeHr7WtKmBGrRWwvSyK7EJXV23S5IbKum+4tSdLo=;
        b=cUugRabf9iGN/1TAHvYGUl2n9/ETqQFK7l+K7tPePmEURpnE7z0tBDZTD+DlER8EIc
         vX2i90OP0c/JNDJNYQggNwXXYqII8qowGa82EoNZ3oIHKC2gQ8P7zyp0+0zq5fyCJ/zb
         PgnQ7Jl8bGjHQhJjCYSbMC9oU4LJ+wUwPqz3z3NRn5WS4SURdoUr37woxDi2UOlljXVA
         1zuUJbSDfuLQBrD2Hb41RRQwHS620PeyZ8JnixjVe21DqbHTUw4J22SmZjOgXG9VQcSW
         zusoK2yMePmY41f7s1ZQZNmikQb7Zb6CfsCZLpawG8hFPHLMQ7CaoiYXXV0AgWYAhNsx
         y++g==
X-Gm-Message-State: AOAM530O4q9fFA79i6vIgIKqF5KjZ/g+zqnhzGg0dLt7ZYvkgmKQxiR+
        AhkPrv9tuL7ziAkUYHSinw==
X-Google-Smtp-Source: ABdhPJzkqw9rTuRFVSnJJV9dLPkyXizUcs8OWS/Em9DvF9b+2xxXcMXLSN3D0epKwKbP7NTIsu0k5g==
X-Received: by 2002:a02:9999:: with SMTP id a25mr27711545jal.129.1591732048022;
        Tue, 09 Jun 2020 12:47:28 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id t14sm9559645ilp.73.2020.06.09.12.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 12:47:27 -0700 (PDT)
Received: (nullmailer pid 1335952 invoked by uid 1000);
        Tue, 09 Jun 2020 19:47:25 -0000
Date:   Tue, 9 Jun 2020 13:47:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     srv_heupstream@mediatek.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, andriy.shevchenko@linux.intel.com,
        louis.kuo@mediatek.com, bingbu.cao@intel.com,
        shengnan.wang@mediatek.com, bgolaszewski@baylibre.com,
        mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
        mark.rutland@arm.com, robh+dt@kernel.org, sj.huang@mediatek.com
Subject: Re: [V7, 1/2] media: dt-bindings: media: i2c: Document DW9768
 bindings
Message-ID: <20200609194725.GA1335193@bogus>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605105412.18813-2-dongchun.zhu@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 05 Jun 2020 18:54:11 +0800, Dongchun Zhu wrote:
> Add DeviceTree binding documentation for Dongwoon Anatech DW9768 voice
> coil actuator.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/dongwoon,dw9768.yaml        | 100 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
