Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C575C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 19:00:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A0A52074D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 19:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586890803;
	bh=fZBIlIpSJ+lT2mEL4oKf90W80HE1m9kX/vhDd2/PPnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=G05oK6fGA4C6ILUDm9xo7i5DzMmu+wPsb9iWulaP8vCwmInIOC0F9KrtCJ2+NIHPZ
	 5X+xGaKUFAH01yRfRy0jg4Ebc2oN9U3va8mFmwh9dSJ2PUAaoQzYmAzKo9LlAZqv96
	 mSY/kdhT/27i2k7cr8WN2kEKndgmWEY1i5yE6VfE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504567AbgDNS77 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:59:59 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43793 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504540AbgDNS7y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:59:54 -0400
Received: by mail-ot1-f65.google.com with SMTP id g14so755721otg.10
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fDnUZtrdKTGiGhnSIeJA6CVXYIU/x6W/2zNXaYe4Y/4=;
        b=bsAIcAnpXBzwJRn5QjiKQXaaimJ/qu3KMzhffh6jD4VPilpCp/ZqTvPePUndlcrL8w
         IYfKUqDcLUUfIIXitCvHWOrUzdVQqjNF1NIn6zHmb5ugp/3JZFJMHjUEGYJh+TxMCrcc
         GqNlvhHwYFmt0xcsdpRLJbazf/fyq1E5xxrrcp+DN260pPl0P5BftfB9lXtju39fFluC
         81eP6zpzdCQxtEZqfjCceuj0FpBNZwJ4LogDFuDmHR7rH4fjzIhUUsAsyIrEn5o5x/Yq
         9nazSVRBTdSUlK7oNLbRj8WWfHoEuEbPFYp5kWhBC+KypYfpePbbDSYRfsLjHRxxjf1/
         XKbQ==
X-Gm-Message-State: AGi0PuaY6SRJzlAR8KZWrBL59avqBFC7Gkh2klJVfbya7JZXnntrjFBX
        nRhGxd3QwF3XbY874QPxHA==
X-Google-Smtp-Source: APiQypJMEqtVXwqiVumLGLRt18GTb050LSYrn1IgXBJZ2GTMevANMBLGsvqYlY9iCvyd3MIR7NTaKA==
X-Received: by 2002:a9d:19f0:: with SMTP id k103mr17841583otk.324.1586890792926;
        Tue, 14 Apr 2020 11:59:52 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l28sm1487111ota.4.2020.04.14.11.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:59:52 -0700 (PDT)
Received: (nullmailer pid 17554 invoked by uid 1000);
        Tue, 14 Apr 2020 18:59:51 -0000
Date:   Tue, 14 Apr 2020 13:59:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Marco Franchi <marco.franchi@nxp.com>
Subject: Re: [PATCH v2 33/36] dt-bindings: display: convert seiko,43wvf1g to
 DT Schema
Message-ID: <20200414185951.GA17499@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-34-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-34-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:51:06 +0200, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Marco Franchi <marco.franchi@nxp.com>
> Cc: Marco Franchi <marco.franchi@nxp.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/seiko,43wvf1g.txt  | 23 ---------
>  .../bindings/display/panel/seiko,43wvf1g.yaml | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
