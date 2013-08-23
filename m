Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:61890 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756138Ab3HWTKB (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 23 Aug 2013 15:10:01 -0400
Received: by mail-ob0-f182.google.com with SMTP id wo10so1082505obc.13
        for <devicetree@vger.kernel.org>; Fri, 23 Aug 2013 12:10:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1377165378-9589-1-git-send-email-larsi@wh2.tu-dresden.de>
References: <1377165378-9589-1-git-send-email-larsi@wh2.tu-dresden.de>
Date: Fri, 23 Aug 2013 21:10:00 +0200
Message-ID: <CACRpkdZMsBynLohhNw=XyzpYns9E8QVksVJYkv3dcRJ2JHWLnA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mcp23s08: rename the device tree property
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Lars Poeschel <larsi@wh2.tu-dresden.de>
Cc: Lars Poeschel <poeschel@lemonage.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Arnd Bergmann <arnd@arndb.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 22, 2013 at 11:56 AM, Lars Poeschel <larsi@wh2.tu-dresden.de> wrote:

> From: Lars Poeschel <poeschel@lemonage.de>
>
> The device tree property should be more descriptive.
> microchip seems more reasonable than mcp. As there are no
> in tree users of this property, so the rename can still be
> done without pain.
>
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>

So do I apply this to the GPIO tree now or what?

Are the DT custodians happy?

Yours,
Linus Walleij
