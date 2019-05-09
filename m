Return-Path: <SRS0=MMxF=TJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from first.geanix.com ([116.203.34.67]:51776 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726561AbfEIH2I (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 May 2019 03:28:08 -0400
Subject: Re: [PATCH 1/2] can: mcp251x: add support for mcp25625
References: <20190507093437.26025-1-sean@geanix.com>
 <18a26b2f-5166-2142-4b8d-59818ac6fd8b@pengutronix.de>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <d6d3ae60-f457-989a-ca6c-028b75d9d115@geanix.com>
Date: Thu, 9 May 2019 09:27:58 +0200
MIME-Version: 1.0
In-Reply-To: <18a26b2f-5166-2142-4b8d-59818ac6fd8b@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>



On 08/05/2019 14.45, Marc Kleine-Budde wrote:
> On 5/7/19 11:34 AM, Sean Nyekjaer wrote:
>> Fully compatible with mcp2515, the mcp25625 have
>> integrated transceiver.
>>
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> 
> I've mentioned the mcp25625 to the .in file and properly introduced the
> mcp25625 as a new model in the driver itself. This way the debug output
> is formated properly:
> 
>> 	netdev_info(net, "MCP%x successfully initialized.\n", priv->model);
> 
> This is how the patch looks like now:
> 

Thanks looks good :-)
/Sean
