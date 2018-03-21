Return-Path: <SRS0=W1u3=GL=gmail.com=richardcochran@kernel.org>
Date: Wed, 21 Mar 2018 14:26:23 -0700
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 1/5] net: Introduce peer to peer one step
 PTP time stamping.
Message-ID: <20180321212623.r6tmqts2n4npa5ki@localhost>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <60ae964d6a0da497bcac1d3fdb5b3fe01f5d70f1.1521656774.git.richardcochran@gmail.com>
 <02874ECE860811409154E81DA85FBB5882D02105@ORSMSX115.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02874ECE860811409154E81DA85FBB5882D02105@ORSMSX115.amr.corp.intel.com>
To: "Keller, Jacob E" <jacob.e.keller@intel.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 21, 2018 at 08:05:36PM +0000, Keller, Jacob E wrote:
> I am guessing that we expect all devices which support onestep P2P messages, will always support onestep SYNC as well?

Yes.  Anything else doesn't make sense, don't you think?

Also, reading 1588, it isn't clear whether supporting only 1-step Sync
without 1-step P2P is even intended.  There is only a "one-step
clock", and it is described as doing both.

Thanks,
Richard
