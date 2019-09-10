From: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: mv88e6xxx: add ability to set default
 queue priorities per port
Date: Tue, 10 Sep 2019 21:46:34 +0100
Message-ID: <CA+h21hpS9YYDwv0JzmA5BBSanV+w2jvyZdtFqYt=GL+hEc=ufA@mail.gmail.com>
References: <20190910154238.9155-1-bob.beckett@collabora.com>
 <20190910154238.9155-4-bob.beckett@collabora.com> <23101286-4da2-2a53-e7cd-71ead263bbaa@gmail.com>
 <20190910124952.GG32337@t480s.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190910124952.GG32337@t480s.localdomain>
Sender: netdev-owner@vger.kernel.org
To: Vivien Didelot <vivien.didelot@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Robert Beckett <bob.beckett@collabora.com>, netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, Ido Schimmel <idosch@mellanox.com>
List-Id: devicetree@vger.kernel.org

Hi guys,

On 10/09/2019, Vivien Didelot <vivien.didelot@gmail.com> wrote:
> Hi Robert,
>
> On Tue, 10 Sep 2019 09:42:24 -0700, Florian Fainelli <f.fainelli@gmail.com>
> wrote:
>> This is a vendor specific driver/property,
>> marvell,default-queue-priority (which be cheapskate on words) would be
>> more readable. But still, I have some more fundamental issues with the
>> general approach, see my response in the cover letter.
>
> As Florian said, the DT is unlikely to welcome vendor specific nodes for
> configuration which may be generic through standard network userspace
> tools.
>
>
> Thanks,
>
> 	Vivien
>

While I do agree that the DT bindings are a big no-no for QoS
settings, the topic is interesting.
What is the user space knob for configuring port-default priority (say
RX queue)?
Something like this maybe? (a very forced "matchall" with rxnfc)
ethtool --config-nfc eth0 flow-type ether src 00:00:00:00:00:00 m
00:00:00:00:00:00 action 5

Regards,
-Vladimir
