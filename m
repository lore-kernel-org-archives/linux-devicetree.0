Return-Path: <SRS0=qE9/=GL=intel.com=jacob.e.keller@kernel.org>
From: "Keller, Jacob E" <jacob.e.keller@intel.com>
Subject: RE: [PATCH net-next RFC V1 1/5] net: Introduce peer to peer one
 step PTP time stamping.
Date: Wed, 21 Mar 2018 23:51:25 +0000
Message-ID: <02874ECE860811409154E81DA85FBB5882D02569@ORSMSX115.amr.corp.intel.com>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <60ae964d6a0da497bcac1d3fdb5b3fe01f5d70f1.1521656774.git.richardcochran@gmail.com>
 <02874ECE860811409154E81DA85FBB5882D02105@ORSMSX115.amr.corp.intel.com>
 <20180321212623.r6tmqts2n4npa5ki@localhost>
In-Reply-To: <20180321212623.r6tmqts2n4npa5ki@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

> -----Original Message-----
> From: Richard Cochran [mailto:richardcochran@gmail.com]
> Sent: Wednesday, March 21, 2018 2:26 PM
> To: Keller, Jacob E <jacob.e.keller@intel.com>
> Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org; Andrew Lunn
> <andrew@lunn.ch>; David Miller <davem@davemloft.net>; Florian Fainelli
> <f.fainelli@gmail.com>; Mark Rutland <mark.rutland@arm.com>; Miroslav
> Lichvar <mlichvar@redhat.com>; Rob Herring <robh+dt@kernel.org>; Willem d=
e
> Bruijn <willemb@google.com>
> Subject: Re: [PATCH net-next RFC V1 1/5] net: Introduce peer to peer one =
step
> PTP time stamping.
>=20
> On Wed, Mar 21, 2018 at 08:05:36PM +0000, Keller, Jacob E wrote:
> > I am guessing that we expect all devices which support onestep P2P mess=
ages,
> will always support onestep SYNC as well?
>=20
> Yes.  Anything else doesn't make sense, don't you think?
>=20
> Also, reading 1588, it isn't clear whether supporting only 1-step Sync
> without 1-step P2P is even intended.  There is only a "one-step
> clock", and it is described as doing both.
>=20
> Thanks,
> Richard

This was my understanding as well, but given the limited hardware which can=
 do sync but not pdelay messages, I just wanted to make sure we were on the=
 same page.

Thanks,
Jake
