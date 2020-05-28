Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68C7C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 22:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DA652074B
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 22:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nZ//AuWi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437457AbgE1Wz3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 18:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437456AbgE1WzX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 18:55:23 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8E3C08C5C7
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 15:55:23 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id l67so199299ybl.4
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 15:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94grXSLlKz8pt9Y0CHgxlWm5jQqtItEcnxP1GZOMo0Y=;
        b=nZ//AuWi6emFoMvlpgZ2523d/5KVjGEwQU0zLwnXPLqGYbQkyGyGihPS3pEL0kTBOR
         +7LAvogyO+1aMWyYOH/0CMMeAuN+6TF6HDQj4/FZOsZHR0OugIOemMNUiQhCkj8mONP1
         z0bkDBFCqQ9m+UQoQjvRBbbdsF79kjdkJaPfw3lILiowMeazXOckTlEax3r9a4AQDDRH
         IR0PfzU4mxf5+853e3n+ASqudDF1uQ3vcx1AZ/g1mHJHCrnOh6rj2XTy9R2We31zzKH7
         ROc05j59mxGEMpvrmyLn83UAErvunVxien7bYi68tWe7498ciEMKzxiqIm+YXy4uL/fC
         Vl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94grXSLlKz8pt9Y0CHgxlWm5jQqtItEcnxP1GZOMo0Y=;
        b=FZ+Td4huowxMhPI8JWO9IBG07YJLMRnjNsrrD2qut0UVO71r8vQ60dg4Em2ocXlkqj
         /Qb5cRb+A2eXXXfKfJCqSNcYm7XqJMBoTp7/7cAhEIhyeZekTtLBY9mSNvqMxkxSt8Bz
         DmZeNJAoKFO9J4r/OyRgAfppICgCCkgGx4bcBI1rZbteFHFwB6izKTE3H8mNCGQgqL8G
         hJQvsTrhe1bmY+b2Kv1+1JFMUo+2kOYxTJ9nsXS3MUrsobMz1xNuzGc11yLegKWXP2fT
         WvyNcLlnbbdstRD4cL7hHnpUsngAoFFvfREoXAsr05SK2PNRHHSf8Xarnlo5rUBNn7EP
         klgQ==
X-Gm-Message-State: AOAM533o3y2OLHGxti/Dd3N2NlP9UDUl3UawqMEkQjMdhQ32z2LkP7vn
        9e4UqsiXU+QLpur7Sppygk3lV7z+7KnBAdF9QiVyPA==
X-Google-Smtp-Source: ABdhPJxVczRAAaGyfbjE3IbRMi+VMRiTSvNSq0RMNxiI7vs2fJbAppPLAdzMqbFICxJQrUWEOOeJsyvXMb1DypuA2Dc=
X-Received: by 2002:a25:38cb:: with SMTP id f194mr8941327yba.250.1590706522197;
 Thu, 28 May 2020 15:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200515025159.101081-1-jnchase@google.com> <20200515025159.101081-3-jnchase@google.com>
 <fe268ad4-1a46-b6de-54e1-c9e6731a96d3@xs4all.nl>
In-Reply-To: <fe268ad4-1a46-b6de-54e1-c9e6731a96d3@xs4all.nl>
From:   Jeff Chase <jnchase@google.com>
Date:   Thu, 28 May 2020 18:55:10 -0400
Message-ID: <CALTkaQ1pyAB1JVtifa75RuyTQCeNDTObZH+BvdFQVhLLhAeosg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> > +
> > +/* This device is always enabled */
> > +static int ch7322_cec_adap_enable(struct cec_adapter *adap, bool enable)
> > +{
>
> I'd disable the interrupt here if enable is false.

Ok I can do that.

>
> There is a power down mode as well, so perhaps that's something that can be
> done here too.
>

I think I'd prefer to use power down mode in a potential follow up
patch that adds PM to the driver.

> > +     return 0;
> > +}
> > +
> > +static int ch7322_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
> > +{
> > +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
> > +     int ret;
> > +
> > +     mutex_lock(&ch7322->mutex);
> > +     ret = regmap_update_bits(ch7322->regmap, CH7322_ADDLW,
> > +                              CH7322_ADDLW_MASK, log_addr << 4);
> > +     mutex_unlock(&ch7322->mutex);
>
> If log_addr is CEC_LOG_ADDR_INVALID, then that means that the current
> logical address configuration is to be cleared. In this case the logical
> address is set to 0xf (unregistered/broadcast). That should mean that the
> CEC device will not Ack any logical addresses, correct?

Correct.

>
> But it does receive broadcast messages and (I think) also messages from
> other logical addresses, except that those will not be Acked by this
> CEC adapter.
>

I was wrong about this before. It does not pass on messages from other LAs.

> If it still receives messages from other LAs, then that means that you can
> add the CEC_CAP_MONITOR_ALL capability. I.e., 'sudo cec-ctl -M' without
> configuring anything should see all CEC traffic.
>
> What is the default value of CH7322_ADDLW? It should start with 0xf as
> the logical address (i.e. no received messages should be Acked).

The default value is 0xf.

Thanks,
Jeff
