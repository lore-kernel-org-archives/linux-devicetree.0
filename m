From: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH v2] pwm: add lpc32xx pwm support
Date: Tue, 10 Jul 2012 14:43:26 +0200
Message-ID: <4FFC236E.7090308@antcom.de>
References: <1341921212-11953-1-git-send-email-aletes.xgr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1341921212-11953-1-git-send-email-aletes.xgr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

On 07/10/2012 01:53 PM, Alexandre Pereira da Silva wrote:
> Add lpc32xx soc pwm driver.
> 
> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> ---
> +++ b/drivers/pwm/pwm-lpc32xx.c
> @@ -0,0 +1,150 @@
> +/*
> + * Copyright 2012 Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html

Some nitpicking about legal wording and contents:

It doesn't state explicitly that we are licensing via GPLv2.

Further, maybe we can drop the links (which can become obsolete in the
future)? We are shipping the GPL anyway, and other drivers also don't
need links.

E.g.:

 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2.

Please also consider Thierry's comments.

Thanks for the driver!

Roland
