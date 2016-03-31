From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] gpio: dt-bindings: document the concept of GPIO banks
Date: Thu, 31 Mar 2016 16:52:10 +0200
Message-ID: <56FD399A.8090600@baylibre.com>
References: <1459415459-8107-1-git-send-email-linus.walleij@linaro.org>
 <CAL_JsqK+n-EwHx52=d9-dTJaVsSOzRS+PAmyCYwe6HK=kDoyGQ@mail.gmail.com>
 <56FD2689.1080707@atmel.com>
 <CAL_JsqKzzoSOFY9b9jwOVa4EZdzzRDusOEtDuOwnB7Q3x6W=eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKzzoSOFY9b9jwOVa4EZdzzRDusOEtDuOwnB7Q3x6W=eQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/31/2016 04:48 PM, Rob Herring wrote:
> On Thu, Mar 31, 2016 at 8:30 AM, Nicolas Ferre <nicolas.ferre@atmel.c=
om> wrote:
>> Le 31/03/2016 15:22, Rob Herring a =C3=A9crit :
>>> On Thu, Mar 31, 2016 at 4:10 AM, Linus Walleij <linus.walleij@linar=
o.org> wrote:
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> We generally avoid indexing blocks in DT.
>>>
>=20
> Which is a global number space that might not work in all cases. I
> don't think gpio should be using aliases either. If you need to
> describe the connections between nodes, then keep that between nodes.
>=20
> Rob
>=20

Couldn't we use gpio-ranges ?

Neil
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
