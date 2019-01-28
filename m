From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 lora-next 4/4] dt-bindings: lora: sx130x: add clock bindings
Date: Mon, 28 Jan 2019 12:23:45 -0600
Message-ID: <CAL_JsqLczDnQis5SkmfrFie+aj9pb+UfPyF4dfiKs7aomeRPXg@mail.gmail.com>
References: <20190124145309.21698-1-ben.whitten@lairdtech.com> <20190124145309.21698-5-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124145309.21698-5-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-lpwan@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 24, 2019 at 8:54 AM Ben Whitten <ben.whitten@gmail.com> wrote:
>
> From: Ben Whitten <ben.whitten@gmail.com>
>
> The SX130x family consumes two clocks, a 32 MHz clock provided by a
> connected IQ transceiver, and a 133 MHz high speed clock.
> It also provides a 32 MHz clock out to the radio in the TX path.
>
> In the example we connect the concentrator to a fixed clock providing
> the 133 MHz high speed clock, and we connect to a connected transceiver
> 32 MHz clock.
>
> A radio in the TX path is also connected to the 32 MHz clock out from the
> concentrator.
>
> The connected radios are both fed from a fixed 32 MHz clock, with only
> one being the clock source back to the SX130x concentrator.
>
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
> v2 -> v3:
> * Name input clocks specifically
> * Add output clock for radio in TX path
> v1 -> v2:
> * Fixed incorrect usage of clock cells
> * Fixed wording in commit and descriptions
> ---
>  .../bindings/net/lora/semtech,sx130x.yaml     | 52 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)

Other than the issue on patch 3 that affects the example here,

Reviewed-by: Rob Herring <robh@kernel.org>
