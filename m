From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: Re: [PATCH 15/22] ARM: dts: apalis-imx6: Add some optional I2C devices
Date: Wed, 31 Jul 2019 11:37:20 +0000
Message-ID: <6d92bc62f62d2f16db91ae9f2ae633d70b0e2123.camel@toradex.com>
References: <20190730144649.19022-1-dev@pschenker.ch>
 <20190730144649.19022-16-dev@pschenker.ch>
 <CAOMZO5BqbUzBi5nR33TOpgnR4CFAwxF34m+oKtRZ6rtMaMVu9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5BqbUzBi5nR33TOpgnR4CFAwxF34m+oKtRZ6rtMaMVu9g@mail.gmail.com>
Content-Language: en-US
Content-ID: <65E97F1DD74C7F4A9F9A63F145915ECC@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "festevam@gmail.com" <festevam@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>, Max Krummenacher <max.krummenacher@toradex.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-07-30 at 17:43 -0300, Fabio Estevam wrote:
> Hi Philippe,
> 
> On Tue, Jul 30, 2019 at 11:57 AM Philippe Schenker <dev@pschenker.ch> wrote:
> 
> > +&mipi_csi {
> > +       ipu_id = <0>;
> > +       csi_id = <1>;
> > +       v_channel = <0>;
> > +       lanes = <2>;
> 
> None of these properties are valid upstream.

Will drop that one too.
