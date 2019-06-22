From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v2 0/2] extcon: Add fsa9480 extcon driver
Date: Sat, 22 Jun 2019 21:44:49 +0900
Message-ID: <CAGTfZH0EMos5AaLxeONDOd6_tyt5=Gt7s_Sam930H=6mf9rRiQ@mail.gmail.com>
References: <20190621111352.22976-1-pawel.mikolaj.chmiel@gmail.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621111352.22976-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

I applied this series to extcon-testing branch.
If there are no build problem for few days, I'll move them to
extcon-next branch.

Best Regards,
Chanwoo Choi

2019=EB=85=84 6=EC=9B=94 21=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 8:14, P=
awe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:
>
> This small patchset adds support for Fairchild Semiconductor FSA9480
> microUSB switch.
>
> It has been tested on Samsung Galaxy S and Samsung Fascinate 4G,
> but it can be found also on other Samsung Aries (s5pv210) based devices.
>
> Tomasz Figa (2):
>   dt-bindings: extcon: Add support for fsa9480 switch
>   extcon: Add fsa9480 extcon driver
>
> Changes from v1:
>   - Added newline at end of dt-bindings file
>   - Removed interrupt-parent from dt-bindings file
>   - Added Acked-by to dt-bindings patch
>   - Remove license sentences from driver
>   - Remove custom sysfs entries and manual switch code
>   - Switch to using regmap api
>
>  .../bindings/extcon/extcon-fsa9480.txt        |  19 +
>  drivers/extcon/Kconfig                        |  12 +
>  drivers/extcon/Makefile                       |   1 +
>  drivers/extcon/extcon-fsa9480.c               | 395 ++++++++++++++++++
>  4 files changed, 427 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-fsa94=
80.txt
>  create mode 100644 drivers/extcon/extcon-fsa9480.c
>
> --
> 2.17.1
>
