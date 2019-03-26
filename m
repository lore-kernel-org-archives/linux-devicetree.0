From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v4 1/4] dt-bindings: net: dsa: qca8k: fix example
Date: Tue, 26 Mar 2019 10:47:22 -0700 (PDT)
Message-ID: <20190326.104722.1926726991465471906.davem@davemloft.net>
References: <20190322000503.22431-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190322000503.22431-1-chunkeey@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: chunkeey@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@gmail.com, andrew@lunn.ch, robh+dt@kernel.org, mark.rutland@arm.com, marek.behun@nic.cz
List-Id: devicetree@vger.kernel.org

From: Christian Lamparter <chunkeey@gmail.com>
Date: Fri, 22 Mar 2019 01:05:00 +0100

> In the example, the phy at phy@0 is clashing with
> the switch0@0 at the same address. Usually, the switches
> are accessible through pseudo PHYs which in case of the
> qca8k are located at 0x10 - 0x18.
> 
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

Series applied.
