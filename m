Return-Path: <SRS0=vdDf=WF=gmail.com=dmitry.torokhov@kernel.org>
Date: Fri, 9 Aug 2019 09:44:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/4] Input: ads7846 - convert to devm_ alloc functions
Message-ID: <20190809164431.GL178933@dtor-ws>
References: <20190327133927.1340-1-m.felsch@pengutronix.de>
 <20190327133927.1340-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327133927.1340-2-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh+dt@kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 27, 2019 at 02:39:24PM +0100, Marco Felsch wrote:
> Convert to devm function to drop the 'no-mem' error handling path and
> strip down the remove funciton a bit.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

I am not fond of partial devm conversions, as this causes reordering in
of freeing resources in unwind path. In this particular case input
device will be unregistered only after majority of the driver structure
is torn down.

If we want to do devm conversion, we need to do a complete one.

Thanks.

-- 
Dmitry
