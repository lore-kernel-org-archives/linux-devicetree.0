Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937C1C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 22:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6420B2076A
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 22:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591741786;
	bh=w5ZJXPvXvQWqMJpHLz2bkN22+VbVANrm03lw2vZSw4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=q7HonPKoiE3uz8L3+aXjEzn6bhklpkpwMEnCwo53qwzvqNpTO+DnXep7m+jghrky3
	 J5q1nqJ5AgDGHRUGHm7pUKzNsY2otMUlZtNjPoo/HeNNxx1HQk9SUzfWBNJmyYXPLv
	 +hH6x8Uv1bxkeRLK7SipnU1GqsICaaaM6HBUuRXU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgFIW3q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 18:29:46 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:41291 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728088AbgFIW3p (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 18:29:45 -0400
Received: by mail-il1-f195.google.com with SMTP id c75so35478ila.8
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 15:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9eU1Sl59BWMKbsH7yc0Bp/cm9dp+5d5ACrcNSF2dGl8=;
        b=drRf7GeUwzBk/RL+davIjAnf2E0F1MybXfxyUBhjenqWSTa7ouuTeBK4VcK3hm4ORt
         2VYFBsGFvUof7lZxAATEb7Y1wRw8579GQYhCfOQgSg2TrBzFZtd/WkDRa34gKWhe219T
         0t9SIcX1xoryEeSAxfHKCAhE/PFFUD5HrpSXbwdrcPYpngy+72lsfANXOApBUuiO/Rkm
         O966lCJvqiEjXrDLCnFcv372aXPbcbdcwKMK6dVwHHLvIbMa4JartYRRMnIG6t2Yen0+
         rWUNbiZX4qQ433NxnLVIzRwZYmMOcpcmLlP+y1zp5HNOB6nuINqX2EqL2NcfKUgz62Al
         qM2A==
X-Gm-Message-State: AOAM532LRQThOXUSoN8xygo6FQF8qS+xHlYTW+EzrnL3XKADHpULk7J8
        BQsrwjbwv1V19fjUhXOpeA==
X-Google-Smtp-Source: ABdhPJy9gLy7HLB8sb8E6mMuJ54nlVrugw1RL8A1/F9Bo4vWIw8hU0kDTJ/yXcE9XNRyKoowjpueIw==
X-Received: by 2002:a92:d0cc:: with SMTP id y12mr215972ila.308.1591741783371;
        Tue, 09 Jun 2020 15:29:43 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id d71sm10210309ill.9.2020.06.09.15.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 15:29:42 -0700 (PDT)
Received: (nullmailer pid 1615866 invoked by uid 1000);
        Tue, 09 Jun 2020 22:29:42 -0000
Date:   Tue, 9 Jun 2020 16:29:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     robh+dt@kernel.org, thierry.reding@gmail.com, linux-imx@nxp.com,
        dri-devel@lists.freedesktop.org, sam@ravnborg.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: panel-simple: Add koe, tx26d202vm0bwa
 compatible
Message-ID: <20200609222942.GA1615808@bogus>
References: <1590991843-24231-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590991843-24231-1-git-send-email-victor.liu@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 01 Jun 2020 14:10:43 +0800, Liu Ying wrote:
> Add compatible to panel-simple for Kaohsiung Opto-Electronics Inc.
> 10.1" WUXGA(1920x1200) TX26D202VM0BWA TFT LCD panel with LVDS interface.
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
