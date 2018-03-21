Return-Path: <SRS0=qE9/=GL=intel.com=jacob.e.keller@kernel.org>
From: "Keller, Jacob E" <jacob.e.keller@intel.com>
Subject: RE: [PATCH net-next RFC V1 1/5] net: Introduce peer to peer one
 step PTP time stamping.
Date: Wed, 21 Mar 2018 20:05:36 +0000
Message-ID: <02874ECE860811409154E81DA85FBB5882D02105@ORSMSX115.amr.corp.intel.com>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <60ae964d6a0da497bcac1d3fdb5b3fe01f5d70f1.1521656774.git.richardcochran@gmail.com>
In-Reply-To: <60ae964d6a0da497bcac1d3fdb5b3fe01f5d70f1.1521656774.git.richardcochran@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Richard Cochran <richardcochran@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>



> -----Original Message-----
> From: netdev-owner@vger.kernel.org [mailto:netdev-owner@vger.kernel.org]
> On Behalf Of Richard Cochran
> Sent: Wednesday, March 21, 2018 11:58 AM
> To: netdev@vger.kernel.org
> Cc: devicetree@vger.kernel.org; Andrew Lunn <andrew@lunn.ch>; David Mille=
r
> <davem@davemloft.net>; Florian Fainelli <f.fainelli@gmail.com>; Mark Rutl=
and
> <mark.rutland@arm.com>; Miroslav Lichvar <mlichvar@redhat.com>; Rob
> Herring <robh+dt@kernel.org>; Willem de Bruijn <willemb@google.com>
> Subject: [PATCH net-next RFC V1 1/5] net: Introduce peer to peer one step=
 PTP
> +
> +	/*
> +	 * Same as HWTSTAMP_TX_ONESTEP_SYNC, but also enables time
> +	 * stamp insertion directly into PDelay_Resp packets. In this
> +	 * case, neither transmitted Sync nor PDelay_Resp packets will
> +	 * receive a time stamp via the socket error queue.
> +	 */
> +	HWTSTAMP_TX_ONESTEP_P2P,
>  };
>=20

I am guessing that we expect all devices which support onestep P2P messages=
, will always support onestep SYNC as well?

Thanks,
Jake
