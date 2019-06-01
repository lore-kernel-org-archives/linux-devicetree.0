From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH V5 net-next 0/6] Peer to Peer One-Step time stamping
Date: Fri, 31 May 2019 17:13:09 -0700 (PDT)
Message-ID: <20190531.171309.290138318415845331.davem@davemloft.net>
References: <cover.1559281985.git.richardcochran@gmail.com>
        <20190531.145456.1740583785604198757.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190531.145456.1740583785604198757.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: richardcochran@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, jacob.e.keller@intel.com, mark.rutland@arm.com, mlichvar@redhat.com, robh+dt@kernel.org, willemb@google.com
List-Id: devicetree@vger.kernel.org

From: David Miller <davem@davemloft.net>
Date: Fri, 31 May 2019 14:54:56 -0700 (PDT)

> From: Richard Cochran <richardcochran@gmail.com>
> Date: Thu, 30 May 2019 22:56:20 -0700
> 
>> This series adds support for PTP (IEEE 1588) P2P one-step time
>> stamping along with a driver for a hardware device that supports this.
>  ...
> 
> Series applied, will push out after build testing :-)

This also does not build.

Please do an allmodconfig build and save me from having to do this
another time.

Thank you.

====================
ERROR: "register_mii_tstamp_controller" [drivers/ptp/ptp_ines.ko] undefined!
ERROR: "unregister_mii_tstamp_controller" [drivers/ptp/ptp_ines.ko] undefined!
ERROR: "unregister_mii_timestamper" [drivers/of/of_mdio.ko] undefined!
ERROR: "register_mii_timestamper" [drivers/of/of_mdio.ko] undefined!
ERROR: "unregister_mii_timestamper" [drivers/net/phy/libphy.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:91: __modpost] Error 1
make: *** [Makefile:1290: modules] Error 2
====================
