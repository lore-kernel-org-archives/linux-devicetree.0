Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36009C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 18:24:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E7592075F
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 18:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589912670;
	bh=etgePzPVcg1jqcxKadMrwsUE+8r3oPlhw/kaXggxmYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wbUVP/HHqfZRaUYBlRypC4hYCo+ruDsn6aoLaWx+dvigwFKSxoHdxYdHymBPTZ02b
	 Ox3o4Qj8W11ENPG69y6/udh7WZfsijWeHbOmdevXF10BG59+6Wkkfq/YNNkQgvgxE7
	 L6gdej/d9pK7sxn41ttvv+7fexIOAibBb96a+aFA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgESSY3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 14:24:29 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:39194 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgESSY2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 14:24:28 -0400
Received: by mail-il1-f196.google.com with SMTP id c20so363431ilk.6
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 11:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xT09u8dEvKu+XyjEYZmIAHwHovsLj8ADhN/tUxbGRY8=;
        b=j/4W9RvjmYBzpS9GOi1A5MIF/tZcT6YebwJrAwlujiMud3HbUAh7OSUOJtupyK2KVC
         XeGm7TyiJrNKOc8RTbKPteVs4MFSk6pL67dF1Dqj4Njw5pSsy6E9f5KKG/u2VoJ8u8aO
         Li/HLI/3/bUpxwmHIGfUyBeaBfW5AZm+HLStEHKArUQrUZNidoQnpCBNEgekO+Dy0kkQ
         UaSBOEZk6bc/UYXzaEWCTKYmYOvudY2TBQechXguneY0PWIDurLhehPmnyib0AD3YD0H
         7m2UHBx3FV/rFjgyoYOruBuePoW67xceoNEC0xPiTb5ZcyXy+08rTu/76cd1tzBdX1F3
         VzCA==
X-Gm-Message-State: AOAM530piyQQyU1b++E6RV+56H27THZM1LLAEH5MxVBorgSLMbbcTSUW
        iRB71Q8kyR8PM5JyDNfcUw==
X-Google-Smtp-Source: ABdhPJzFEuKffzdVCSm0YyWY4IiHhMKZxTZV43hefjBbI46QKAk3OWS1rEltse9D/nsN3rYL6CsJRg==
X-Received: by 2002:a92:3954:: with SMTP id g81mr306898ila.105.1589912667636;
        Tue, 19 May 2020 11:24:27 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c13sm92805ilu.81.2020.05.19.11.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 11:24:27 -0700 (PDT)
Received: (nullmailer pid 418276 invoked by uid 1000);
        Tue, 19 May 2020 18:24:26 -0000
Date:   Tue, 19 May 2020 12:24:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     qiwuchen55@gmail.com
Cc:     devicetree@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>,
        robh+dt@kernel.org, frowand.list@gmail.com
Subject: Re: [PATCH] drivers/of: keep description of function consistent with
 function name
Message-ID: <20200519182426.GA418146@bogus>
References: <1589209497-13945-1-git-send-email-qiwuchen55@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589209497-13945-1-git-send-email-qiwuchen55@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 11 May 2020 23:04:57 +0800,  wrote:
> From: chenqiwu <chenqiwu@xiaomi.com>
> 
> Currently, there are some descriptions of function not
> consistent with function name, fixing them will make
> the code more readable.
> 
> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
> ---
>  drivers/of/fdt.c             |  2 +-
>  drivers/of/of_reserved_mem.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Applied, thanks!
