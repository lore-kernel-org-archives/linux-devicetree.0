From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 14/14] dt-bindings: net: add bindings for ADIN PHY driver
Date: Mon, 12 Aug 2019 13:02:00 -0600
Message-ID: <CAL_JsqLYFiuD6G6jDTxSz0m9N3xBRRQTcAv0PUeza_kwTyuVOg@mail.gmail.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com> <20190812112350.15242-15-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812112350.15242-15-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 5:24 AM Alexandru Ardelean
<alexandru.ardelean@analog.com> wrote:
>
> This change adds bindings for the Analog Devices ADIN PHY driver, detailing
> all the properties implemented by the driver.
>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  .../devicetree/bindings/net/adi,adin.yaml     | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/adi,adin.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
