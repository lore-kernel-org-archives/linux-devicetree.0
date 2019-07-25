From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] bus: imx-weim: optionally enable burst clock mode
Date: Thu, 25 Jul 2019 16:32:31 -0300
Message-ID: <CAOMZO5CrUZ1C0i8ofuiG8thsPgfxPiY5XOnvUsmnkYYSKJBMNQ@mail.gmail.com>
References: <20190712204316.16783-1-TheSven73@gmail.com> <CAGngYiVb_-A4Au749GD6SKi=UqKKBm4yxim8YOCbgVjfz7xtvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiVb_-A4Au749GD6SKi=UqKKBm4yxim8YOCbgVjfz7xtvg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Kees Cook <keescook@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Hi Sven,

On Thu, Jul 25, 2019 at 11:30 AM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> On Fri, Jul 12, 2019 at 4:43 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
> >
> > To enable burst clock mode, add the fsl,burst-clk-enable
> > property to the weim bus's devicetree node.
> >
>
> Any feedback on this patch, positive or negative?

Looks good to me:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
