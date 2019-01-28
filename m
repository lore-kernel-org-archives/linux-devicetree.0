From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 lora-next 2/4] dt-bindings: lora: sx125x: add basic documentation
Date: Mon, 28 Jan 2019 12:18:57 -0600
Message-ID: <CAL_JsqJNtWswQ9=86NdbviKCeTgyF8QGVxvMptNjvGmR8gP-Zg@mail.gmail.com>
References: <20190124145309.21698-1-ben.whitten@lairdtech.com> <20190124145309.21698-3-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124145309.21698-3-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-lpwan@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 24, 2019 at 8:53 AM Ben Whitten <ben.whitten@gmail.com> wrote:
>
> From: Ben Whitten <ben.whitten@gmail.com>
>
> The SX125x family are IQ radio transceivers from Semtech configured over
> SPI, they are typically connected to an SX130x series concentrator however
> may be connected to a host directly.
>
> Required properties include the radio number of the host or concentrator
> bus.
>
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
> v2 -> v3:
> * Renamed example node name to be consistent with concentrator
> v1 -> v2:
> * Dropped spi-max-frequency binding
> * Wording changes to commit and descriptions
> * Added spi wrapper suggested by Rob H
> * Dual licence
> ---
>  .../bindings/net/lora/semtech,sx125x.yaml     | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
