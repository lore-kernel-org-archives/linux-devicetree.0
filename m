From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 0/3] Add Renesas R8A77980 GEther support
Date: Sat, 19 May 2018 23:25:04 -0400 (EDT)
Message-ID: <20180519.232504.690023495926796720.davem@davemloft.net>
References: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
Sender: netdev-owner@vger.kernel.org
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Fri, 18 May 2018 21:28:29 +0300

> Here's a set of 3 patches against DaveM's 'net-next.git' repo. They (gradually)
> add R8A77980 GEther support to the 'sh_eth' driver, starting with couple new
> register bits/values introduced with this chip, and ending with adding a new
> 'struct sh_eth_cpu_data' instance connected to the new DT "compatible" prop
> value...

Series applied, thanks.
