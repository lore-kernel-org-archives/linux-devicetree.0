Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE81C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 04:08:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6852320723
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 04:08:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aDyIrVEV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388466AbgE2EIE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 00:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391080AbgE2EIB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 00:08:01 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D541DC08C5C6
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 21:08:01 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id k22so518068pls.10
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 21:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=blfLTQ8AXvWApf1/HEAMujKiLPEaU1hVA3OXltkKPFM=;
        b=aDyIrVEVyonnjpvrsy1C4E5ng5f/zsS95lj82O9yN+h5UfMRmrNJHJ4Z59I+AMyxGF
         mlMaM/XQXBkYUPlkVmCjel1GFo2yZnCrSJO/sDZVelbaIKk1c+YPajeS+zaRnUT6zesQ
         YlPRWbLDOxX2wX6cpAqcKIuoRSnec/KqwZzcEM4lwf4JWlTspk/cIz+CIhGgW433imGk
         UQZo1Ai4TTsS3yCK+STK5bOOmDHUiFl+bZgHvd8IABTcsEY6P/7yZ66qDIxZeW8r+Udm
         hw7UM7Tu2r2HCQh0yHTTWmvx0YloqORi+w3i9ehwcJh+H/BO705+lZQaK7Trry0HyATa
         qEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=blfLTQ8AXvWApf1/HEAMujKiLPEaU1hVA3OXltkKPFM=;
        b=Thc+U5dshYo3lgaUwBSyIDwYwmaOiM/hWAp/xBzoJqM16TQtqEuRaGS3vljTYZUrcz
         tKwXaj3/KFkHRlKUml4KgeW07RklX07iR+6uKlN2gym0B10xiFJ5sWzj+JsYkCcMoNAf
         jofEoLi6aJ4vU0v94KkCbtoKlZjRWU7sL9auwP6nYtp8B/bckGMlW3sUgXrWH4o9XzRw
         IkD8wHqA7WiXH7GWfFO/sRTUz+w7xjPZDM31w/xoDKln5qpev9IfW/pszbS1Uw+4e7yy
         m65UvKPQrMt1VNX5i0GyQ6HG0/EvsKclegMgI2JoZ4Z4oGW2sgEjQdg/JioiEnH/XIHl
         uv5g==
X-Gm-Message-State: AOAM532wOH5H9RfwfBqL0u5QNKzKRmSUXcTON8tfXYEH5lhXylR7y3nq
        Z+iZeXcf6M0qAi19zrGNX93Ofg==
X-Google-Smtp-Source: ABdhPJz06MPKrnYiQjl2aYS2OiLYzIlNkn9of65Fn9om3cFtzDZwYzRQA7dzd9nGBdXcUmk7igXl5Q==
X-Received: by 2002:a17:90a:9f02:: with SMTP id n2mr7758540pjp.173.1590725281193;
        Thu, 28 May 2020 21:08:01 -0700 (PDT)
Received: from localhost ([122.172.60.59])
        by smtp.gmail.com with ESMTPSA id o11sm5945789pfd.195.2020.05.28.21.07.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 May 2020 21:08:00 -0700 (PDT)
Date:   Fri, 29 May 2020 09:37:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Frank Rowand <frowand.list@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] dt-bindings: mailbox: add doorbell support to ARM MHU
Message-ID: <20200529040758.kneg2j4n3gxh2rfv@vireshk-i7>
References: <0a50f0cf5593baeb628dc8606c523665e5e2ae6c.1589519600.git.viresh.kumar@linaro.org>
 <20200528192005.GA494874@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528192005.GA494874@bogus>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 28-05-20, 13:20, Rob Herring wrote:
> Whether Linux 
> requires serializing mailbox accesses is a separate issue. On that side, 
> it seems silly to not allow driving the h/w in the most efficient way 
> possible.

That's exactly what we are trying to say. The hardware allows us to
write all 32 bits in parallel, without any hardware issues, why
shouldn't we do that ? The delay (which Sudeep will find out, he is
facing issues with hardware access because of lockdown right now)
which may be small in transmitting across a mailbox becomes
significant because of the fact that it happens synchronously and the
receiver will send some sort of acknowledgement (and that depends on
the firmware there) and the kernel needs to wait for it, while the
kernel doesn't really need to. There is no reason IMHO for being
inefficient here while we can do better.

-- 
viresh
