Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:63285 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760142Ab3HNSFn (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 14:05:43 -0400
Received: by mail-oa0-f41.google.com with SMTP id j6so891933oag.28
        for <devicetree@vger.kernel.org>; Wed, 14 Aug 2013 11:05:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375794755-6246-2-git-send-email-ldewangan@nvidia.com>
References: <1375794755-6246-1-git-send-email-ldewangan@nvidia.com>
	<1375794755-6246-2-git-send-email-ldewangan@nvidia.com>
Date: Wed, 14 Aug 2013 20:05:43 +0200
Message-ID: <CACRpkdajfHgfeQ5UUrMHP11FL2H7pK8j8Mrd_wyrdPWQeUu42Q@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] pinctrl: add utility functions for add map/configs
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Landley <rob@landley.net>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Graeme Gregory <gg@slimlogic.co.uk>, kishon@ti.com
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 6, 2013 at 3:12 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Some of pincontrol driver needs the utility function to create map
> list. The utility function needed for adding mux, configs etc.
>
> In place of duplicating this in each driver, add the common utility
> function in common file and use from device specific driver. This will
> reduce the duplicating of code across drivers.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>
> ---
> Changes from V1:
> - Add this files in this patch and add common utility APIs to here.
>
> Changes from V2:
> - Nothing in code.
> - Added Reviewed by Stephen.

This v3 version applied, thanks!

Would it be complicated to create a few follow-on patches to
other drivers pulling their boilerplate into these utils?

Yours,
Linus Walleij
