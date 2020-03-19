Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DF8C4332B
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 10:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB778206D7
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 10:20:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Tlo9ynl0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgCSKU5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 06:20:57 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44227 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbgCSKU5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Mar 2020 06:20:57 -0400
Received: by mail-io1-f65.google.com with SMTP id v3so1610449iot.11
        for <devicetree@vger.kernel.org>; Thu, 19 Mar 2020 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3uJMFn0u6UxefMNCwOE+EpY1xkVMEUZdfQJs905Mo2E=;
        b=Tlo9ynl0/5JrUqt87TGFCCZ9Vf+ZY7VhurKDOOeDokSrKWXo+/6u5JNa2yUMyt8Sia
         io4XQ4NG9D33UhB3vjwQTLRHm2Ah7RPluXewGImqqQkybMb8AWDtp/5wmG/ZVQFcoMTq
         PnyKz6Odg2m53v/aAeWggFliHykA8ks7QBe1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3uJMFn0u6UxefMNCwOE+EpY1xkVMEUZdfQJs905Mo2E=;
        b=aj7mbE503crivycZT3Yx7qqjeoBf+yDSdgRRVov2YrCfBVe8eCZNw/yaw8GaeRzXVw
         qIaCPMQeRWvk+TGAf/ozcIa9HBJloMXJt+nn+kXPCLrQvZtvG/AdMpFQa7sXnl8tdRgl
         musUxwJFzSNV0YWDTxumYVSGd42aYy89vdGvkEyF2HDJ2ejX2w1ie3FNEfj+eblPrglq
         lMCtnfQBdiFCXt2OxRMfotbSTkY8ugx15fuxED2i5MAhlcn2Qq8YPJu+qOUEiuOJqs94
         93yhdeUEPirelfWO1bdI1UvdKiFDUgK67B5TxTczxiE89d//O0fXLqc9mJYsdfq27WCg
         AT5Q==
X-Gm-Message-State: ANhLgQ3Bts9Hh9VdIwo9xpARzylajrayNXigJyLSXtqPZLsGev1Hc493
        X/A4UbDiDXovuo64vTv2Cko9IPIVhfEEn/so6SuH4g==
X-Google-Smtp-Source: ADFU+vtK3d/gDrUHwaxaJnUYjeJVHLK/PG6GuACnlbXxXQUQIi/qPHvAaGxP4FQ5mOe7IXI4kbNLAEMtUXVPu4O/o3c=
X-Received: by 2002:a02:241:: with SMTP id 62mr2290953jau.103.1584613255796;
 Thu, 19 Mar 2020 03:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200318171003.5179-1-jagan@amarulasolutions.com>
 <20200318171003.5179-3-jagan@amarulasolutions.com> <20200318185814.GB28092@ravnborg.org>
In-Reply-To: <20200318185814.GB28092@ravnborg.org>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 19 Mar 2020 15:50:44 +0530
Message-ID: <CAMty3ZDhVfvYXV7OO+NT+d_2YHbsJXebzjdtYkqtdD+X=Ch0yQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] MAINTAINERS: Update feiyang, st7701 panel bindings
 converted as YAML
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Mar 19, 2020 at 12:28 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Wed, Mar 18, 2020 at 10:40:03PM +0530, Jagan Teki wrote:
> > The feiyang,fy07024di26a30d.txt and sitronix,st7701.txt has been
> > converted to YAML schemas, update MAINTAINERS to match them again.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> The patch is fine.
> I just dislike we repeat the maintainer info in two places..

Since these are two different panels. and entry similar like other
panels.do you look for single entry for both the panels?

Jagan.
