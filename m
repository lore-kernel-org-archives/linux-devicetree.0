From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] bmp085.yaml: transform DT documentation of iio sensor
 into YAML
Date: Mon, 1 Apr 2019 20:46:54 -0500
Message-ID: <CAL_JsqKY2Sh=L7OZVHjovAq9YK0qubGKpRMezA+7H0b1Gq2oXA@mail.gmail.com>
References: <20190401173142.cunj5iwz2ox454qx@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401173142.cunj5iwz2ox454qx@arbad>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Brian Masney <masneyb@onstation.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 1, 2019 at 12:32 PM Andreas Klinger <ak@it-klinger.de> wrote:
>
> use bmp085.txt and change it into yaml format
>
> fix links to datasheets in replaced documentation
>
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  .../devicetree/bindings/iio/pressure/bmp085.txt    | 27 ---------
>  .../devicetree/bindings/iio/pressure/bmp085.yaml   | 70 ++++++++++++++++++++++
>  2 files changed, 70 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/pressure/bmp085.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/pressure/bmp085.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
