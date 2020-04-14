Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41F1C2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:22:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9FAA2054F
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586888575;
	bh=195q/pF6nbTpI1px63M8OeAg6vvWIOdJDA2JDpZ6Yxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2j040w0EcQOrspkzmK0vXiz7TQGUbCnY/0i9xIzLgRyAEuc0GfqP7yUdY1Mpaa1c8
	 McBCKmX8l45FP6rpxxWRsTDtXW2uTRVEvjqxo758aelUf8RjejcVgboita5y+VrsZx
	 FjO+mN1LnxK5O/RMqJd9ED5gkCXMdcCHOJM6AnmM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503843AbgDNSWt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:22:49 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40322 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503836AbgDNSWk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:22:40 -0400
Received: by mail-ot1-f68.google.com with SMTP id i27so642517ota.7
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uZUhJk9RG4n2nHH8maECnVbbQCyLJ6sX2FQBvOd5hJM=;
        b=mrgPYqoDR3am0JoitPNd8yfc0HGxRkm3sB+IoZ7fSiz+vlUmwo6KFS4jfcIZafjhrq
         sQcXh7OLu6lUEsOsWGNfoHVsfnmndYYt9XxbJ2ZLRDqbpxuGyU+eI8X6mA9weHp6iC6b
         7o1vU+eJvqvcHwzhZ725ZBMih8AlImGh2ti1+M7jh2hZeoJr2AzsGL/H0zUV79H9kamy
         IiXc1lRcBf75ItJIes1a6m5XKVeM6Xi14abbcp2CzSYFrsU3zWEpDuwoJOTkQbgG/hYS
         ycpvAHlO8cXlXbnXkAxOMIiNMhnlcruryR3KGIcr5NBUieqegGlXnQtinJY1lHe3nTUB
         ObBA==
X-Gm-Message-State: AGi0PuZKM1rUfpg09+rMrNdL48gFqWJeMGJBRwv6DMktIDaY5wA4H1r4
        CH8srG5PrEzX+klIsUzjXQ==
X-Google-Smtp-Source: APiQypIr3jipNBz31YgokkRv69rs1cbC//NOXH/M/K/yHL4tIy/S0qNCBdt9QZbOIx23krkPaZW6Lg==
X-Received: by 2002:a05:6830:2152:: with SMTP id r18mr20378428otd.338.1586888559597;
        Tue, 14 Apr 2020 11:22:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p5sm154543ooa.14.2020.04.14.11.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:22:38 -0700 (PDT)
Received: (nullmailer pid 7604 invoked by uid 1000);
        Tue, 14 Apr 2020 18:22:38 -0000
Date:   Tue, 14 Apr 2020 13:22:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <mripard@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>
Subject: Re: [PATCH v2 04/36] dt-bindings: display: convert samsung,s6e63m0
 to DT Schema
Message-ID: <20200414182238.GA7528@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-5-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:50:37 +0200, Sam Ravnborg wrote:
> The binding for this panel is a SPI slave.
> 
> v2:
>   - Drop use of spi-slave (Maxime)
>   - Introude unevaluatedProperties (Maxime)
>   - Drop reg entry in example (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Jonathan Bakker <xc-racer2@live.ca>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/samsung,s6e63m0.txt         | 33 ----------
>  .../display/panel/samsung,s6e63m0.yaml        | 60 +++++++++++++++++++
>  2 files changed, 60 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
