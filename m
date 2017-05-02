From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 29/30] dt-bindings: add vendor prefix for bananapi
Date: Tue, 2 May 2017 08:52:49 -0500
Message-ID: <CAL_JsqKHpWGviZ2H-xhGMzNWsCCRMj_O5ux8aguFfeVKBfJa_w@mail.gmail.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
 <1493198774-4478-30-git-send-email-sean.wang@mediatek.com>
 <20170428203727.m6jm5w6nb2iirxih@rob-hp-laptop> <1493621880.32195.13.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1493621880.32195.13.camel@mtkswgap22>
Sender: linux-gpio-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>, "arm@kernel.org" <arm@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-mediatek@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+arm-soc

On Mon, May 1, 2017 at 1:58 AM, Sean Wang <sean.wang@mediatek.com> wrote:
> On Fri, 2017-04-28 at 15:37 -0500, Rob Herring wrote:
>> On Wed, Apr 26, 2017 at 05:26:13PM +0800, sean.wang@mediatek.com wrote:
>> > From: Sean Wang <sean.wang@mediatek.com>
>> >
>> > Banana Pi team in Sinovoip Co., Limited which are dedicated to
>> > design and manufacture open hardware product.
>> >
>> > Website: http://www.banana-pi.org/
>> >
>> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> > ---
>> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> > index ec0bfb9..8ca0f3c 100644
>> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> > @@ -44,6 +44,7 @@ avia      avia semiconductor
>> >  avic       Shanghai AVIC Optoelectronics Co., Ltd.
>> >  axentia    Axentia Technologies AB
>> >  axis       Axis Communications AB
>> > +bananapi Banana Pi SINOVOP CO., LIMITED
>>
>> s/SINOVOP/SINOVOIP/
>
> Hi Rob,
>
> thanks for your careful reviewing , i will correct it in the next
> version.
>
> BTW, Could those related dts changes go through your tree if everything
> looks good? Because I find Matthias have been inactive for a while and
> the latest branch in his tree seems still staying on 4.10.

Happy to take binding doc changes, but I don't take dts changes
because those go thru arm-soc. If the platform maintainer is not
responsive, then we should replace or add maintainers.

Rob
