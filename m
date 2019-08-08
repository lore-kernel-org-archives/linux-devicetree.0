From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 02/15] net: phy: adin: hook genphy_read_abilities() to
 get_features
Date: Thu, 8 Aug 2019 21:32:57 +0200
Message-ID: <eeda87c9-bdba-8ef7-6043-85a16bd2cfc2@gmail.com>
References: <20190808123026.17382-1-alexandru.ardelean@analog.com>
 <20190808123026.17382-3-alexandru.ardelean@analog.com>
 <20190808152403.GB27917@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808152403.GB27917@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com
List-Id: devicetree@vger.kernel.org

On 08.08.2019 17:24, Andrew Lunn wrote:
> On Thu, Aug 08, 2019 at 03:30:13PM +0300, Alexandru Ardelean wrote:
>> The ADIN PHYs can operate with Clause 45, however they are not typical for
>> how phylib considers Clause 45 PHYs.
>>
>> If the `features` field & the `get_features` hook are unspecified, and the
>> device wants to operate via Clause 45, it would also try to read features
>> via the `genphy_c45_pma_read_abilities()`, which will try to read PMA regs
>> that are unsupported.
>>
>> Hooking the `genphy_read_abilities()` function to the `get_features` hook
>> will ensure that this does not happen and the PHY features are read
>> correctly regardless of Clause 22 or Clause 45 operation.
> 
> I think we need to stop and think about a PHY which supports both C22
> and C45.
> 
> How does bus enumeration work? Is it discovered twice?  I've always
> considered phydev->is_c45 means everything is c45, not that some
> registers can be accessed via c45. But the driver is mixing c22 and
> c45. Does the driver actually require c45? Are some features which are
> only accessibly via C45? What does C45 actually bring us for this
> device?
> 
genphy_c45_pma_read_abilities() is only called if phydev->is_c45 is set.
And this flag means that the PHY complies with Clause 45 incl. all the
standard devices like PMA. In the case here only some vendor-specific
registers can be accessed via Clause 45 and therefore is_c45 shouldn't
bet set. As a consequence this patch isn't needed.

>      Andrew
> 
Heiner
