Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B35C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 15:35:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98EE0207BB
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595518514;
	bh=Am4bAFAqnJHaLkfdIboD6tIZjH/M6xBfasVk1vaR9Ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FeFg34SgzMN9gmJTkxuidh4qkJaxfD9V04KObNEX1NUWGs9tLFxM4TvuucOt65LzG
	 kJLLd6l6GschpWqnxKy76zjAV6IZ8gNWNPm3688X3sDb/NRF+Q8I2y3KkQUB3LZs4+
	 SuwEu/Im+8MM4ZD9Jje07NzB5Po5kNJyrvBrx7N8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbgGWPfK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 11:35:10 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:41750 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgGWPfK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 11:35:10 -0400
Received: by mail-il1-f194.google.com with SMTP id q3so4673234ilt.8;
        Thu, 23 Jul 2020 08:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dZ9w6Gg1I+5TyudOL4Ziff5WVtPVok9y/b0dkDwPuLc=;
        b=OG2Bls5xZwfjefmQsus6d0vek3E8B8yxW1wY/WInDHLmxNFPz0HD9psc7kwLJ/vkVn
         9drgyKGJSRqxLjd2SHiwmi5SSENfAwj2R7xFrPe/HTy88fW5ekCxHoI+Fm2trvEuQaZF
         aGHX52J/EzHqDWuVJoi/wY9moO2RZ1p05jgVopOMGnBSvYNQPHFPq+f4V7/+iSSNITBa
         lU32Wi45Ab3R25a1UR/ZpvNtX8sPdUixbt4YOIY0HrAvToUT9gt2IMjy9I+pJtVtSAvZ
         uVeNnT3Hl5ZMimckkTalTp0yt+PpKSr7cWBbLOyju8vSuRdLoHduEcb8123g3Q/QBO05
         WB/w==
X-Gm-Message-State: AOAM532j3TLupyeKIwTNZrKe3p8hUE8mizot7uBniE1HJFlgNlShQgCA
        NOil1hGWQu+duoqzs1LJBQ==
X-Google-Smtp-Source: ABdhPJzeM9ILYJ5TJge2yNr221J8BDFH1BL7BBqU4YORYaPXg23MsgPcF8lm36Sk6qZeh7eBKeazlA==
X-Received: by 2002:a92:6a02:: with SMTP id f2mr5012151ilc.68.1595518509594;
        Thu, 23 Jul 2020 08:35:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f76sm1664971ilg.62.2020.07.23.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 08:35:09 -0700 (PDT)
Received: (nullmailer pid 414926 invoked by uid 1000);
        Thu, 23 Jul 2020 15:35:08 -0000
Date:   Thu, 23 Jul 2020 09:35:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Christian Eggers <ceggers@arri.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: usb: Add Microchip USB47xx/USB49xx
 support
Message-ID: <20200723153508.GA413741@bogus>
References: <20200722183859.24470-1-ceggers@arri.de>
 <20200722183859.24470-4-ceggers@arri.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722183859.24470-4-ceggers@arri.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 22 Jul 2020 20:38:58 +0200, Christian Eggers wrote:
> Add DT bindings for Microchip USB47xx/USB49xx driver.
> 
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  .../devicetree/bindings/usb/usb49xx.yaml      | 230 ++++++++++++++++++
>  1 file changed, 230 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb49xx.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb49xx.example.dt.yaml: usb4916i@2d: 'ocs-min-width-ms' does not match any of the regexes: 'pinctrl-[0-9]+'


See https://patchwork.ozlabs.org/patch/1334134

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

