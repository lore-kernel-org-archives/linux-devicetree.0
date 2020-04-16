Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1084CC352BE
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 15:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5CA820771
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587049281;
	bh=DVcIcut7V8paBS+JSMimRiqrzi7YftlnrdpavTLLfdc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=ZscX0SCqMMiJLFxptvT6k9uwnAsvjQrCYxXGJK3sy4f655Kyz+xSKEaBiei1/Y0oD
	 L9D88fG5dQyWXBIwWNPBHQ2sdCkcn25Yfkk56gXi0YWDbsdgOqpn8nS7maNS2XZiYY
	 9j3cVxwdqge2vt3MlaI9fBfbHpi5jpgPA75Ua6PQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439110AbgDPPBD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 11:01:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:45808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438050AbgDPPAb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 11:00:31 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7B342223D
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587049230;
        bh=DVcIcut7V8paBS+JSMimRiqrzi7YftlnrdpavTLLfdc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=B3lsgCysM/dIubEpev5bDtfi1KOeQB7ra5WoagO+4etlEZcxaW7YqQ0B1w10SzeKl
         29Y0gXRKBuPBItb7sITNhSBvzHX9LtNYT9uuna5l3v6/iWYXMeetQ1sIRAVBdfUaoo
         4Y/iq7TR78fn1nGdJ0Ag3bL99RCJWgaeNt+SQf0Q=
Received: by mail-qk1-f177.google.com with SMTP id g74so21512157qke.13
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 08:00:30 -0700 (PDT)
X-Gm-Message-State: AGi0PuYOa07/T4B2bQ8Xej/JlO3S47H1c6ThlbHHHTBnCd2DvawuBPQ5
        zVHV/D9sVJjnu1nbjn6BUwCxi7HrOidkqJFyvg==
X-Google-Smtp-Source: APiQypKPhjbIeooeQYaUl6m3o9DMQW69zKClSMYNoqd74zUzs7XT0VwRkFAbT8bmKqcEzIOmejAor15Wc827RuYfn58=
X-Received: by 2002:a37:7dc6:: with SMTP id y189mr33559835qkc.223.1587049229890;
 Thu, 16 Apr 2020 08:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195109.32692-1-sam@ravnborg.org> <20200408195109.32692-3-sam@ravnborg.org>
 <CACRpkdYVY7eqrWctUm2GzzZ=1y9Cznya8HUYTDco2bA8Z9Hq1Q@mail.gmail.com>
In-Reply-To: <CACRpkdYVY7eqrWctUm2GzzZ=1y9Cznya8HUYTDco2bA8Z9Hq1Q@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 16 Apr 2020 10:00:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL5A5rXSM+RmA3Rw9Jg+TBzhzJLF74L_Pzr9u36-+CjEw@mail.gmail.com>
Message-ID: <CAL_JsqL5A5rXSM+RmA3Rw9Jg+TBzhzJLF74L_Pzr9u36-+CjEw@mail.gmail.com>
Subject: Re: [PATCH v2 02/36] dt-bindings: display: look for dsi* nodes in dsi-controller
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 16, 2020 at 6:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Apr 8, 2020 at 9:51 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> > Rob wrote:
> >
> >     Uhhh, it's looking for dsi-controller(@.*)? which is not the common
> >     case found in dts files. We should fix that to dsi(@.*)?.
> >
> > See: https://lore.kernel.org/dri-devel/20200319032222.GK29911@bogus/
> >
> > Fix it.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
>
> I think I was instructed to use dsi-controller@ at some point but I
> suppose it was a misunderstanding.

Probably my fault. We've been nice and inconsistent on naming
patterns. I always have to double check whether it is
'gpio-controller@' or 'gpio@'... The answer is always whatever has the
most hits in dts files.

Rob
