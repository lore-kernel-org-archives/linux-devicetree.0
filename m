From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 05/10] dt-bindings: pinctrl: imx7ulp: back to imx
 legacy binding for consistency
Date: Mon, 5 Nov 2018 13:04:02 +0000
Message-ID: <AM0PR04MB4211131EC2158CF7FC111CA380CA0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1541149669-10857-1-git-send-email-aisheng.dong@nxp.com>
 <1541149669-10857-6-git-send-email-aisheng.dong@nxp.com>
 <CACRpkdb=1gKHCnd2njRdDbf_dg8H-H3Zmzy8J_H2OoRNa7omnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdb=1gKHCnd2njRdDbf_dg8H-H3Zmzy8J_H2OoRNa7omnw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Dong Aisheng <dongas86@gmail.com>, Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, "open list:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Linus Walleij [mailto:linus.walleij@linaro.org]
> Sent: Friday, November 2, 2018 5:38 PM
[...]
> 
> On Fri, Nov 2, 2018 at 10:13 AM A.s. Dong <aisheng.dong@nxp.com> wrote:
> 
> > We already had an earlier conclusion that all new i.MX Socs will keep
> > using the legacy i.MX Pinctrl bindings instead of generic pin config.
> > However, MX7ULP generic pin config binding support has already been in
> > tree before that time. Per SoC maintainers' suggestions, in order to
> > get a better consistency for all i.MX devices, we'd like to go back to
> > imx legacy binding for MX7ULP as well.
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Sascha Hauer <kernel@pengutronix.de>
> > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > Cc: linux-gpio@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> > ChangeLog:
> >  v3: new patch
> 
> Can I have some ACKs from the other Freescale people on this so I see that
> there is a wide consensus for this?
> 

You can also refer to some comments from here
https://www.spinics.net/lists/arm-kernel/msg683812.html

Sascha & Shawn,
Would you also give a sign-offs?

Regards
Dong Aisheng

> Yours,
> Linus Walleij
