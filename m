Return-Path: <robherring2@gmail.com>
Date: Fri, 16 Aug 2019 16:01:17 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 06/13] media: dt-bindings: tvp5150: Add input port
 connectors DT bindings
Message-ID: <20190816210117.GA17941@bogus>
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
 <20190815115747.24018-7-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815115747.24018-7-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 15, 2019 at 01:57:40PM +0200, Marco Felsch wrote:
> The TVP5150/1 decoders support different video input sources to their
> AIP1A/B pins.
> 
> Possible configurations are as follows:
>   - Analog Composite signal connected to AIP1A.
>   - Analog Composite signal connected to AIP1B.
>   - Analog S-Video Y (luminance) and C (chrominance)
>     signals connected to AIP1A and AIP1B respectively.
> 
> This patch extends the device tree bindings documentation to describe
> how the input connectors for these devices should be defined in a DT.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
> 
> v7:
> Hi Rob,
> I droped your r b tag because I changed the bindings in this
> patch version. Please can you have a look on it again?
> 
> - fix missing AIP1B svideo connection (description and examples)
> 
> v3:
> - remove examples for one and two inputs
> - replace space by tabs
> 
> v2:
> - adapt port layout in accordance with
>   https://www.spinics.net/lists/linux-media/msg138546.html with the
>   svideo-connector deviation (use only one endpoint)
> ---
>  .../devicetree/bindings/media/i2c/tvp5150.txt | 112 ++++++++++++++++--
>  1 file changed, 105 insertions(+), 7 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
