From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: light: bh1750: convert bindings to yaml
Date: Tue, 17 Sep 2019 09:17:40 -0500
Message-ID: <CAL_JsqLj6jpgC5e607uDdVJGhKE6b53k=HHgZ3_dq8Qk-X5WDg@mail.gmail.com>
References: <20190916190024.9955-1-tduszyns@gmail.com> <20190916190024.9955-2-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916190024.9955-2-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2019 at 2:01 PM Tomasz Duszynski <tduszyns@gmail.com> wrote:
>
> Convert existing device tree bindings to yaml.
>
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
> ---
>  .../devicetree/bindings/iio/light/bh1750.txt  | 18 --------
>  .../devicetree/bindings/iio/light/bh1750.yaml | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/light/bh1750.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/light/bh1750.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
