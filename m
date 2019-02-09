Return-Path: <SRS0=eUQR=QQ=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <1549650743-27581-1-git-send-email-Frank.Li@nxp.com>
 <1549650743-27581-2-git-send-email-Frank.Li@nxp.com> <CAOMZO5A_WeCuvK-OLifQJk2xytOnhTRMdMVHbQqa1p3-Rk9O+g@mail.gmail.com>
 <CAHrpEqRj0-F8pT5zPrPh5pOzvKyxePVkrNZOc4N-hM_aZDGiXQ@mail.gmail.com>
In-Reply-To: <CAHrpEqRj0-F8pT5zPrPh5pOzvKyxePVkrNZOc4N-hM_aZDGiXQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 9 Feb 2019 10:28:54 -0200
Message-ID: <CAOMZO5A=7BFrwDKvFus1MYZYKhYFgkGXBva+976Szo6oRa6JMA@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: imx8qxp: added ddr performance monitor nodes
Content-Type: text/plain; charset="UTF-8"
To: Zhi Li <lznuaa@gmail.com>
Cc: Frank Li <frank.li@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Feb 8, 2019 at 4:59 PM Zhi Li <lznuaa@gmail.com> wrote:

> If it is true if under subsystem node. ddr pmu is the same level as
> GIC.  So address should be 64bit

Understood.

When I searched for the PMU region at 0x5c020000 I saw a "Reserved"
box in the Refence Manual, so it seems the manual needs to be updated.
