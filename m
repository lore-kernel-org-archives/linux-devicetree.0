Return-Path: <robherring2@gmail.com>
Date: Thu, 28 Mar 2019 12:46:15 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] hwmon: lochnagar: Add device tree binding document
Message-ID: <20190328174615.GA6068@bogus>
References: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, corbet@lwn.net, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 28, 2019 at 01:09:36PM +0000, Charles Keepax wrote:
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> No changes since v3.
> 
> Thanks,
> Charles
> 
>  .../devicetree/bindings/hwmon/cirrus,lochnagar.txt | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
> new file mode 100644
> index 0000000000000..ffb79ccf51ee3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
> @@ -0,0 +1,26 @@
> +Cirrus Logic Lochnagar Audio Development Board
> +
> +Lochnagar is an evaluation and development board for Cirrus Logic
> +Smart CODEC and Amp devices. It allows the connection of most Cirrus
> +Logic devices on mini-cards, as well as allowing connection of
> +various application processor systems to provide a full evaluation
> +platform.  Audio system topology, clocking and power can all be
> +controlled through the Lochnagar, allowing the device under test
> +to be used in a variety of possible use cases.
> +
> +This binding document describes the binding for the hardware monitor
> +portion of the driver.
> +
> +This binding must be part of the Lochnagar MFD binding:
> +  [4] ../mfd/cirrus,lochnagar.txt
> +
> +Required properties:
> +
> +  - compatible : One of the following strings:
> +                 "cirrus,lochnagar2-hwmon"
> +
> +Example:
> +
> +lochnagar-hwmon {
> +	compatible = "cirrus,lochnagar2-hwmon";

You don't have any resources in DT, the parent MFD driver can just 
instantiate this child device.

Rob
