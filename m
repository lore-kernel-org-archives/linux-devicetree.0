From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/7] net: of_mdio improvements
Date: Fri, 06 Dec 2013 14:57:57 -0500 (EST)
Message-ID: <20131206.145757.1883774544372288081.davem@davemloft.net>
References: <1386283936-26104-1-git-send-email-florian@openwrt.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1386283936-26104-1-git-send-email-florian@openwrt.org>
Sender: netdev-owner@vger.kernel.org
To: florian@openwrt.org
Cc: netdev@vger.kernel.org, grant.likely@linaro.org, devicetree@vger.kernel.org, abrodkin@synopsys.com, rob.herring@calxeda.com, mark.rutland@arm.com, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

From: Florian Fainelli <florian@openwrt.org>
Date: Thu, 5 Dec 2013 14:52:09 -0800

> This patchset contains a few improvements to the MDIO device tree parsing
> code such as refactoring and parsing the "max-speed" property which is
> defined in the ePAPR specification.

Series applied, thanks.  I fixed up the missing space in the assignment.
