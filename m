From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 lora-next 1/4] dt-bindings: lora: sx130x: add basic documentation
Date: Mon, 28 Jan 2019 12:18:02 -0600
Message-ID: <CAL_Jsq+nMtGaWJ-Gty0wMY6TL=aDqf9+ok40MXitw2ecMyoOWA@mail.gmail.com>
References: <20190124145309.21698-1-ben.whitten@lairdtech.com> <20190124145309.21698-2-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124145309.21698-2-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-lpwan@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 24, 2019 at 8:53 AM Ben Whitten <ben.whitten@gmail.com> wrote:
>
> From: Ben Whitten <ben.whitten@gmail.com>
>
> Add basic documentation in YAML format for the SX130x series concentrators
> from Semtech.
> Required is; the location on the SPI bus and the compatible string.
>
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
> v2 -> v3:
> * Corrected fallback notation
> * Limited radio node names from anything to 'radio@'
> v1 -> v2:
> * Dropped reset-gpios, radio-spi from required.
> * Dropped spi-max-frequency from binding.
> * Changed compatible to allow fallback from SX1308 to SX1301.
> * Wording changes in commit and descriptions.
> * Dual licence
> * Incorperate Robs comments on child node and spi wrapper
> ---
>  .../bindings/net/lora/semtech,sx130x.yaml     | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
