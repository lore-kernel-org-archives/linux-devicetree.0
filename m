From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH] arm64: allwinner: h6: orangepi-one-plus: Add Ethernet support
Date: Tue, 7 Aug 2018 12:54:29 +0530
Message-ID: <CAMty3ZDMw3OkZdGvt6tRY6KsSCNKcvptsty7n_t2s_mOzQnr5w@mail.gmail.com>
References: <20180807071839.25305-1-jagan@amarulasolutions.com> <2D1B8773-0019-458A-8C7E-20077AA27AD4@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2D1B8773-0019-458A-8C7E-20077AA27AD4@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 7, 2018 at 12:49 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
>
>
> =E4=BA=8E 2018=E5=B9=B48=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883=
:18:39, Jagan Teki <jagan@amarulasolutions.com> =E5=86=99=E5=88=B0:
>>Add Ethernet support for orangepi-one-plus board,
>>- Ethernet port connected via RTL8211E PHY
>>- GMAC_EN is connected via PD6
>>- GMAC-3V supplied from ALDO2 regulator
>
> Is the prequisite patchset merged?

Not yet, I guess. Do you suggest to squash if not?
