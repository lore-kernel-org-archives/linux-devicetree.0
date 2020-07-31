Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65954C433E3
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 21:12:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CE8922B43
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 21:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596229964;
	bh=D05iRcVJwOcmTfo8PceQYUJWbJHxgM2/Ju+UQroz2Sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=A6kp4trSUsoFQIP7rKUtxVDc2LxKWhbFK/g3zDywMNcS93G0R48V0/JhInjGqvYZs
	 IaqQKEl+Z3IbEw5AcOsijsHtoSpwxBo9hsaVXIqw+cNdPPjLcPnjgm+5ma5yYcl1xv
	 PdjJMYIKzfGVn7HezOWDuWlkve5U+h8P7WIhzG6U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgGaVMn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 17:12:43 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33774 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgGaVMn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 17:12:43 -0400
Received: by mail-io1-f68.google.com with SMTP id d18so33025856ion.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 14:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pQcDCvIyTL85E1igV+Ze6j95UbBO0x3+Ju2NfYedtmY=;
        b=p0nhOwvoO32v2dNbkCM760jIRUL9U2AFRppI+6VNtBEUoyKpbMq4bwhl+iuPyELzAx
         3jJYmqC0ex6UACxDah5Q2/WeYVRuiZeRXA0T6vgyjG85su7Nkl3e9k1aLa032QNeOzCO
         zwAnbnz+J7vOjjDk/TG98EXRW3MCvK9fwoUtxiCHGt/lRdidPKAccMeWs3UMRfR96yg2
         1IbhmKa1g72SWS4aMS2QWgh4s8TahypCz8hFhmdruz6a1acfae8pP+dJwa9lvBo1S6Hn
         BjppR9CIDq3ix9A4l0yy2u/rmH8z4Db0Yn0Dv5vOI0gMBUoJDik5Jg+cC1dhq50POhNR
         fUiA==
X-Gm-Message-State: AOAM531Z5WpfgjMHrQWmAFFHWer/D1zvmvEwEMJHNeqVW4Jxq/kgyzlS
        6QF+cafHiupWCrTx04C0/w==
X-Google-Smtp-Source: ABdhPJys85Ij0b9vTldeq5s1VeJLpEY1fhMNq9zPKVcCpELIAayLKalQlNqnOxF5N162R6Hk9odE9g==
X-Received: by 2002:a6b:fe0f:: with SMTP id x15mr5493961ioh.173.1596229962114;
        Fri, 31 Jul 2020 14:12:42 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id o17sm5397271ila.35.2020.07.31.14.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 14:12:40 -0700 (PDT)
Received: (nullmailer pid 798687 invoked by uid 1000);
        Fri, 31 Jul 2020 21:12:39 -0000
Date:   Fri, 31 Jul 2020 15:12:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: Add vendor prefix for Chefree
Message-ID: <20200731211239.GA798580@bogus>
References: <20200728201242.4336-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728201242.4336-1-marex@denx.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 28 Jul 2020 22:12:40 +0200, Marek Vasut wrote:
> The Chefree Technology Corp. is an LCD panel manufacturer.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
