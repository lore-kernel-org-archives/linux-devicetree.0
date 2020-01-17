Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA131C33CB1
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 16:32:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BCAE02087E
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579278742;
	bh=D3vQQxHg4XNKooiW9TyvC5MoYy6ZrAxKoQUsPSjJyDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=bGrT/xuVN6jXTp0tjYPSZviE91TKCYyiDSu/hPJZlqwI4bQ0w1gNYz5buKv1fs8tz
	 fTTUU4arOJ4xtZNMNduf1rQo3ZWg4Xsn3oOxNVc4RU13b6YbtPu7tY/vHV3xp4i0DM
	 vL06ZmuOOOXd3tWQcj0efdolEN+sJ7EyB05m2j/I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgAQQcW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 11:32:22 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33780 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgAQQcW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 11:32:22 -0500
Received: by mail-ot1-f65.google.com with SMTP id b18so23065320otp.0;
        Fri, 17 Jan 2020 08:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/iHqFPp4gfD5oSMGWpTJjMZQbTl3nDjXtKJqZJn6JG8=;
        b=iC0E/w9lEWn7CiltqNv46rE1vzbRbLmUo0F1SLLxsQsTSAOuFoV4GjQGYzSmzGblIf
         JGf4cqZt4WGmYLBz31Nqdpbo4H6y8KNgFtW9Ice3n2CfA/cCgqqhMOpeJY2JmXYY3YTP
         YUKaWQd7UGEis76uvE6CM7sJQnEoG1PtFp0gvuB0KpSxiNBT+yEofXdG4fctusIpxJwj
         EkaLPgekKMkXvX2mvlYSfhGBOp+OzbJO8fy+DeRbR0ZKjfcZ/Yisi/miBUfLrzshctp/
         06YmOCl3P654e0V1MNU4DCll9dgAjXC7DDKrLlE5N6Xoyy45Mz7wtGecGuNjPpOXNeF6
         myRA==
X-Gm-Message-State: APjAAAWUtXcJOJxeGI4ITxkMn5JyaTwxKuleJHa6Tma0POOdhNelG52H
        eYpq8bSQmevfKz9McUmg0w==
X-Google-Smtp-Source: APXvYqxVhhZJDntpTYO8RXp+1uUVt/4zWCDaLKGWVf9eFo48zxLv0olgodVWAXp81LRL5u91AiObWw==
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr6668144oto.207.1579278741150;
        Fri, 17 Jan 2020 08:32:21 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d7sm7928734oic.46.2020.01.17.08.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 08:32:20 -0800 (PST)
Received: (nullmailer pid 26008 invoked by uid 1000);
        Fri, 17 Jan 2020 16:32:19 -0000
Date:   Fri, 17 Jan 2020 10:32:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v6 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
Message-ID: <20200117163219.GA25603@bogus>
References: <1579220504-110067-1-git-send-email-hanjie.lin@amlogic.com>
 <1579220504-110067-3-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579220504-110067-3-git-send-email-hanjie.lin@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 17 Jan 2020 08:21:40 +0800, Hanjie Lin wrote:
> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>  - a DWC3 IP configured as Host for USB2 and USB3
> 
> A glue connects the controllers to the USB2 PHY of A1 SoC.
> 
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> ---
>  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 38 ++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml:  while parsing a block mapping
  in "<unicode string>", line 107, column 7
did not find expected key
  in "<unicode string>", line 111, column 8
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1224563
Please check and re-submit.
