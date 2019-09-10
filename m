From: Vivien Didelot <vivien.didelot@gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: mv88e6xxx: add ability to set default
 queue priorities per port
Date: Tue, 10 Sep 2019 12:49:52 -0400
Message-ID: <20190910124952.GG32337@t480s.localdomain>
References: <20190910154238.9155-1-bob.beckett@collabora.com>
 <20190910154238.9155-4-bob.beckett@collabora.com>
 <23101286-4da2-2a53-e7cd-71ead263bbaa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <23101286-4da2-2a53-e7cd-71ead263bbaa@gmail.com>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Robert Beckett <bob.beckett@collabora.com>, netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, Ido Schimmel <idosch@mellanox.com>
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Tue, 10 Sep 2019 09:42:24 -0700, Florian Fainelli <f.fainelli@gmail.com> wrote:
> This is a vendor specific driver/property,
> marvell,default-queue-priority (which be cheapskate on words) would be
> more readable. But still, I have some more fundamental issues with the
> general approach, see my response in the cover letter.

As Florian said, the DT is unlikely to welcome vendor specific nodes for
configuration which may be generic through standard network userspace tools.


Thanks,

	Vivien
