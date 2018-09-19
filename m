From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] video: ssd1307fb: Use gpiod_set_value_cansleep() for reset
Date: Wed, 19 Sep 2018 09:11:03 -0300
Message-ID: <CAOMZO5CEh-UQA=QiyWMadkpp=LcWbGs6zaaXXqa9cYQgrTLiDA@mail.gmail.com>
References: <1537348724-22976-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537348724-22976-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-fbdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Michal,

On Wed, Sep 19, 2018 at 6:18 AM, Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft=
.com> wrote:
> The reset signal can be produced by GPIO expander that can sleep.
> In that case the probe function fails. Allow using GPIO expanders for
> the reset signal by using the non-atomic gpiod_set_value_cansleep()
> function.
>
> Signed-off-by: Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
