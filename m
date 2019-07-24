From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: RE: [PATCH 2/2] dt-bindings: IDU-intc: Add support for edge-triggered
 interrupts
Date: Wed, 24 Jul 2019 10:53:30 +0000
Message-ID: <CY4PR1201MB012055687BED617CB2689678A1C60@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20190723102606.309089-1-mischa.jonker@synopsys.com>
 <20190723102606.309089-2-mischa.jonker@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723102606.309089-2-mischa.jonker@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mischa Jonker <Mischa.Jonker@synopsys.com>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mischa,

> -----Original Message-----
> From: Mischa Jonker <mischa.jonker@synopsys.com>
> Sent: Tuesday, July 23, 2019 1:26 PM
> To: Vineet Gupta <vgupta@synopsys.com>; Alexey Brodkin <abrodkin@synopsys=
.com>;
> kstewart@linuxfoundation.org; tglx@linutronix.de; robh+dt@kernel.org; lin=
ux-snps-
> arc@lists.infradead.org; linux-kernel@vger.kernel.org; devicetree@vger.ke=
rnel.org
> Cc: Mischa Jonker <mischa.jonker@synopsys.com>
> Subject: [PATCH 2/2] dt-bindings: IDU-intc: Add support for edge-triggere=
d interrupts
>=20
> This updates the documentation for supporting  a optional extra interrupt
> cell to specify edge vs level triggered.

LGTM as well. But maybe split pure clean-up changes from addition of
the new property description so that info about addition of new property is
clearly seen? Otherwise it gets a bit lost among nice and useful generic fi=
xes.

-Alexey
