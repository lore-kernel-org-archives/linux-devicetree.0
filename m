From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH V5 1/2] dt-bindings: iio: magnetometer: add dt-bindings
 for freescale mag3110
Date: Sat, 22 Dec 2018 17:05:45 +0000
Message-ID: <20181222170545.4aed8c61@archlinux>
References: <1545021679-4025-1-git-send-email-Anson.Huang@nxp.com>
        <CAL_Jsq+NKtKcV9xzSd11vZPfQWUVJMSQx8BB-5UX6O_4ptV44A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+NKtKcV9xzSd11vZPfQWUVJMSQx8BB-5UX6O_4ptV44A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Anson Huang <anson.huang@nxp.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, olivier moysan <olivier.moysan@st.com>, Brian Masney <masneyb@onstation.org>, Mark Brown <broonie@kernel.org>, Peter Rosin <peda@axentia.se>, rtresidd@electromag.com.au, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Phil Reid <preid@electromag.com.au>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, 17 Dec 2018 08:55:53 -0600
Rob Herring <robh+dt@kernel.org> wrote:

> On Sun, Dec 16, 2018 at 10:47 PM Anson Huang <anson.huang@nxp.com> wrote:
> >
> > Add Freescale MAG3110 dt-bindings and remove it from trivial-devices
> > dt-bingding doc.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  .../bindings/iio/magnetometer/mag3110.txt          | 27 ++++++++++++++++++++++
> >  .../devicetree/bindings/trivial-devices.txt        |  1 -
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/mag3110.txt  
> 
> trivial-devices.txt is gone now as it's converted to json-schema. I
> can take this patch thru my tree and fix it up.
> 
> Rob

That would be great. Thanks. I'll pick up patch 2.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
