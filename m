From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH RE-RESEND 2/2] ARM: dts: opos6uldev: use OF graph to
 describe the display
Date: Tue, 7 May 2019 12:34:48 -0300
Message-ID: <CAOMZO5Ca7tZAb0vO8ZM1oKR2UXNV_KqcJ7oxeiV3kkb7=2jQBA@mail.gmail.com>
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com> <20190507152713.27494-2-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190507152713.27494-2-sebastien.szymanski@armadeus.com>
Sender: stable-owner@vger.kernel.org
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi S=C3=A9bastien,

On Tue, May 7, 2019 at 12:27 PM S=C3=A9bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:
>
> To make use of the new eLCDIF DRM driver OF graph description is
> required. Describe the display using OF graph nodes.
>
> Cc: stable@vger.kernel.org # v4.19

The Cc to stable applies to bugfixes, which is not the case here.

With such tag removed:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
