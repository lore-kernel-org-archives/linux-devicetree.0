From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add binding document for NOA1305
Date: Mon, 1 Jul 2019 13:13:51 -0600
Message-ID: <CAL_JsqJ6Kmmw1WisFswq6s71ZyoEFC8P-SasrwKngbEw2OH5YA@mail.gmail.com>
References: <20190628175713.14831-1-martyn.welch@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628175713.14831-1-martyn.welch@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel@lists.collabora.co.uk, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 28, 2019 at 11:57 AM Martyn Welch
<martyn.welch@collabora.com> wrote:
>
> Document the ON Semiconductor NOA1305 ambient light sensor devicetree
> bindings.
>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> ---
>
> Changes:
> v2: Same as v1.
>
>  .../bindings/iio/light/noa1305.yaml           | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/noa1305.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
