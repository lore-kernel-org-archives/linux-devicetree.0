Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F701C43215
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 12:50:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54DC3217BA
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 12:50:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z7TY7lJe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfK2Mum (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 07:50:42 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:41534 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfK2Mum (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 07:50:42 -0500
Received: by mail-qv1-f66.google.com with SMTP id g18so11521052qvp.8
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 04:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lJbIAqeUDXD4kcUbIecANlElpIrUUQHr/u/gzWsPOOU=;
        b=Z7TY7lJe2RR0bY595O8O8pFed9bQc/UF1lJ7h+m2Ur4M40GihCpYzBmRuXU2nAchEz
         A4GM945FLCCo3SCNfGP/xiJM5Z6jcYycs+VyKa73tAE73kf3c1fS8EiGwv/N2SGGvFpU
         Y1tJYtW4W9nM380QBmVcoCE06ms6SXlEePb6QaOJGs9Lz5w1J7V0VL0okZzDNif+PwnR
         8S0B0jPw6QIq6mFDn2ecGQLUsZgOA9cmlZR1rIiH5xnGa1Yml0I9zpLsvoLe3Za4WcAY
         HSuAaYID813yC+bug59gLqoI2nnUWfSzyhtirvtTFimT4P8X8sIgQnxIoetg9z6793CU
         IhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lJbIAqeUDXD4kcUbIecANlElpIrUUQHr/u/gzWsPOOU=;
        b=DbGD571jhDhhBXT5vZqbcDKvVW6qLviXQWyo+R/IQGjpRSp6kjUGYUxfioxjtZvFCF
         ZRjERlHlPuQ/TH/ebnGKwYlSri/YfnA7LZdjqLw3pl7tiC/eYhYF81ybz1iB2G6/mxBR
         VP5eZqzXNXEUgi9HGb0dVgkvMSdPI/IOaH0RQN59Yv3ZLz+WhVA+x+lQ8hTPRPdfM7k0
         SBUcBH5nQe/1QD3K/BozBSRX+a/zJUA+6Q/jTZRI3mUvxTcZNWDqlAR5WfVbe7s6uvkW
         oS++24JR3kumOl9wuO+6sJinEBllZYAB5OaLty8vRKo3RCKVOwDMev7+vkcLYx3EIyyI
         jq2Q==
X-Gm-Message-State: APjAAAWreRy9IeBaIBD+uzBRZhawMnpx0WB3CXqkIRcnRj0lX0ldfkOw
        LTVM++Zf94o62e4C2LTbxZyc0ZNqvEXKSCxSrEnzdQ==
X-Google-Smtp-Source: APXvYqwgNwgGwC0/hhgzT5ewCqO0LQ/ZTP/UDvHdFa1bVBib5Bq/FnKSVHeDG4EOI2aRFcBiV5or57cU3hFUD7PidXc=
X-Received: by 2002:a05:6214:245:: with SMTP id k5mr11234215qvt.182.1575031841425;
 Fri, 29 Nov 2019 04:50:41 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-4-mike.leach@linaro.org>
 <cc0eb144-48a2-bde5-4790-2fd5e1168360@arm.com>
In-Reply-To: <cc0eb144-48a2-bde5-4790-2fd5e1168360@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 29 Nov 2019 12:50:30 +0000
Message-ID: <CAJ9a7Vh=J8QbPbng0OMmH6uNjhTZJMfm9hn63zw8rNcr00msbw@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] coresight: cti: Add sysfs access to program
 function regs
To:     Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Suzuki, Mathieu,

On Thu, 28 Nov 2019 at 10:54, Suzuki Kuruppassery Poulose
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
>
> i.e, CONFIG_CTI_DEBUG_INTEGRATION_CTRL, to help the people better.
> Codewise this doesn't make much difference, but it certainly makes
> it more easier for people to use it.
>
> We have used debug symbols elsewhere in the drivers for pure functional
> debugging purposes. However I feel this is case is superior.
>
>
> Cheers
> Suzuki

Per the comment above, and the discussions following, I would agree
that using a config symbol makes it easier for users to select the
feature and gives us an opportunity to put in some explanation as to
what it does.

Thanks

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
