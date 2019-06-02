From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v3 0/2] Add hw offload of TC flower on MSCC
 Ocelot
Date: Sun, 02 Jun 2019 13:50:10 -0700 (PDT)
Message-ID: <20190602.135010.1382762534390460032.davem@davemloft.net>
References: <1559287017-32397-1-git-send-email-horatiu.vultur@microchip.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559287017-32397-1-git-send-email-horatiu.vultur@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: horatiu.vultur@microchip.com
Cc: alexandre.belloni@bootlin.com, UNGLinuxDriver@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Horatiu Vultur <horatiu.vultur@microchip.com>
Date: Fri, 31 May 2019 09:16:55 +0200

> This patch series enables hardware offload for flower filter used in
> traffic controller on MSCC Ocelot board.
> 
> v2->v3 changes:
>  - remove the check for shared blocks
> 
> v1->v2 changes:
>  - when declaring variables use reverse christmas tree

Series applied, thanks.
