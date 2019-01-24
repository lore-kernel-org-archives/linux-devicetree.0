From: Ben Whitten <benwhitten@gmail.com>
Subject: Re: [PATCH v3 lora-next 0/4] net: lora: Add documentation for SX130x
 and SX125x parts
Date: Thu, 24 Jan 2019 15:02:49 +0000
Message-ID: <CAF3==itJFVUfPiS5prm0RdQMVb4vXoGPfQj8BHCVPT9DgmW2Aw@mail.gmail.com>
References: <20190124145309.21698-1-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124145309.21698-1-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ben Whitten <ben.whitten@lairdtech.com>, linux-lpwan@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Missed linux-lpwan

On Thu, 24 Jan 2019 at 14:53, Ben Whitten <ben.whitten@gmail.com> wrote:
>
> Hello,
>
> This series adds documentation for the SX130x and SX125x chips.
> We are using the yaml binding format and this series builds with
> 'make dt_binding_check'.
>
> This series is split such that the basic documentation can be taken
> without clock components, as there is an ongoing problem running clk
> over spi backed regmaps on certain spi controller drivers [1]
>
> Thanks,
> Ben Whitten
>
> v2 -> v3
> * Added the clock input and output names
> * Limited the radio-spi node children names to radio@
> * Fixed fallback compatible for SX1308 -> SX1301
> v1 -> v2
> * Dropped reset-gpios, radio-spi from required.
> * Dropped spi-max-frequency from binding.
> * Changed compatible to allow fallback from SX1308 to SX1301.
> * Wording changes in commit and descriptions.
> * Dual licence
> * Incorperate Robs comments on child node and spi wrapper
>
> [1] http://lists.infradead.org/pipermail/linux-lpwan/2018-December/000063.html
>
>
> Ben Whitten (4):
>   dt-bindings: lora: sx130x: add basic documentation
>   dt-bindings: lora: sx125x: add basic documentation
>   dt-bindings: lora: sx125x: add clock bindings
>   dt-bindings: lora: sx130x: add clock bindings
>
>  .../bindings/net/lora/semtech,sx125x.yaml     |  77 +++++++++
>  .../bindings/net/lora/semtech,sx130x.yaml     | 151 ++++++++++++++++++
>  2 files changed, 228 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
>  create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
>
> --
> 2.17.1
>
