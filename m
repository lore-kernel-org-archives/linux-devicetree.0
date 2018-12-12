From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: iio: light: isl29018: update power
 supply name
Date: Wed, 12 Dec 2018 09:19:57 -0200
Message-ID: <CAOMZO5DXNpn18pzngmAt+hyiWNtfwckafxCzbJ17EgndjABwWg@mail.gmail.com>
References: <1544425521-775-1-git-send-email-Anson.Huang@nxp.com>
 <20181210232358.GA11621@bogus> <DB3PR0402MB3916E1651ABC07F6F788B265F5A60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAL_Jsq+sP_fsQaoT6FpZNRxjhPAhCcE8e-0xffUUxShcC2LuHw@mail.gmail.com> <DB3PR0402MB39164538D3969FE51C649B65F5A70@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB39164538D3969FE51C649B65F5A70@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <anson.huang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Wed, Dec 12, 2018 at 4:17 AM Anson Huang <anson.huang@nxp.com> wrote:
>
> Hi, Fabio
>         Obviously, some of the dts files (such as arch/arm/boot/dts/exyno=
s5420-peach-pit.dts) using "vcc" as isl29018's power supply name, they are =
NOT matched with datasheet, so should we update those dts files with "vdd" =
as well or just using the "vcc" in isl29018 driver? Which solution is bette=
r?

We should not break existing dtbs, so in this case just keep the
existing supply name and you could add the new optional vdda supply as
per the datasheet.
