From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 22/22] phy: Add support for Qualcomm's USB HS phy
Date: Mon, 19 Sep 2016 16:01:09 -0500
Message-ID: <CAL_JsqKhmm7k-hA+c9K61AfaRCG332dBdGvdxvTTfBYskZoewQ@mail.gmail.com>
References: <20160907213519.27340-1-stephen.boyd@linaro.org>
 <20160907213519.27340-23-stephen.boyd@linaro.org> <20160916151950.GA31804@rob-hp-laptop>
 <147407072439.8245.12292695359399379462@sboyd-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <147407072439.8245.12292695359399379462@sboyd-linaro>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Linux USB List <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <balbi@kernel.org>, Peter Chen <peter.chen@nxp.com>, Kishon Vijay Abraham I <kishon@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 16, 2016 at 7:05 PM, Stephen Boyd <stephen.boyd@linaro.org> wrote:
> Quoting Rob Herring (2016-09-16 08:19:51)
>> On Wed, Sep 07, 2016 at 02:35:19PM -0700, Stephen Boyd wrote:
>> > The high-speed phy on qcom SoCs is controlled via the ULPI
>> > viewport.
>> >

[...]

>> > +- qcom,init-seq:
>> > +    Usage: optional
>> > +    Value type: <u8 array>
>> > +    Definition: Should contain a sequence of ULPI register and address pairs to
>> > +                program into the ULPI_EXT_VENDOR_SPECIFIC area. This is related
>> > +                to Device Mode Eye Diagram test.
>>
>> We generally nak this type of property. For 1 register I don't care so
>> much. For 100, that would be another story.
>>
>> Is this value per unit, per board, per SoC? Can you limit it to certain
>> registers?
>
> I'm told that this can be per board, depending on how it's wired from
> the phy pins to the usb port. Typically it's the same though for the
> boards I have, mostly because those boards are similar designs with
> respect to how USB is wired. The set of registers is not that many, 4 or
> 5 at most. My understanding is these are tuning registers. Right now the
> register part in the binding is the full register offset, and not an
> offset from ULPI_EXT_VENDOR_SPECIFIC (0x80). I could change this to be
> an offset from that area if you like so that this can't be abused to
> write into standard ULPI registers (there really isn't any way to
> enforce this in software though).

Okay, that sounds fine to me.

Rob
