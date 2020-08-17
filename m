Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374F1C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 19:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08FE420658
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597693597;
	bh=1Gkjk0kyhaKPoSSxghcVS190JLU36B0dVVKFxnYhbc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=G8ekYpfqAPnVYxbEkJnUveR61Y10RkW9xzoBCumA2sClvYuBkuKF0NbIH0heKD8ch
	 W+aXRWBAUdzYVfBOpn/uqjFqy/lGHQ6ZRhYqroDMDg5tYbFtHFxoSTXNJEblbILuTr
	 NoyKmzlI8rZXZekTSDte0q0LzXo6moyiVVIDqhQA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404418AbgHQTqe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 15:46:34 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:45114 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404410AbgHQTqb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 15:46:31 -0400
Received: by mail-il1-f195.google.com with SMTP id k4so15587015ilr.12;
        Mon, 17 Aug 2020 12:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EOzlexXxnnNJNoE0tWki2mK2/OV+9FfRiLpuyXB+wd0=;
        b=hr+HoTowPQcQzgHls6S4xjNBBFaNA7J/Q2uunfleQ/n2MyVPOyoLWgIXXix9ZgXAMY
         bSUu8V5muzS4QXwKeJx29Br4Y0fVqSkb+fILNbrF/AeGkitTZgvHN+iC96lhbIKMaeMZ
         kRphEqs3/zgFjGNeTfiOtWoG/fiPt0pMx954OzKYnt+G4zq8S5xAscv/ZFczHdOhjTow
         5v2Gpcxn+SiBVwV1NM2ipTZ+mWR7YGC2utJuClQ0MfhTgKguBqwfqdBsTAFSKXjgiCTA
         hiQ5+RAtNQf29dN9nXELA2cs3ywd42spk5AzfoHZE/LBSWZF/WEEgxx7D+d+DE/HcBuz
         2utA==
X-Gm-Message-State: AOAM530xI/EWq4/amT6CGcB3U3d05kkv4RZljbjUse2yZwcE4VT3hc9U
        ZfoCd1SZEKLs4pSqInC/z0ODmLYZew==
X-Google-Smtp-Source: ABdhPJw8tFpy0Lh1lTcoUqxICZJtoO/40ppzQJijLLZGBVm93tALAozRlvFdVjgSPShCIB/rsQVpow==
X-Received: by 2002:a92:a1d7:: with SMTP id b84mr15043527ill.75.1597693590017;
        Mon, 17 Aug 2020 12:46:30 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id k14sm9599598ion.17.2020.08.17.12.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 12:46:29 -0700 (PDT)
Received: (nullmailer pid 1432682 invoked by uid 1000);
        Mon, 17 Aug 2020 19:46:27 -0000
Date:   Mon, 17 Aug 2020 13:46:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     punit1.agrawal@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: Add bindings for Toshiba
 Visconti TMPV7700 SoC
Message-ID: <20200817194627.GA1432385@bogus>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200817014632.595898-2-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817014632.595898-2-nobuhiro1.iwamatsu@toshiba.co.jp>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 17 Aug 2020 10:46:25 +0900, Nobuhiro Iwamatsu wrote:
> Add pinctrl bindings for Toshiba Visconti TMPV7700 SoC series.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  .../pinctrl/toshiba,visconti-pinctrl.yaml     | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.example.dt.yaml: example-0: pmux@24190000:reg:0: [0, 605618176, 0, 65536] is too long


See https://patchwork.ozlabs.org/patch/1345570

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

