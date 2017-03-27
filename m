From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] nvmem: imx-ocotp: add write support
Date: Mon, 27 Mar 2017 10:42:06 -0300
Message-ID: <CAOMZO5DV+80np5qsq9JdKwmKFL1AkeqJ09S3o0XjQzAqYw0rYg@mail.gmail.com>
References: <1490621491-28247-1-git-send-email-richard.leitner@skidata.com> <1490621491-28247-2-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490621491-28247-2-git-send-email-richard.leitner@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

[Adding Pengutronix folks and Shawn on Cc]

On Mon, Mar 27, 2017 at 10:31 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> Implement write routine for OCOTP controller found in i.MX6 SoC's.
> Furthermore add locking to the read function to prevent race conditions.
> The write routine code is based on the fsl_otp driver from Freescale.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>

Do we really want to have write support in the driver?
