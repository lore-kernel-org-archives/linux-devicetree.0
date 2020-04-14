Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7DFC352BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:35:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43BF02076C
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586889333;
	bh=2HXjwl0un8GIM9IQviIZ3ZPa9gPDo7ZIgMmM4yP5E1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=x5s4ynSWu17JEYtUemTZGnRPdF9QYuddJz/Lf/Qqfbw+7YmEXPjZVFeJNYyenAsaU
	 bIFdM42fFOJI7RB3HigzddyT5zYnS2qjSFzBADQ8EFsaDMtjcqcI8/2QpmEA1suXxv
	 wn5ZBQmoeY6MSVlQDCiOxUjK5XnsEFOnlsTF4ZTA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504054AbgDNSfc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:35:32 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45947 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730984AbgDNSfa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:35:30 -0400
Received: by mail-oi1-f196.google.com with SMTP id k133so10601140oih.12
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fV7vj2hdsN/omKrh1X0aQ+zsFE9pUR8bPAA1ylHGHnc=;
        b=d3VEXR1Wh9dOvingRGmxljK6gFx4GtcewDMi+4npMwFa+LipPwHoMQL14WfdgC+M9t
         gBI9/ig4F27z+6gA45BvWDOqATClbZBSEuh8lWBvFw/w3ge5diejDbCv2S0nLBitOpx0
         juvTb+YoyEpde8sBjaatSVzYAQQ0QlbAk1j+tF3QT/Z2UPnRtMdwWvpabR5XjK4o3Qu8
         TDs3FGfHo93eBMVGnHiMnThUo2TJJ0W35sGJN58eL6lAKSjVESY6kVqBCd4ubn8awmFG
         JBTpP7fiZJOz4Dj3tKnQzzwlNeTJNDTJN7Hr7LG+bs7bwVU9LfmCdoYs9v21dQnxFBto
         Jg4Q==
X-Gm-Message-State: AGi0PubDmbI5je0JXw/MYmsnUeWw3oY8WJ3yIru8ssDqlIfk9I0gTGCM
        ljvVb3XIW6olFSC+2xGVhg==
X-Google-Smtp-Source: APiQypJY0vPZjljdUXaMHLmjIMz3V2j5tiJWfzw53eV6fYU4IVdOitVJ9RMLmiT4O+j2shITieQqtg==
X-Received: by 2002:aca:c70f:: with SMTP id x15mr16071865oif.80.1586889329793;
        Tue, 14 Apr 2020 11:35:29 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f1sm6367367ooj.38.2020.04.14.11.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:35:29 -0700 (PDT)
Received: (nullmailer pid 11895 invoked by uid 1000);
        Tue, 14 Apr 2020 18:35:28 -0000
Date:   Tue, 14 Apr 2020 13:35:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 17/36] dt-bindings: display: convert
 osddisplays,osd101t2587-53ts to DT Schema
Message-ID: <20200414183528.GA11819@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-18-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-18-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:50:50 +0200, Sam Ravnborg wrote:
> osddisplays,osd101t2587-53ts is compatible with panel-simple-dsi binding,
> so list the compatible in the panel-simple-dsi binding file.
> 
> v2:
>   - It is a DSI panel, move to -dsi binding (Tomi)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/osddisplays,osd101t2587-53ts.txt | 14 --------------
>  .../bindings/display/panel/panel-simple-dsi.yaml   |  2 ++
>  2 files changed, 2 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
