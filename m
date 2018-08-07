From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/3] Add Broadcom Omega SoC internal switch and phy
Date: Tue, 07 Aug 2018 15:49:01 -0700 (PDT)
Message-ID: <20180807.154901.1465546829516526941.davem@davemloft.net>
References: <1533661364-15381-1-git-send-email-arun.parameswaran@broadcom.com>
        <20180807180827.GH18350@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807180827.GH18350@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch
Cc: arun.parameswaran@broadcom.com, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 7 Aug 2018 20:08:27 +0200

> On Tue, Aug 07, 2018 at 10:02:41AM -0700, Arun Parameswaran wrote:
>> Hi,
>> 
>> The patchset is based on David Miller's "net-next" repo.
>> 
>> The patches add support for the Broadcom Omega SoC's internal ethernet
>> switch and the internal gphy.
>> 
>> The internal ethernet switch in the Omega is a b53 srab based switch.
>> The support for the switch is added to the b53 driver in the dsa
>> framework.
>> 
>> The gphy support is added to the bcm7xxx driver.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Series applied.
