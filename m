From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] devantech-srf04.yaml: transform DT binding to YAML
Date: Wed, 27 Mar 2019 08:13:17 -0500
Message-ID: <CAL_JsqKV1Qy05oX9wm+Fz1HAkAEe4gE3whCNvafPfxsg6hgp8A@mail.gmail.com>
References: <20190326133938.oitfjxlx2kou26lm@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326133938.oitfjxlx2kou26lm@arbad>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 26, 2019 at 8:40 AM Andreas Klinger <ak@it-klinger.de> wrote:
>
> devantech-srf04.yaml: yaml devicetree binding for iio ultrasonic
> proximity driver of devantech srf04
>
> use devantech-srf04.txt, transform binding into yaml and remove the
> outdated DT documentation
>
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  .../bindings/iio/proximity/devantech-srf04.txt     | 28 ----------
>  .../bindings/iio/proximity/devantech-srf04.yaml    | 59 ++++++++++++++++++++++
>  2 files changed, 59 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
