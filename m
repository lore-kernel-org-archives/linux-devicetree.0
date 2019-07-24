From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [Sound-open-firmware] [PATCH v2 1/5] ASoC: SOF: imx: Add i.MX8 HW support
Date: Wed, 24 Jul 2019 11:58:58 +0300
Message-ID: <CAEnQRZAEsPFp36hD7XiWihTe2KQOJV6Eq9C8hjn0Z1kiUZjzyQ@mail.gmail.com>
References: <20190723084104.12639-1-daniel.baluta@nxp.com> <20190723084104.12639-2-daniel.baluta@nxp.com>
 <a5d44d96-4d50-ee46-a6bf-3ce108b1994a@linux.intel.com> <CAEnQRZCuB2QKzz-08K0z+x+p0qCpqR_wDc=q2GChvJiw4E9hBA@mail.gmail.com>
 <1563957164.2311.28.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563957164.2311.28.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Olaru <paul.olaru@nxp.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, sound-open-fir
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 11:32 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Hi Daniel,
>
> Am Mittwoch, den 24.07.2019, 09:54 +0300 schrieb Daniel Baluta:
> > On Tue, Jul 23, 2019 at 6:18 PM Pierre-Louis Bossart
> [...]
> >
> > > Also are all the resources device-managed, I don't see a remove()?
> >
> > Good catch for pm stuff. We mostly didn't care about remove because
> > drivers are always Y in our distribution.
>
> Linux drivers need to be hotplug aware, even if they are not built as a
> module. You can test things by manually unbinding the driver from the
> device via sysfs.

Agree. Will take this into consideration when sending next version!
