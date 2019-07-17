Return-Path: <SRS0=xQJe=VO=gmail.com=dmitry.torokhov@kernel.org>
Date: Wed, 17 Jul 2019 06:33:46 +0300
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: atmel_mxt_ts - allow specification of config name
Message-ID: <20190717033346.GA621@penguin>
References: <20190712135338.6211-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190712135338.6211-1-l.stach@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, patchwork-lst@pengutronix.de, Chris Healy <cphealy@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Hi Lucas,

On Fri, Jul 12, 2019 at 03:53:38PM +0200, Lucas Stach wrote:
> From: Nick Dyer <nick@shmanahar.org>
> 
> Some systems require different touchscreen configurations depending on the
> populated touchscreen. To allow different configs to co-exist in the file
> system we need a way to tell the driver, which config should be loaded.
> 
> Signed-off-by: Nick Dyer <nick@shmanahar.org>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> lst:
> - switch to property name to not use underscore
> - Add more elaborate commit message

I believe we have already discussed this patch and back then I said that
the "atmel" prefix was not appropriate, as it describes not hardware
specifics but rather Linux kernel behavior and therefore we should be
using "linux,cfg-name" as the property. Unfortunately that version of
the patch got lost in my mailbox.

I will fish it out and apply.

Thanks.

-- 
Dmitry
