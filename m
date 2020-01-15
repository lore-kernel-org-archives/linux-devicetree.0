Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C6AC33C9E
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 00:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F2D724680
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 00:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579047240;
	bh=o99VYj9QAJKjSjhe+9wP5e0VNI2EIcMvsthWPeGFNUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PI47V1hn9O9+Z/kob4tB65nhQqpNzjMHCZV1kgV0x/6teDZIjAMaJSVXPdfqZ9F3a
	 OgTccCOOKaxMAGLk9IrLBwcu2ujYt9CBIHP586UVN4hLLNPFcnloz1VSDYYLsQclxl
	 Z+TRYCWIJRvfr2/pVS3M8zPXVPetsdNa2qYF3fOE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgAOAN7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 19:13:59 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37462 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbgAOAN7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 19:13:59 -0500
Received: by mail-ot1-f68.google.com with SMTP id k14so14533444otn.4
        for <devicetree@vger.kernel.org>; Tue, 14 Jan 2020 16:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vm6D/kKtAQPyA/3q2QOxNghbHuIfBqj+2jZduMBeUh4=;
        b=M89qj6JO7iv3JCYH4JmjuesCDDfwcqUh/7ltYoEk0k8A+3xdKt+AL0B/HYyl7S83nF
         i9G6Vz+T2re8dK5bjbXGXtJaA27PU53itlY/O7LCsu13rrr1A+BIrMWpAcdD0Yw/rsVK
         UOf8Av33qrASlp14uiyLZ7nDHlq/C0d3zzlZX02+iM4bDx0babQjPB+1KFe+lqvb1po0
         EoHijcLjAyijqMmuk4JjE7Glcja2ZQLLngThfCxY+ggAS/HdwNWG6iW4c9Ns8RnfDzLA
         k6Gn5P1IAnvCYX3dUYfUnbXI92IannYjG3QD95kqXl6Osxs1vtYo6Zfn/hMtBK6iEE4w
         lkyA==
X-Gm-Message-State: APjAAAVBoKA3g0CDNDsqTRJOc5s/FlwY+RejalGouWavFmb6PIsaP1Lj
        2IG3dTCPmqxp2/DCA1eZU0vs5Ss=
X-Google-Smtp-Source: APXvYqxLTL0NMpci+FKHOy47KCHKkICakJpmZoWiRH0M4OD9Xhn27zPHBzSCqAXa7KyEWnYSuwsMkQ==
X-Received: by 2002:a9d:4c94:: with SMTP id m20mr800770otf.341.1579047238629;
        Tue, 14 Jan 2020 16:13:58 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z21sm5920234oto.52.2020.01.14.16.13.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 16:13:58 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220a2e
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 18:13:57 -0600
Date:   Tue, 14 Jan 2020 18:13:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        mark.rutland@arm.com, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V2 1/3] dt-bindings: pinctrl: Convert i.MX8MQ to
 json-schema
Message-ID: <20200115001357.GA16961@bogus>
References: <1578629120-25793-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578629120-25793-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 10, 2020 at 12:05:18PM +0800, Anson Huang wrote:
> Convert the i.MX8MQ pinctrl binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- use "grp$" instead of "-grp$";
> 	- use space instead of tab for "ref$";
> 	- add missed "reg" property;
> 	- remove the "maxItem" for "fsl,pins" to avoid build warning, as the item number is changable.
> ---
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        | 36 -----------
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.yaml       | 69 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml

Actually, it looks like you can combine all 3 into a single schema. The 
only diff is the compatible string.

Rob
