From: Jagan Teki <jagannadh.teki@gmail.com>
Subject: Re: [PATCH v5 1/5] ARM: dts: imx6qdl-icore: Add Sound card support
Date: Tue, 26 Sep 2017 00:22:10 +0530
Message-ID: <CAD6G_RTfuegBSN9w-pOYbUq=N9z0u6e24iOMLUUpbycWxH+BeQ@mail.gmail.com>
References: <1505734113-9708-1-git-send-email-jteki@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505734113-9708-1-git-send-email-jteki@openedev.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Mon, Sep 18, 2017 at 4:58 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
>
> Linux Sound card now uses generic simple-audio-card, so add
> the same along with related audmux and codec(via u2c3) for
> i.CoreM6 QDL module boards.
>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Matteo Lisi <matteo.lisi@engicam.com>
> Cc: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v5:
> - Add adumux
> - Update simple-audio-card,widgets
> - Add ssi1 fsl,mode
> - Add #sound-dai-cells in codec
> Changes for v4:
> - Moved sgtl5000 node into dtsi instead of multiple copies of
>   same in dts files
> Changes for v3:
> - Replace fsl,imx-audio-sgtl5000 and use simple-audio-card
> Changes for v2:
> - Use proper [label:] node-name[@unit-address] for codec

Series has tested, request for comments?

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
