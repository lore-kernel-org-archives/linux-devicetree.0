From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: clk: meson: add g12b periph clock
 controller bindings
Date: Wed, 22 May 2019 09:43:09 +0200
Message-ID: <6354e9f9-6c0e-68d9-93e9-a92d874f452a@baylibre.com>
References: <20190521150130.31684-1-narmstrong@baylibre.com>
 <20190521150130.31684-2-narmstrong@baylibre.com>
 <CAFBinCAwD7W1zQ2YZgecowZUEnoVpGXyGQnOKhB5T3OvOvvbkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCAwD7W1zQ2YZgecowZUEnoVpGXyGQnOKhB5T3OvOvvbkg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: jbrunet@baylibre.com, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 21/05/2019 19:30, Martin Blumenstingl wrote:
> On Tue, May 21, 2019 at 5:02 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Update the documentation to support clock driver for the Amlogic G12B SoC.
>>
>> G12B clock driver is very close, the main differences are :
>> - the clock tree is duplicated for the both clusters, and the
>>   SYS_PLL are swapped between the clusters
>> - G12A has additional clocks like for CSI an other components
> I missed this in v1, it should be G12B?

Yes, thanks for spotting this

> 
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> with above typo fixed (assuming it is one):
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
