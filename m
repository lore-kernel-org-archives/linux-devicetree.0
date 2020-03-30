Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7573FC2D0F0
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 20:19:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44FA820786
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 20:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585599568;
	bh=aFl0vEL7pqkq1HZpLRFvF0GqXCEYtvp1MXsnaDax7tY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XYrSepNwTcoQfzSHHHzkTkGDAXPl1gnHHSNB7sWpG1fmt35ry+/lxVpiehzYlJ6eP
	 z/xMybPScTSaZltqd8zwM+k29oVvLySj0g/WUt5mIzrsdpvJcYIehSa1Y2wLoCem/b
	 sFHAU7Ks3j/8HxcOtb+bYjskTYGZYbPOpZTPy/74=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgC3UT1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 16:19:27 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33337 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbgC3UT1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 16:19:27 -0400
Received: by mail-io1-f66.google.com with SMTP id o127so19276059iof.0;
        Mon, 30 Mar 2020 13:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4+B5KPfmqHi4jL+IOh4GSbmNe+HhynnKacqo47ghy28=;
        b=P+m+x/ileLseCPwrm5z9HtMmH2vIjmCSBx60Eo2G5ybGGY762XpyL64AMKh84HVHty
         RKmEh8bUqyFSNgEbkAuqdcBswQi6MTtiru9kgMTzKbU+F/7+5hesXJ89cXuNt1suze44
         C3tFpcAWvvi0TRTHocWIPFgdTSJjJTbid6hb+z9hLmwQ3dIAXh97HCl4LysMEHcuJ8iK
         XFrwG4HaCycSXrV+dIqpMBpyGRcmm26lHRJ7lITspiifaotaDki/X8HMctWgXfPfuKEr
         hA3aAaRuozZc5ITQhnIU0KnaPMLLWQZXbcth2/ziSq4b1FWLigLtYv5aWqqudulZ8KKZ
         ISUA==
X-Gm-Message-State: ANhLgQ2G5OmCPqIhpzUA0V42ZfyA6OCeNH7izlvsL9KS32RKfbLorgRY
        jePBRN305a9E4K1smOjLmg==
X-Google-Smtp-Source: ADFU+vsaH8Pv63jLoRKaCrDwfKhRCRjRZ+DrReAXWpjE1MVKJ4jLGzqYS6HC6HvOPgJN5qW6RrSkmQ==
X-Received: by 2002:a5e:8703:: with SMTP id y3mr12021465ioj.119.1585599566348;
        Mon, 30 Mar 2020 13:19:26 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id s69sm5157579ild.70.2020.03.30.13.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 13:19:25 -0700 (PDT)
Received: (nullmailer pid 8985 invoked by uid 1000);
        Mon, 30 Mar 2020 20:19:23 -0000
Date:   Mon, 30 Mar 2020 14:19:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: pwm: renesas-tpu: Document more R-Car Gen2
 support
Message-ID: <20200330201923.GA8929@bogus>
References: <20200316101453.27745-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316101453.27745-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 16 Mar 2020 11:14:53 +0100, Geert Uytterhoeven wrote:
> All R-Car Gen2 SoCs have a Renesas Timer Pulse Unit.
> Document support for the missing variants.
> 
> No driver change is needed due to the fallback compatible string.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on R-Car M2-W.
> ---
>  Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied, thanks.

Rob
