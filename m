From: Manish Narani <MNARANI@xilinx.com>
Subject: RE: [PATCH v5 2/4] dt: bindings: Document ZynqMP DDRC in Synopsys
 documentation
Date: Thu, 6 Sep 2018 15:21:49 +0000
Message-ID: <DM6PR02MB52276BECB56DCAB7576CDB53C1010@DM6PR02MB5227.namprd02.prod.outlook.com>
References: <1535722070-10394-1-git-send-email-manish.narani@xilinx.com>
 <1535722070-10394-3-git-send-email-manish.narani@xilinx.com>
 <20180904141618.GA5516@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904141618.GA5516@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "olof@lixom.net" <olof@lixom.net>, Srinivas Goud <sgoud@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, September 4, 2018 7:46 PM
> To: Manish Narani <MNARANI@xilinx.com>
> Cc: mark.rutland@arm.com; Michal Simek <michals@xilinx.com>;
> bp@alien8.de; mchehab@kernel.org; leoyang.li@nxp.com;
> amit.kucheria@linaro.org; olof@lixom.net; Srinivas Goud <sgoud@xilinx.com=
>;
> Anirudha Sarangi <anirudh@xilinx.com>; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> edac@vger.kernel.org
> Subject: Re: [PATCH v5 2/4] dt: bindings: Document ZynqMP DDRC in Synopsy=
s
> documentation
>=20
> On Fri, Aug 31, 2018 at 06:57:48PM +0530, Manish Narani wrote:
> > Add information of ZynqMP DDRC which reports the single bit errors
> > that are corrected and the double bit errors that are detected.
> >
> > Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> > ---
> >  .../bindings/memory-controllers/synopsys.txt       | 27 ++++++++++++++=
++++-
> ---
> >  1 file changed, 22 insertions(+), 5 deletions(-)
>=20
> Please add acks/reviewed-bys when posting new versions.
Sure. I will include it in v6.

Thanks,
Manish Narani
