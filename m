Return-Path: <SRS0=2AmA=WF=pengutronix.de=mfe@kernel.org>
Date: Fri, 9 Aug 2019 11:30:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 0/4] ADS7846 add general touchscreen features
Message-ID: <20190809093047.xo3vngthu3kqbtqz@pengutronix.de>
References: <20190327133927.1340-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327133927.1340-1-m.felsch@pengutronix.de>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Dmitry,

gentle ping.

Regards,
  Marco

On 19-03-27 14:39, Marco Felsch wrote:
> Hi,
> 
> The main purpose of this small set is to add support for the general
> touchscreen dt-properties. During this work I also changed the memory
> allocation methods to the devm_* ones to cleanup the error-paths.
> 
> Regards,
> Marco
> 
> Marco Felsch (4):
>   Input: ads7846 - convert to devm_ alloc functions
>   dt-bindings: input: ads7846: fix property description
>   dt-bindings: input: ads7846: replace vendor-bindings by general ones
>   Input: ads7846 - add support for general touchscreen bindings
> 
>  .../bindings/input/touchscreen/ads7846.txt    | 29 +++++--
>  drivers/input/touchscreen/ads7846.c           | 75 +++++++++++--------
>  2 files changed, 66 insertions(+), 38 deletions(-)
> 
> -- 
> 2.20.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
