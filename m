From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] dt-bindings: arm: amlogic: fix x96-max/sei510 section in amlogic.yaml
Date: Fri, 09 Aug 2019 15:39:23 -0700
Message-ID: <7ho90y2cbo.fsf@baylibre.com>
References: <20190806075520.14652-1-narmstrong@baylibre.com> <CAL_JsqJ=dUX-bPa06KxJowf_3GM2-mPwm4U1KyTXyH0thA1pvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ=dUX-bPa06KxJowf_3GM2-mPwm4U1KyTXyH0thA1pvg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christian Hewitt <christianshewitt@gmail.com>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh+dt@kernel.org> writes:

> On Tue, Aug 6, 2019 at 1:55 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> From: Christian Hewitt <christianshewitt@gmail.com>
>>
>> Move amediatech,x96-max and seirobotics,sei510 to the S905D2 section and
>> update the S905D2 description to S905D2/X2/Y2.
>>
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> Acked-by: Rob Herring <robh@kernel.org>

Queued for v5.4,

Thanks,

Kevin
