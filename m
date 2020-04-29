Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0ABCC83000
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 19:28:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CAE2205C9
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 19:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="oz6BuGxK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgD2T2p (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 15:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2T2o (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Apr 2020 15:28:44 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF58BC035494
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 12:28:44 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id i13so2880304oie.9
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 12:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HrWcuaUF1HhijaMJhHIxXSdQF25IxURehoKzpWG38wE=;
        b=oz6BuGxKcLsvPcSWuaD64ljtycmubLeGNLddDXfMv1UECC45aLYmESQWtiSmV8I3MQ
         iN5/smqBbdtg+Z+YUOoYxdi+Xd8gCgs5IvJzZFmsI0iwEdFwud4v6J+WR5YEp0uWU5OR
         OgJIasumbfRiXfs+nivQF5cNevC7pPoRzHLQ6v3JfTJ9A8LMw1EEEXw+3LKemlxnjWSJ
         2k9xs2UvTAjEaohgFL2r54LiXObxbHfXxsmC1u6t3czJAFeFJByvXy31x110Kga1x3+A
         FcTmoXr0lJECl2QS5y01sUS8VR4sDTAtLuaG5oVDcw+ech1DRlg9u13eSWjZiLUz2hQK
         SAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HrWcuaUF1HhijaMJhHIxXSdQF25IxURehoKzpWG38wE=;
        b=NX7YGxF8QqMETsSyg9AUWjUFaIt1bPzaThN9GVQB0MG1AMxwz3H8sq83+Zgk/MV5Bg
         RKY0x/tnk/JjpQeOhRhbGJ7rXcM4RkaVYZ6oOPYw6OgJM1IM4RxXhsFUFLLlXF8If6WM
         Rj/PF2N75FmhI1eAx94Xrg368zlt5NoXEfTVyiORGyhrjJHmFDPnGbw+gBG7W1a2tenj
         a9lwVNhaRbgrFeKXx4bXx2IOOvAJ39l61nv1A7xVOcnBXE+quyRdMCn/D4UsBa68BpLB
         dMBLK4xuvE7hLi+o95rN7wWRo6bnY4+10YdFFTdbZ+1MgZFwG1IwZmJIaOgbpaNJrFY2
         qV/w==
X-Gm-Message-State: AGi0PuaU3o3EAh6K952ZMBnhUyBga88KhZ1br/byLgC4bOkorEV8LM/p
        WuNMTYbpyXIXNOUW8HRHzReOPzRhcw1Y2lzgEMbsAQ==
X-Google-Smtp-Source: APiQypJdKenEudzwmRCZsVJROESba9igAfdi955cc/HXfQHfGJhnwpqdCdg1cSi3aWNuxlg4vPxYVVubva8Ng3NxLiY=
X-Received: by 2002:aca:1b0f:: with SMTP id b15mr2859389oib.96.1588188524148;
 Wed, 29 Apr 2020 12:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200429110726.448625-1-robert.marko@sartura.hr> <20200429.115946.788260021055034651.davem@davemloft.net>
In-Reply-To: <20200429.115946.788260021055034651.davem@davemloft.net>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 29 Apr 2020 21:28:33 +0200
Message-ID: <CA+HBbNHRyk4_nmV0HyRH=x1-L+-DFd7SQKhX6APnJA0oNEtBNA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/3] net: phy: mdio: add IPQ40xx MDIO support
To:     David Miller <davem@davemloft.net>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 29, 2020 at 8:59 PM David Miller <davem@davemloft.net> wrote:
>
> From: Robert Marko <robert.marko@sartura.hr>
> Date: Wed, 29 Apr 2020 13:07:24 +0200
>
> > This patch series provides support for the IPQ40xx built-in MDIO interface.
> > Included are driver, devicetree bindings for it and devicetree node.
>
> The DT changes don't apply cleanly to net-next, please respin.
Sorry about that, I accidentally based the patch on DTS that has USB
nodes in it.
USB patches are also in the process of being upstreamed.

I will send a v5 ASAP.
Thanks
>
> Thanks.
