Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:36775 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933008Ab3HNUos (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 16:44:48 -0400
Received: by mail-ob0-f169.google.com with SMTP id wc20so12756122obb.28
        for <devicetree@vger.kernel.org>; Wed, 14 Aug 2013 13:44:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1376067469-8811-1-git-send-email-swarren@wwwdotorg.org>
References: <1376067469-8811-1-git-send-email-swarren@wwwdotorg.org>
Date: Wed, 14 Aug 2013 22:44:48 +0200
Message-ID: <CACRpkdYBFW8LivYw9V9aWkrmw-LqM7j5PV1UZMoxLwiAgtQ36A@mail.gmail.com>
Subject: Re: [PATCH V4 1/4] gpio: clean up gpio-ranges documentation
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 9, 2013 at 6:57 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> This change makes documentation of the the gpio-ranges property shorter
> and more succinct, more consistent with the style of the rest of the
> document, and not mention Linux-specifics such as the API
> pinctrl_request_gpio(); DT binding documents should be OS independant
> where at all possible. As part of this, the gpio-ranges property's format
> is described in BNF form, in order to match the rest of the document.
>
> This change also deprecates the #gpio-range-cells property. Such
> properties are useful when one node references a second node, and that
> second node dictates the format of the reference. However, that is not
> the case here; the definition of gpio-ranges itself always dictates its
> format entirely, and hence the value #gpio-range-cells must always be 3,
> and hence there is no point requiring any referenced node to include
> this property. The only remaining need for this property is to ensure
> compatibility of DTs with older SW that was written to support the
> previous version of the binding.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> ---
> v4:

Patch applied.

Yours,
Linus Walleij
