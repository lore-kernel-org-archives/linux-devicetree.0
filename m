From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: chemical: pms7003: convert bindings
 to yaml
Date: Wed, 10 Jul 2019 14:12:26 -0600
Message-ID: <CAL_JsqJ8iLuif-UqVzpgwOLafVYr9aOo38EMeUnmYJ0a9aQ5DQ@mail.gmail.com>
References: <20190710192155.11489-1-tduszyns@gmail.com> <20190710192155.11489-2-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710192155.11489-2-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 10, 2019 at 1:22 PM Tomasz Duszynski <tduszyns@gmail.com> wrote:
>
> Convert existing device tree bindings to yaml.
>
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
> ---
>  .../iio/chemical/plantower,pms7003.txt        | 26 ----------
>  .../iio/chemical/plantower,pms7003.yaml       | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
