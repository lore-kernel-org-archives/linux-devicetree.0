From: Marco Felsch <mfe@pengutronix.de>
Subject: Re: [PATCH v2 0/1] net: phy: micrel: add 125MHz reference clock
 workaround
Date: Tue, 15 May 2018 10:06:21 +0200
Message-ID: <9a9956ef-5ba7-8cf6-93ba-8bf6c485de14@pengutronix.de>
References: <20180515074527.22546-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180515074527.22546-1-m.felsch@pengutronix.de>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, niebelm@tqsc.de, kernel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

I forgot to set the thread option. I will resend with thread option 
enabled.

On 05/15/2018 09:45 AM, Marco Felsch wrote:

> This patch adds the workaround for the errata#2. The KSZ9031 phy
> 125MHz reference clock jitter is to high if the phy is configured as
> slave. This will cause errors if a application uses the clock as
> MAC reference clock. The workaround is to configure the phy as master.
>
> v2:
> - add more code and dt-binding comments
> - delete unnecessary local variables
> - add error handling
>
> v1:
> - initial commit
>
> Markus Niebel (1):
>    net: phy: micrel: add 125MHz reference clock workaround
>
>   .../bindings/net/micrel-ksz90x1.txt           |  7 ++++
>   drivers/net/phy/micrel.c                      | 32 +++++++++++++++++++
>   2 files changed, 39 insertions(+)
>
>
