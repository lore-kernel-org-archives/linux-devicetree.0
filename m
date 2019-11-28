Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B8FC43215
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 17:20:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5003421771
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 17:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwTDbZMB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfK1RUW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 12:20:22 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:43436 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbfK1RUW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 12:20:22 -0500
Received: by mail-il1-f194.google.com with SMTP id r9so24745238ilq.10
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 09:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oie0bM178aUOxU4BJOrM9kVBDCA95ZD+DTy+5sq9Vkc=;
        b=LwTDbZMB0t4gpW9EXlsp+SpAcTpbl1AAAb4/Uv/C4t6EVxVHJDWskW/H8szBJDaATo
         n8D2pQGGDxYIavNp3NLeTPxj5vnm0wA+KuP+F8YPzz43s2WIKoNDHql0iYXMvtvb2F2z
         vNLeQOWcJAlWRwc4gK2yAhU5vo3b9nNP8RHyQHLA6/6iFsAU6JK/rQihBbPpWKz290Bj
         QxFWH/d5/U0cyPmTFwk3xWTCy6IPKdOer3iMR4zd2yzIXxPs+zClJ73phSMiv/KY92YB
         jhtn9/nWswqhvz8mF9w4yuws1mwo3cXVvt7gtZ0ZveJDLB/qKHMY8ITV0ooVN3XZuupr
         lZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oie0bM178aUOxU4BJOrM9kVBDCA95ZD+DTy+5sq9Vkc=;
        b=lxrWF9FYtXdT5En7NDo/jloKY2pwmSvQQx2B23v3M5SnuPhpJh0FI30nErA8hTdTnk
         ww4OqGvWB1hX8+Z+7QzoiU1Nb+u1uAA0OH8OkNy5v8Sl6mxN5Xb2FtLdE99WRqUAydfj
         SWzaL6ajWb1rzGe93z7XfRhpDWNxThQmWTYdry8zGd53BHiqsV2h6coAbpKYpJeypnpG
         okMXsJ4axUloe/XhtRunBN88tD/2EPu/ms0N7nVzd6HuvDIban7Fo8E3QA6jdI9lJo+4
         SN3iNDAa2vLCybpvM5FrUj2i3huTfYsOguZ5ROAluUgsjZyTsNHAJ7BBl5pbRphgfF9V
         Iz4g==
X-Gm-Message-State: APjAAAXbZC/TP0tp52DBXH7sYnnsoBGUm8HPscIiCF1sCDgW3+jgoUTH
        X3Iv7FsBav/XFqjBp0S0S4FdZY1gI/IuaS3YhpkSfw==
X-Google-Smtp-Source: APXvYqwtBfdFeO0UfXhQ4uWy57Am43xaNg5zXNDfE01bsarG3c196FurVM4CPTCCwBIxN4josf68OMIMNTX395okYPE=
X-Received: by 2002:a92:1547:: with SMTP id v68mr8134548ilk.58.1574961621511;
 Thu, 28 Nov 2019 09:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-4-mike.leach@linaro.org>
 <cc0eb144-48a2-bde5-4790-2fd5e1168360@arm.com>
In-Reply-To: <cc0eb144-48a2-bde5-4790-2fd5e1168360@arm.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 28 Nov 2019 10:20:10 -0700
Message-ID: <CANLsYkzsn6UWjjXLDSx+2hbXV26Qf-6FMqE7xURPgPzxOYpVbw@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] coresight: cti: Add sysfs access to program
 function regs
To:     Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Cc:     Mike Leach <mike.leach@linaro.org>,
        Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 28 Nov 2019 at 03:54, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 19/11/2019 23:19, Mike Leach wrote:
> > Adds in sysfs programming support for the CTI function register sets.
> > Allows direct manipulation of channel / trigger association registers.
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
>
>
> > +/*
> > + * #define CTI_DEBUG_INTEGRATION_CTRL to enable the access to the integration
> > + * control registers. Normally only used to investigate connection data.
> > + */
>
> On a second thought, I have some comments on this symbol.
>
> Given that the integration control registers may be useful for people to
> find the device connections, I strongly feel that this is provided
> via a CONFIG symbol rather than a  debug symbol within the code.

Device connections can be discovered with the dynamic sysfs connection
entries added as part of patch 09.  In cases where that is not
sufficient and people really need to use the integration control
registers they are probably instrumenting the code anyway.

>
> i.e, CONFIG_CTI_DEBUG_INTEGRATION_CTRL, to help the people better.
> Codewise this doesn't make much difference, but it certainly makes
> it more easier for people to use it.

I agree that code-wise it doesn't make much difference but I'm really
not convinced it makes the driver easier to use, and one needs to
recompile their kernel for production systems anyway.

Thanks,
Mathieu

>
> We have used debug symbols elsewhere in the drivers for pure functional
> debugging purposes. However I feel this is case is superior.
>
>
> Cheers
> Suzuki
