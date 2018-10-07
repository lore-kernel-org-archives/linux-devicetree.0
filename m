From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Sun, 7 Oct 2018 12:06:10 -0700
Message-ID: <6cbc885b-b590-0f1a-7203-b1746befa4f5@gmail.com>
References: <20181007173823.21590-3-richardcochran@gmail.com>
 <20181007182751.GC22794@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181007182751.GC22794@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org



On 10/7/2018 11:27 AM, Andrew Lunn wrote:
> On Sun, Oct 07, 2018 at 10:38:20AM -0700, Richard Cochran wrote:
>> Currently the stack supports time stamping in PHY devices.  However,
>> there are newer, non-PHY devices that can snoop an MII bus and provide
>> time stamps.  In order to support such devices, this patch introduces
>> a new interface to be used by both PHY and non-PHY devices.
>>
>> In addition, the one and only user of the old PHY time stamping API is
>> converted to the new interface.
> 
> Hi Richard
> 
> I'm a bit undecided about this. If you look at how we do HWMON sensors
> in PHYs, the probe function just registers with the HWMON subsystem.
> We don't have any support in phy_device, or anywhere else in the PHY
> core.
> 
> The mii_timestamper is generic, in the same why hwmon is generic. It
> does not matter where the time stamper is. So i'm wondering if we
> should remove the special case for a PHY timestamper, remove all the
> phylib support, etc.
> 
> I need to look at the other patches and see how this all fits
> together.

Agreed, the fact that some PHYs capable of timestamping and register 
themselves as a timestamper makes sense, whether this needs to be backed 
into the core PHYLIB might have been something convenient at some point, 
but maybe we can revisit that paradigm now that there is more generic 
timestamping provider framework being proposed here.
-- 
Florian
