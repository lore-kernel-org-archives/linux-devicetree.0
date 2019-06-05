From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v4 00/10] net: dsa: mv88e6xxx: support for
 mv88e6250
Date: Tue, 04 Jun 2019 20:11:22 -0700 (PDT)
Message-ID: <20190604.201122.810789004477157679.davem@davemloft.net>
References: <20190604073412.21743-1-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604073412.21743-1-rasmus.villemoes@prevas.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: rasmus.villemoes@prevas.dk
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rasmus.Villemoes@prevas.se
List-Id: devicetree@vger.kernel.org

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Date: Tue, 4 Jun 2019 07:34:22 +0000

> This adds support for the mv88e6250 chip. Initially based on the
> mv88e6240, this time around, I've been through each ->ops callback and
> checked that it makes sense, either replacing with a 6250 specific
> variant or dropping it if no equivalent functionality seems to exist
> for the 6250. Along the way, I found a few oddities in the existing
> code, mostly sent as separate patches/questions.
> 
> The one relevant to the 6250 is the ieee_pri_map callback, where the
> existing mv88e6085_g1_ieee_pri_map() is actually wrong for many of the
> existing users. I've put the mv88e6250_g1_ieee_pri_map() patch first
> in case some of the existing chips get switched over to use that and
> it is deemed important enough for -stable.
 ...

Series applied, thanks.
