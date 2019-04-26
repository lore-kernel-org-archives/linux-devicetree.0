From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: tsl2772: convert bindings to
 YAML format
Date: Fri, 26 Apr 2019 08:20:34 -0500
Message-ID: <CAL_JsqL0SQZSs8MmF6j1B_qfvCOcg9XMjUBUHFL+mnCk7xNB1A@mail.gmail.com>
References: <20190425230314.26000-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425230314.26000-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 25, 2019 at 6:03 PM Brian Masney <masneyb@onstation.org> wrote:
>
> Convert the tsl2772 device tree bindings to the new YAML format.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v2:
> - Remove allof from led-max-microamp. Split out enum list from [] to
>   individual lines for consistency with the compatible attribute.
> - Change 'proximity-sensor@39' in example to 'sensor@39'.
>
> Changes since v1:
> - Dropped description from reg and interrupts properties.
> - Dropped $ref from led-max-microamp, vdd-supply, and vddio-supply.
> - Changed 'tsl2772@39' in example to 'proximity-sensor@39'
>
>  .../devicetree/bindings/iio/light/tsl2772.txt | 42 ----------
>  .../bindings/iio/light/tsl2772.yaml           | 83 +++++++++++++++++++
>  2 files changed, 83 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/light/tsl2772.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/light/tsl2772.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
