From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/4] dt-bindings: iio/temperature: Add doc for
 thermocouple-type
Date: Mon, 11 Mar 2019 17:26:26 -0500
Message-ID: <20190311222626.GA26688@bogus>
References: <20190307103409.24174-1-patrick.havelange@essensium.com>
 <20190307103409.24174-2-patrick.havelange@essensium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190307103409.24174-2-patrick.havelange@essensium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrick Havelange <patrick.havelange@essensium.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, Matt Weber <matthew.weber@rockwellcollins.com>, Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 07, 2019 at 11:34:07AM +0100, Patrick Havelange wrote:
> This explains the new generic property "thermocouple-type" that
> can be used with temperature sensors.
> 
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> ---
> Changes v6
>  - Add this file
> ---
>  .../bindings/iio/temperature/temperature-bindings.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt b/Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt
> new file mode 100644
> index 000000000000..69a6441d8083
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/temperature/temperature-bindings.txt
> @@ -0,0 +1,11 @@
> +If the temperature sensor device can be configured to use some specific
> +thermocouple type, you can use the defined types provided in the file
> +"include/dt-bindings/iio/temperature/thermocouple.h".

You can include patch 1 in this patch.

> +
> +Optional property:

Optional or not is really up to the specific device.

> +thermocouple-type:	The type of the thermocouple used by the device.

What's the type? "A single cell" presumably.

> +
> +For example:

As this is example is incomplete, I'd drop this.

> +	device {
> +		thermocouple-type = <THERMOCOUPLE_TYPE_K> ;
> +	};
> -- 
> 2.19.1
> 
