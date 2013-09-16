From: Olof Johansson <olof@lixom.net>
Subject: Re: "memory" binding issues
Date: Mon, 16 Sep 2013 16:48:47 -0700
Message-ID: <CAOesGMjDFOThCYPgPq5mS8-Uk5Ye=omye329EKRsb-q_akTP4Q@mail.gmail.com>
References: <1379300274.4098.77.camel@pasglop>
	<52372F2A.2050003@wwwdotorg.org>
	<1379371567.3721.46.camel@pasglop>
	<CAOesGMgE1jiF5OHsmPQz2z66Bcqu0HeAj=taE1vmFK-0-0s2TQ@mail.gmail.com>
	<1379375239.3721.51.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379375239.3721.51.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Warren <swarren@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2013 at 4:47 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Mon, 2013-09-16 at 15:48 -0700, Olof Johansson wrote:
>> > A node that has a "reg" property should have the corresponding unit
>> > address.
>>
>> No, absolutely _NOT_ a requirement. Unit address is only required if
>> needed to disambiguate two properties with the same name.
>>
>> If there are no ambiguities, then leaving off the unit address is much
>> preferred.
>
> I disagree :-)

Well, good thing you've got your own arch to litter the device trees
with unit specifiers in then. :)

> Also this would be only true of our find_node_by_path was capable of
> handling it, which it isn't. Thus you end up with generic code looking
> for /memory and finding nothing ...

Yes, this should be fixed.


-Olof
