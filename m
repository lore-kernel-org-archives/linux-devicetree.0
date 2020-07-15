Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822A5C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 22:09:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A5962065F
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 22:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594850963;
	bh=DSZsjoyCOCsReRg8iiRclXuUu/fznXGewkpPC4xc62g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PRcaJQk6zXr4ujIo5TwtfEnkaUc8oq764C/4N+3y8psD5BLb7cr0+Fprc7gCk+7Dt
	 ZfGihP9AlV4HbyOo71jljQyXxKbUcKf9mhMOG9FDuY4Nyd1OayK79J5mL4MZ32Bgl6
	 9IJWaNUPGlW7Ca7Fz24B3w27S0d/5jpFQbLMksOU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgGOWJX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 18:09:23 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:45548 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgGOWJW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 18:09:22 -0400
Received: by mail-io1-f53.google.com with SMTP id e64so3914725iof.12
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 15:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xn5jIa76g7gx0OoxSi/M5tGMd+ItITsCiEbCKsIiVN8=;
        b=RwVKBQpej3d3l0ZWEWOPWMx7ioKCmVwaQkGL7RJEfzt99fTd2u1n4qBx98glRvkh1y
         Bm4vEmunseDWoKsa+rV/voJ/c0jZDa3I2YhCseEMKRwePBwDF59+XExdrk2vP0Q++k1T
         zDdpsYImr1faBZuW7C2m4yVnsGr8clTDck5zZwL0gS943rORkvkX7D6oGWMZjAF043Oa
         k8OVrbhZvg+HUTOffubNc/RzpYX/49r0yXZOJ3z4/gaWW7zQVlrJ6Q5Sbg8rEOJIPZ8R
         haXyMznbb3H+PTndS//ZbuC3RpqgyYc5NohOHy78BV65cZvuUZowQndLlQ7Z/Fc8XonT
         fwEg==
X-Gm-Message-State: AOAM531tcpUHJqz5kNW0ES2xKJemf4oEboSQBirhBc8o9CBZb6oZ1/w7
        uUggh4Q0y1oH9njRDNcvUg==
X-Google-Smtp-Source: ABdhPJyencf1AvFsxgRmIS+aOs4uA7bSB7KI2oNAVyobT/QGkMOSz+fPkhZHb17MIPS8xpxF2nFcKw==
X-Received: by 2002:a6b:691d:: with SMTP id e29mr1420360ioc.159.1594850961741;
        Wed, 15 Jul 2020 15:09:21 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b24sm1744162ioh.6.2020.07.15.15.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 15:09:21 -0700 (PDT)
Received: (nullmailer pid 903768 invoked by uid 1000);
        Wed, 15 Jul 2020 22:09:20 -0000
Date:   Wed, 15 Jul 2020 16:09:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH][resend] ASoC: dt-bindings: ak4613: switch to yaml base
 Documentation
Message-ID: <20200715220920.GA903738@bogus>
References: <87mu4cxlo2.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mu4cxlo2.wl-kuninori.morimoto.gx@renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 07 Jul 2020 08:35:10 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> 
>  - 2weeks passed, but nothing happen
> 
>  .../devicetree/bindings/sound/ak4613.txt      | 27 ----------
>  .../devicetree/bindings/sound/ak4613.yaml     | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ak4613.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ak4613.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
