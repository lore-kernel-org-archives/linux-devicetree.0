From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Subject: Re: [PATCH v2] pwm: add lpc32xx pwm support
Date: Tue, 10 Jul 2012 09:48:39 -0300
Message-ID: <CAAAP30Hf5MfSwjn0+1Gz5KZaNehMmnCTDT6zjnEV1+9rddp_LA@mail.gmail.com>
References: <1341921212-11953-1-git-send-email-aletes.xgr@gmail.com>
	<4FFC236E.7090308@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4FFC236E.7090308@antcom.de>
Sender: linux-doc-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2012 at 9:43 AM, Roland Stigge <stigge@antcom.de> wrote:
> Hi!
>
> On 07/10/2012 01:53 PM, Alexandre Pereira da Silva wrote:
>> Add lpc32xx soc pwm driver.
>>
>> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
>> ---
>> +++ b/drivers/pwm/pwm-lpc32xx.c
>> @@ -0,0 +1,150 @@
>> +/*
>> + * Copyright 2012 Alexandre Pereira da Silva <aletes.xgr@gmail.com>
>> + *
>> + * The code contained herein is licensed under the GNU General Public
>> + * License. You may obtain a copy of the GNU General Public License
>> + * Version 2 or later at the following locations:
>> + *
>> + * http://www.opensource.org/licenses/gpl-license.html
>> + * http://www.gnu.org/copyleft/gpl.html
>
> Some nitpicking about legal wording and contents:
>
> It doesn't state explicitly that we are licensing via GPLv2.
>
> Further, maybe we can drop the links (which can become obsolete in the
> future)? We are shipping the GPL anyway, and other drivers also don't
> need links.
>
> E.g.:
>
>  * This program is free software; you can redistribute it and/or modify
>  * it under the terms of the GNU General Public License as published by
>  * the Free Software Foundation; version 2.

Thanks, Roland. I will apply that.
