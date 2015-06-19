From: Zhi Li <lznuaa@gmail.com>
Subject: Re: [PATCH v2 6/8] ARM: dts: imx: add imx6ul and imx6ul evk board
 support
Date: Fri, 19 Jun 2015 13:55:46 -0500
Message-ID: <CAHrpEqQMtaL_ReeFP4VR2bfg_HDaQAHc0BUMB3X4KM3b23ra0A@mail.gmail.com>
References: <1434727951-4852-1-git-send-email-Frank.Li@freescale.com>
 <1434727951-4852-7-git-send-email-Frank.Li@freescale.com>
 <CAH=tA9G_x=6wNTOWbOc2FGGARTxioikUSwqyENKk74wL=7uzaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAH=tA9G_x=6wNTOWbOc2FGGARTxioikUSwqyENKk74wL=7uzaw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolae Rosia <nicolae.rosia@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Fancy Fang <chen.fang@freescale.com>, Frank Li <Frank.Li@freescale.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Fugang Duan <B38611@freescale.com>, Anson Huang <b20788@freescale.com>, Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 19, 2015 at 12:05 PM, Nicolae Rosia <nicolae.rosia@gmail.com> wrote:
> Hi,
>
> On Fri, Jun 19, 2015 at 6:32 PM,  <Frank.Li@freescale.com> wrote:
>> From: Frank Li <Frank.Li@freescale.com>
> [...]
>> +       cpus {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               cpu0: cpu@0 {
>> +                       compatible = "arm,cortex-a7";
>> +                       device_type = "cpu";
>> +                       reg = <0>;
>> +                       clock-latency = <61036>; /* two CLK32 periods */
>> +                       operating-points = <
>> +                               /* kHz  uV */
>> +                               528000  1250000
>> +                               396000  1150000
>> +                               198000  1150000
>> +                       >;
>> +                       fsl,soc-operating-points = <
>> +                               /* KHz  uV */
>> +                               528000  1250000
>> +                               396000  1150000
>> +                               198000  1150000
>> +                       >;
> Why is this necessary? Can't you adapt the driver to use operating-points?
> I have looked through other imx dts and saw that some had different
> values in these two tables.

It is used by internal busfreq driver. I will remove it at next version.

best regards
Frank Li

>
> Best regards,
> Nicolae Rosia
