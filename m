Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC8ECA9ECF
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 18:16:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BC442086D
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 18:16:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=netronome-com.20150623.gappssmtp.com header.i=@netronome-com.20150623.gappssmtp.com header.b="vttfE+yH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbfKASQE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 14:16:04 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51779 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfKASQE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 14:16:04 -0400
Received: by mail-wm1-f68.google.com with SMTP id q70so10175481wme.1
        for <devicetree@vger.kernel.org>; Fri, 01 Nov 2019 11:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sxZpbgKRxXNWGi7JPE5PJWysYsru4FyBDVNdoORRq6s=;
        b=vttfE+yHueTydpOmGzXppeugfpRtDd2BWsq3YaVtIJ2Z0/Tokkp5mPQ7DMvO06zg5S
         Tk4b1yFEhm2Wc5Z0iMzxyARZGJFr0ZwreXVX7yJsX52sKOP4mKT6zJqPUuEj3q72e/qN
         zdgumdE0Dm8GOejq+pRy0oH9hv0NvzIaN9Eql4dQdJh7MFWEPiST+yyb3rh84kZdjAzy
         Lbl9fdSGQ+heCbTnoNhbbjIn3AxlP6cIHb2UG61hvDkl/mO7rICswVRgJzGZWHiMFVe/
         FDfcz4U8pQrhGgrUiPI0OQJkH0yZ1KDSH5NSgbbe7oXPcIDEf2eGdTGHV/3anZOfyOB2
         v5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sxZpbgKRxXNWGi7JPE5PJWysYsru4FyBDVNdoORRq6s=;
        b=nYquE5ZR+JpCv9o6H/viEdi79I9yWR1tcwyIZ/RV/x3y7xDM2W/3Rre0mZTKMj8ypG
         vn0fEx0SjnW+XhOkZdx49Vfk8f5ib4gfF2URxvNDmMqrJi8DsPrn7ye8bPY7Q/b3uqKz
         S0f+LAGWMb7GP74M7JcnXXtThFCzzDpQq0Ir1ZrvBRX7aja4XJNdLU4irHJ3Uj85lajf
         4qKUM37IQt0ysAhbAVcizU0UQ8KE/nqYJQpmK9TEDafTNaVc8M2lDwXe2dlg1m5QsDed
         XQ0ybmPbmOLfsBoIZHyI5ZvGMudIkS9GDb8nNF/fLpQ4eNpdE/mgfaRRsyk9giDh2ty2
         d6Lg==
X-Gm-Message-State: APjAAAV43ey155NHTeeYg4qCAO8iJiCes61EUksKf4/n9YHV9sSRqfpk
        r8Rj+RFbHltKm4QhDNcyWzXqkg==
X-Google-Smtp-Source: APXvYqxissnymQlTIZHuchg7pdEDwKYW3/LTmbLmpkQZw7CfA6kNNHUqMixo6wErYI+CKsI4eGbAYw==
X-Received: by 2002:a1c:a791:: with SMTP id q139mr11147563wme.155.1572632162588;
        Fri, 01 Nov 2019 11:16:02 -0700 (PDT)
Received: from netronome.com (fred-musen.rivierenbuurt.horms.nl. [2001:470:7eb3:404:a2a4:c5ff:fe4c:9ce9])
        by smtp.gmail.com with ESMTPSA id w13sm10336198wrm.8.2019.11.01.11.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 11:16:02 -0700 (PDT)
Date:   Fri, 1 Nov 2019 19:16:01 +0100
From:   Simon Horman <simon.horman@netronome.com>
To:     vincent.cheng.xh@renesas.com
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, richardcochran@gmail.com,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: ptp: Add device tree binding for IDT
 ClockMatrix based PTP clock
Message-ID: <20191101181600.GD5859@netronome.com>
References: <1572578407-32532-1-git-send-email-vincent.cheng.xh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572578407-32532-1-git-send-email-vincent.cheng.xh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Oct 31, 2019 at 11:20:06PM -0400, vincent.cheng.xh@renesas.com wrote:
> From: Vincent Cheng <vincent.cheng.xh@renesas.com>
> 
> Add device tree binding doc for the IDT ClockMatrix PTP clock.
> 
> Signed-off-by: Vincent Cheng <vincent.cheng.xh@renesas.com>

Reviewed-by: Simon Horman <simon.horman@netronome.com>

