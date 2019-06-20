From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: chemical: sps30: convert bindings
 to yaml
Date: Thu, 20 Jun 2019 15:21:47 -0600
Message-ID: <CAL_JsqLmZPTYqSkmSo-KuqUr7FY1BqE3XX7+PhcA_0phS4X3jQ@mail.gmail.com>
References: <20190620195011.30942-1-tduszyns@gmail.com> <20190620195011.30942-2-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620195011.30942-2-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2019 at 1:52 PM Tomasz Duszynski <tduszyns@gmail.com> wrote:
>
> Convert existing device tree bindings to yaml.
>
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
> ---
>  .../bindings/iio/chemical/sensirion,sps30.txt | 12 ------
>  .../iio/chemical/sensirion,sps30.yaml         | 39 +++++++++++++++++++
>  2 files changed, 39 insertions(+), 12 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
