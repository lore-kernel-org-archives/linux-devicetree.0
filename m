Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9964C2D0C1
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 19:00:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B361A24679
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576782048;
	bh=u+sylcCECComFKkVD1hBmKCrMT+W6xT0l4suPQ2ILPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rxCcMLJ+WWjmIGf8QpciNMg0ZEzPqa/53P1k9u4xw06dR8rUP05zlhyRCQU+UsXcI
	 RXVD2hECLuiN83iG7NYdLKc8HGd1A6Y+IzVuqUfx543HXhq5SwAxNYJa8KxrzNfMHq
	 6H5uHysFj5AEyMhIDy6K+sQD68CHEER9K8fSOhn0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729658AbfLSSvp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 13:51:45 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42225 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730165AbfLSSvo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 13:51:44 -0500
Received: by mail-ot1-f68.google.com with SMTP id 66so8373982otd.9
        for <devicetree@vger.kernel.org>; Thu, 19 Dec 2019 10:51:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jDKOiQm6CiWD+arXinOt70p97gMJaj5GatnJKvcbSa8=;
        b=eAyjY1Bftm0kyTuV1rMug3bqyxCU/u/u1yobc3IVFOdsSnG1H7N8+r6N2H17WRiRZ3
         TurgYYVb7OITfE1AylbnV4YbwdO7ruHk7OiOYqhh/0Zf9UqpPVZd0a6Bu1koAjc3gjyP
         SuCpPE12vypEZzicQQddDoZrW3v2rfomsHWxpFvO9aRy0EYK3v1qBB8eioHBHvQdf4Pl
         T5S7Bx4cSIkX/gNDehjkaqIy1VG0hq7fYuIplRd8uXRAcRoi5bydiwuSw7/4b1FZhg9k
         iBSBeftlPDgaYLzgyam0VHQvE3j2QpH40u8SHFZSTnnY/cFQVjRCUcShZVW2A98aXQRS
         Qckw==
X-Gm-Message-State: APjAAAWaM5gcjyDYsaXn2wGpB8tZbDIEnz3uiABnC/tYJVJNtTXhXPho
        KCq96l491sxPKsxdi0JHCw==
X-Google-Smtp-Source: APXvYqyWxNLUP+RbaYbruoe6GyTJmpo9lUdUShr+XyCaG4pNGZfSjVIJwUXJQ6K1i5tp+MCBImVxkw==
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr10709067otq.281.1576781503951;
        Thu, 19 Dec 2019 10:51:43 -0800 (PST)
Received: from localhost ([2607:fb90:bdf:98e:3549:d84c:9720:edb4])
        by smtp.gmail.com with ESMTPSA id a136sm2272824oib.28.2019.12.19.10.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 10:51:43 -0800 (PST)
Date:   Thu, 19 Dec 2019 12:51:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        tomi.valkeinen@ti.com, thierry.reding@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: DT schema for
 rocktech,rk101ii01d-ct panel
Message-ID: <20191219185141.GA31089@bogus>
References: <cover.1575903975.git.jsarha@ti.com>
 <60034f9cd4580bf3b7c8c5c87bb9247fdc3f345a.1575903975.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60034f9cd4580bf3b7c8c5c87bb9247fdc3f345a.1575903975.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 9 Dec 2019 17:45:40 +0200, Jyri Sarha wrote:
> Add DT schema binding for Rocktech Displays Limited RK101II01D-CT
> 10.1" TFT 1280x800 Pixels with LVDS interface, LED Backlight and
> capacitive touch panel.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  .../display/panel/rocktech,rk101ii01d-ct.yaml | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,rk101ii01d-ct.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
