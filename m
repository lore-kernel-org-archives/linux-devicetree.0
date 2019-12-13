Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42309C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 23:40:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23D2A214AF
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 23:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576280403;
	bh=fzAYiu052WMmgPRR1qMLacPJ7bmFaVOytPeGlFnWvAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PHZlFZ4CozEN9GVjgOhDAg1yQ24jz2ygEs2L3fy5TWRLH9Pq0WwM+GuGSdHKxZScY
	 d1/58HhkvHKIKUBTuMsRGg2OMV6QhMXmQ7rJRPKr0rit/CvCmYEg/k1BOiyA/Xvzmo
	 DM9nX3QS+GYDIXlJJmMD1heMdMi2DXLddQbsJSVY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfLMXkC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 18:40:02 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33758 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfLMXkC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 18:40:02 -0500
Received: by mail-ot1-f65.google.com with SMTP id d17so1104147otc.0;
        Fri, 13 Dec 2019 15:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FMz0fG5gHb4A8KfuLCFEZRIN+DFWIcz4co491YcnvaE=;
        b=eJx7jISbFwfhcwIqrf7yakqxTx1PQJb1dlq8iYek6Gz0ttbQZf3o7a1GtnUO6YYSki
         cDt6bm9zOwLt2M4SNCjPzQyR2SYbh7H7895z7kYe4wjgi1ZdP51sPCo6h4F5UQfXH7wf
         fD554nlBPzlVGDP4ZIw6t/s1lXEWdOVdywOMGP+AFJoXifZhya0djQqd0WNbv7EU29H0
         onzyczZUbHnSXasNIwNhuplVDqjMKTdXZahLr+XObeyxsxE4LVElD64vim4pmMKBoqW9
         hBIIK57jc7AU43EcohxW8dbwUwj4wHWt6lU9szNWvgrD2sXiTRnOeASaHX4kxuoqoks9
         lglg==
X-Gm-Message-State: APjAAAU19OG1b0XT7me8EP0u1WheyhusmEzs/QZhbyY+7jveryNQo+0S
        3W8gJT0mM9O/yCvfyoYLIw==
X-Google-Smtp-Source: APXvYqzNIlI8IKuEgpLyc52LDy7dNmu3ZdM+rQ4zQ3kkkBAw/tZl1kZS7+A7dvDJa6gcoXQDvrnqLg==
X-Received: by 2002:a9d:7e8a:: with SMTP id m10mr16535422otp.27.1576280401172;
        Fri, 13 Dec 2019 15:40:01 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m2sm3845047oim.13.2019.12.13.15.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 15:40:00 -0800 (PST)
Date:   Fri, 13 Dec 2019 17:39:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, letux-kernel@openphoenux.org,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: fsl-pxp: add missing
 imx6sll
Message-ID: <20191213233959.GA8730@bogus>
References: <20191202204748.6718-1-andreas@kemnade.info>
 <20191202204748.6718-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191202204748.6718-2-andreas@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  2 Dec 2019 21:47:47 +0100, Andreas Kemnade wrote:
> i.MX6SLL also has a pxp, so mention it among others in the bindings doc.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/media/fsl-pxp.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
