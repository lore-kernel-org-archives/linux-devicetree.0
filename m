From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V5 1/2] dt-bindings: iio: magnetometer: add dt-bindings
 for freescale mag3110
Date: Mon, 17 Dec 2018 08:55:53 -0600
Message-ID: <CAL_Jsq+NKtKcV9xzSd11vZPfQWUVJMSQx8BB-5UX6O_4ptV44A@mail.gmail.com>
References: <1545021679-4025-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545021679-4025-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, olivier moysan <olivier.moysan@st.com>, Brian Masney <masneyb@onstation.org>, Mark Brown <broonie@kernel.org>, Peter Rosin <peda@axentia.se>, rtresidd@electromag.com.au, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Phil Reid <preid@electromag.com.au>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 16, 2018 at 10:47 PM Anson Huang <anson.huang@nxp.com> wrote:
>
> Add Freescale MAG3110 dt-bindings and remove it from trivial-devices
> dt-bingding doc.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../bindings/iio/magnetometer/mag3110.txt          | 27 ++++++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.txt        |  1 -
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/mag3110.txt

trivial-devices.txt is gone now as it's converted to json-schema. I
can take this patch thru my tree and fix it up.

Rob
