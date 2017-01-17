From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] fbdev: ssd1307fb: allow reset-gpios is missing
Date: Wed, 18 Jan 2017 01:29:11 +0200
Message-ID: <CAHp75VejkJ7g5ZiZvadgUx2rf4fUkxR67Z+Yn6wVwgG_RAwUPQ@mail.gmail.com>
References: <20170117042658.QtsSkpPN@smtp3o.mail.yandex.net> <20170117074013.iqzfuoc3ys27347y@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170117074013.iqzfuoc3ys27347y@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Icenowy Zheng <icenowy@aosc.xyz>, David Airlie <airlied@linux.ie>, linux-fbdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 17, 2017 at 9:40 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Mon, Jan 16, 2017 at 05:50:21PM +0800, Icenowy Zheng wrote:
>>
>> 2017=E5=B9=B41=E6=9C=8816=E6=97=A5 16:02=E4=BA=8E Maxime Ripard <maxime.=
ripard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
>> >
>> > On Sun, Jan 15, 2017 at 07:21:46PM +0800, Icenowy Zheng wrote:
>> > > Currently some SSD1306 OLED modules are sold without a reset pin (on=
ly
>> > > VCC, GND, SCK, SDA four pins).
>> > >
>> > > Add support for missing reset-gpios property.
>> > >
>> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
>> >
>> > Unfortunately, a similar patch has been sent a couple of times
>> > already:
>> > https://www.spinics.net/lists/devicetree/msg158330.html
>>
>> Why is it never merged?
>
> It was sent 4 days ago...
>
> And since you didn't have the right maintainers in the cc list, yours
> didn't have a chance to be merged either.
>
>> There are really boards that needs this function.
>
> Then  you can accelerate its inclusion by reviewing it.

Perhaps someone eventually adds drivers/reset/reset-gpio.c and uses
devm_get_reset_optional_exclusive() instead?


--=20
With Best Regards,
Andy Shevchenko
