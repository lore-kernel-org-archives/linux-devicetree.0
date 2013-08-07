Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:60423 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932301Ab3HGUBd (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 7 Aug 2013 16:01:33 -0400
Received: by mail-oa0-f43.google.com with SMTP id i10so4251445oag.30
        for <devicetree@vger.kernel.org>; Wed, 07 Aug 2013 13:01:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375809032-21477-2-git-send-email-swarren@wwwdotorg.org>
References: <1375809032-21477-1-git-send-email-swarren@wwwdotorg.org>
	<1375809032-21477-2-git-send-email-swarren@wwwdotorg.org>
Date: Wed, 7 Aug 2013 22:01:33 +0200
Message-ID: <CACRpkdaSbndjDki=CgKhm_ATsUYExOUzcNRrVnhp+-GaDV3c=w@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] pinctrl: add generic pins and functions properties
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, Laxman Dewangan <ldewangan@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 6, 2013 at 7:10 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> pinctrl bindings can benefit from generic property names that define
> which pins a "pin configuration node" affects, and which mux function
> to select onto those pins. Document new properties for this purpose so
> that other bindings may refer to them.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> v2: Define the arguments that the pins and functions properties take.

Patch applied.

Yours,
Linus Walleij
