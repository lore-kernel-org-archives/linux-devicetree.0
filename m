MIME-Version: 1.0
Date: Thu, 16 May 2019 08:53:59 -0500
References: <20190516121509.1441-1-alexandru.ardelean@analog.com>
	<20190516133609.10975-1-alexandru.ardelean@analog.com>
In-Reply-To: <20190516133609.10975-1-alexandru.ardelean@analog.com>
Message-ID: <CAL_Jsq+YKsOHkXyKux_e42pAw2qDF+P-vfjxVqk4pu8v3M2vSg@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: iio: accel: adxl345: switch to YAML bindings
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, May 16, 2019 at 8:36 AM Alexandru Ardelean
<alexandru.ardelean@analog.com> wrote:
>
> The ADX345 supports both I2C & SPI bindings.
> This change switches from old text bindings, to YAML bindings, and also
> tries to make use of the recent multiple-examples support.
>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
> Changelog v1 -> v2:
> * dropped interrupt-parent from DT, as suggested by Rob

Please add acks/reviewed-by tags when posting new versions.

Rob
