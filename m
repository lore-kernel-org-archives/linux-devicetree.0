Return-Path: <SRS0=4Nc/=G7=renesas.com=phil.edworthy@kernel.org>
From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH] gpio: dwapb: Add support for 32 interrupts
Date: Tue, 10 Apr 2018 14:23:07 +0000
Message-ID: <TY1PR01MB17691846E8DFA86DA831B8B9F5BE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1522246950-9110-1-git-send-email-phil.edworthy@renesas.com>
 <20180409192013.5rytwgoixtyraow3@rob-hp-laptop>
 <TY1PR01MB1769EC6963CFB3D720D1B9EEF5BE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1769EC6963CFB3D720D1B9EEF5BE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On 10 April 2018 07:24 Phil Edworthy wrote:
> On 09 April 2018 20:20 Rob Herring wrote:
> > On Wed, Mar 28, 2018 at 03:22:30PM +0100, Phil Edworthy wrote:
[...]
> > > +- interrupt-mask : a 32-bit bit mask that specifies which interrupts
> > > +in the list
> > > +  of interrupts is valid, bit is 1 for a valid irq.
> >
> > This is not a standard property and would need a vendor prefix. However=
,
> I'd
> > prefer you just skip any not connected interrupts with an invalid inter=
rupt
> > number. Then the GPIO number is the index into "interrupts".
> Makes sense, I'll rework it to do this.
Err, what would an invalid interrupt number be?
If I use -1, I get a DT parsing error and 0 is certainly valid. If the numb=
er is
larger than the valid interrupt range I get errors during probe.

Thanks
Phil
