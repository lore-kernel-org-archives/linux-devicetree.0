From: Jerry Huang <jerry.huang@nxp.com>
Subject: RE: [PATCH v4 3/3] USB3/DWC3: Enable undefined length INCR burst type
Date: Mon, 20 Feb 2017 08:39:24 +0000
Message-ID: <DB5PR0401MB18134EB0CFBA8D8CFA73A1A7FE5E0@DB5PR0401MB1813.eurprd04.prod.outlook.com>
References: <1484727138-3264-1-git-send-email-jerry.huang@nxp.com>
 <1484727138-3264-3-git-send-email-jerry.huang@nxp.com>
 <DB5PR0401MB1813965DDC8CC6CD0BD85980FE440@DB5PR0401MB1813.eurprd04.prod.outlook.com>
 <87y3xeqvsl.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rajesh Bhagat <rajesh.bhagat@nxp.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Jerry Huang
> Sent: Friday, February 10, 2017 11:30 PM
> To: 'Felipe Balbi' <balbi@kernel.org>; robh+dt@kernel.org;
> mark.rutland@arm.com; catalin.marinas@arm.com
> Cc: linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Rajesh
> Bhagat <rajesh.bhagat@nxp.com>
> Subject: RE: [PATCH v4 3/3] USB3/DWC3: Enable undefined length INCR burst
> type
>=20
> > >> --
> > >> 1.7.9.5
> > > Hi, Balbi and all guys,
> > > Any comment for these patches? Can they be accepted?
> >
> > Rob had comments which you didn't reply yet. I cannot take this
> > patchset yet ;-)
> >
> Balbi,
> I look into his mail again, which was based v3, and I replied it.
> He had different understanding for undefined length burst mode.
> It seems he think for this mode, just setting bit[0] (INCRBrstEna) and do=
n't
> need to set other field.
> However, according to the DWC USB3.0 controller databook, when it is
> undefined length INCR burst mode, we still need to set one max burst type=
,
> such as INCR8, which means controller will use any length less than or eq=
ual
> to this INCR8.
Any comment for it? Ten days passed away again :)
