From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: iio: light: isl29018: update power
 supply name
Date: Wed, 12 Dec 2018 10:51:39 -0200
Message-ID: <CAOMZO5DuiSNxkMdV6r7AypnF6ptMLFchH2fMJvwxc3mYO_eshA@mail.gmail.com>
References: <1544425521-775-1-git-send-email-Anson.Huang@nxp.com>
 <20181210232358.GA11621@bogus> <DB3PR0402MB3916E1651ABC07F6F788B265F5A60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAL_Jsq+sP_fsQaoT6FpZNRxjhPAhCcE8e-0xffUUxShcC2LuHw@mail.gmail.com>
 <DB3PR0402MB39164538D3969FE51C649B65F5A70@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAOMZO5DXNpn18pzngmAt+hyiWNtfwckafxCzbJ17EgndjABwWg@mail.gmail.com> <96906A60-5318-46E5-B302-207C1FC7578B@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <96906A60-5318-46E5-B302-207C1FC7578B@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <anson.huang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Wed, Dec 12, 2018 at 10:49 AM Anson Huang <anson.huang@nxp.com> wrote:

>         Since the datasheet of isl29018 states the vdda and vddd MUST be =
shorted externally, and the later chips even remove vdda, ONLY has vdd one =
supply, so I think adding vdda does NOT make enough sense. Looks like the v=
cc they added is just for prepare, the driver did NOT support regulator ope=
ration at that time. So can we just use vcc in driver accordingly? Do we ha=
ve to use the name =E2=80=9CVDD=E2=80=9D in datasheet for regulator name?

Ok, understood. In this case, I would suggest keeping the existing name.
