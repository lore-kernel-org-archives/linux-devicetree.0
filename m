Return-Path: <robherring2@gmail.com>
Date: Sat, 6 Apr 2019 02:09:27 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 10/13] media: dt-bindings: tvp5150: cleanup bindings
 stlye
Message-ID: <20190406070927.GA3106@bogus>
References: <20190405060317.11240-1-m.felsch@pengutronix.de>
 <20190405060317.11240-11-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190405060317.11240-11-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, p.zabel@pengutronix.de, javierm@redhat.co, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Fri,  5 Apr 2019 08:03:14 +0200, Marco Felsch wrote:
> Use underlines to highlight optional and required properties. This is
> quite common for all bindings. Align descriptions and start sentence
> with uppercase letter. Also reword the usage of the required
> endpoint properties for the output port in case BT.656 should be used.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../devicetree/bindings/media/i2c/tvp5150.txt | 30 +++++++++++--------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
