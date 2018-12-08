From: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH v2 0/9] Improvements for i.MX7D PICO SoM and its baseboards
Date: Fri, 7 Dec 2018 22:01:18 -0200
Message-ID: <CAP9ODKpJdGhwN8FHzEZUihWsUu=iig56o0uQQ75kmHeVCRyB9Q@mail.gmail.com>
References: <20181206100905.15053-1-otavio@ossystems.com.br> <CAP9ODKoG-XRSOekKJWkD3Wg_dPsS2baRzPhuuJmmoT7-omBOtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP9ODKoG-XRSOekKJWkD3Wg_dPsS2baRzPhuuJmmoT7-omBOtA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hello Shawn,

On Thu, Dec 6, 2018 at 8:44 AM Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Thu, Dec 6, 2018 at 8:09 AM Otavio Salvador <otavio@ossystems.com.br> wrote:
> > This patchset rework the imx7d-pico SoM, its Pi baseboard
> > and add the Hobbit baseboard support as well.
> >
> > Changes in v2:
> > - replace fsl,uart-has-rtscts with uart-has-rtscts
> >
> > Fabio Estevam (8):
> >   ARM: dts: imx7d-pico: Do not harcode the memory size
> >   ARM: dts: imx7d-pico: Switch to SPDX identifier
> >   ARM: dts: imx7d-pico-pi: Move SoM related part to imx7d-pico.dtsi
>
> I did the rebase; one thing worth mentioning is that I have "ARM: dts:
> imx7d-pico: Describe the Wifi clock" which is in your fixes tree.

Do you wish me to resent this now that the "ARM: dts: imx7d-pico:
Describe the Wifi clock" is on linux-next? If so I can rebase and
resend. Just let me know how to make it more convenient for you,
please?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
