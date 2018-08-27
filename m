From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: NSP: Enable SFP on bcm958625hr
Date: Mon, 27 Aug 2018 13:52:42 -0700
Message-ID: <4a0e7b46-f7b6-3e9a-5f67-8160537482c8@gmail.com>
References: <20180827200344.16158-1-f.fainelli@gmail.com>
 <20180827200344.16158-2-f.fainelli@gmail.com>
 <20180827203500.GN27483@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827203500.GN27483@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, rmk+kernel@armlinux.org.uk
List-Id: devicetree@vger.kernel.org

On 08/27/2018 01:35 PM, Andrew Lunn wrote:
>> @@ -210,6 +228,17 @@
>>  			reg = <4>;
>>  		};
>>  
>> +		port@5 {
>> +			label = "sfp";
>> +			phy-mode = "sgmii";
>> +			reg = <5>;
>> +			sfp = <&sfp>;
>> +			fixed-link {
>> +				speed = <1000>;
>> +				full-duplex;
>> +			};
> 
> Hi Florian
> 
> You might want to add a comment about why you are using fixed-link and
> sgmii, which seems very odd. Is it even correct?

Probably not, this is kind of left over from before adding the sfp
phandle, but if I do remove it, and I can see the DSA slave network
device fail to initialize, likely because we destroy the PHYLINK instance.

AFAIR, when we talked about this with Russell, I did not see why we had
to comment out the following:

diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 962c4fd338ba..f3ae16dbf8d8 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -1227,7 +1227,7 @@ static int dsa_slave_phy_setup(struct net_device
*slave_dev)
                        netdev_err(slave_dev,
                                   "failed to connect to port %d: %d\n",
                                   dp->index, ret);
-                       phylink_destroy(dp->pl);
+                       //phylink_destroy(dp->pl);
                        return ret;
                }
        }

maybe you know?
-- 
Florian
