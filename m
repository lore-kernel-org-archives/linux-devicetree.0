From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH V2 2/4] arm64: dts: imx: add imx8qxp support
Date: Mon, 15 Oct 2018 07:30:09 +0000
Message-ID: <52eaa4ac563ad5114ebd99b286cdbe0495dba7ec.camel@nxp.com>
References: <1539527419-23613-1-git-send-email-aisheng.dong@nxp.com>
 <1539527419-23613-3-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5BEwNQy0HA80qOzm_w-c63tFK1eL+cOHNCxKYq9PHGsqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5BEwNQy0HA80qOzm_w-c63tFK1eL+cOHNCxKYq9PHGsqw@mail.gmail.com>
Content-Language: en-US
Content-ID: <15F0858A3D152A47AB4D327CBB63A897@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "dongas86@gmail.com" <dongas86@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2018-10-14 at 20:13 -0300, Fabio Estevam wrote:
> > +               imx8qx-pm {
> > +                       compatible = "fsl,scu-pd";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +
> > +                       pd_lsio: lsio-power-domain {
> > +                               #power-domain-cells = <0>;
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               pd_lsio_pwm0: lsio-pwm0@191 {
> > +                                       reg = <191>;
> 
> The number after @ is in hex, so the reg property should be 0x191.

These are SC_R_* resource ids from include/linux/firmware/imx/types.h
and they are almost everywhere referenced as decimals.

Is this really not acceptable for DT?

--
Regards,
Leonard
