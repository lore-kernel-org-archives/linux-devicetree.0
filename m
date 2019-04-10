From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-nitrogen6_max: Disable LVDS channels
Date: Wed, 10 Apr 2019 08:55:05 -0300
Message-ID: <CAOMZO5Aj+NKOsa1zXfQqsSzqDJGOcza+1wGjdiEytvjAhsnOVQ@mail.gmail.com>
References: <20190408175319.9106-1-robert.foss@collabora.com>
 <CAOMZO5DAvaibi5r9CXzk8qbE7XHiHJHHvi9rcq_BJdx7aRVgoQ@mail.gmail.com>
 <4fd506a1-c961-0569-6d39-283758f363d9@collabora.com> <CAAMH-ys-S7miJFCAY9bxrDGTPPT7e7c430-_4+edH8scV_qTwA@mail.gmail.com>
 <550afae6-8dd8-39aa-c7a2-01b27557aa53@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <550afae6-8dd8-39aa-c7a2-01b27557aa53@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Foss <robert.foss@collabora.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Troy Kisky <troy.kisky@boundarydevices.com>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Wed, Apr 10, 2019 at 7:57 AM Robert Foss <robert.foss@collabora.com> wrote:

> # dmesg
> imx-drm display-subsystem: failed to bind disp0 (ops imx_pd_ops): -517
> imx-drm display-subsystem: master bind failed: -517
>
> This dmesg log is failing to bind disp0 at another point than what I
> was seeing before, yet the result is the same. The connected HDMI
> output is not brought online correctly.

It seems that the ldb failure is due to the lvds backlight nodes not
finding the PWM resource due to the PWM driver rename.

Please check if this patch fixes the problem on your case:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20190410&id=728e096dd70889c2e80dd4153feee91afb1daf72

imx-drm should also be fixed independently of this PWM rename change
in my opinion.
