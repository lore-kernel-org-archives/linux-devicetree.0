From: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
Subject: Re: [PATCH 1/2] net: phy: dp83867: Add documentation for SGMII mode
 type
Date: Fri, 6 Sep 2019 23:45:56 +0300
Message-ID: <23dc47ea-209f-9f51-d4a5-161e62e2a69e@cloudbear.ru>
References: <1567700761-14195-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <20190906192919.GA2339@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906192919.GA2339@lunn.ch>
Content-Language: ru
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, robh+dt@kernel.org, f.fainelli@gmail.com, Mark Rutland <mark.rutland@arm.com>, Trent Piepho <tpiepho@impinj.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi, Andrew.

I'm not familiar with generic PHY HW archs but suppose that it is 
proprietary to TI.

I'v never seen such feature so moved it in TI dts field.

Vitaly.

06.09.2019 22:29, Andrew Lunn wrote:
> On Thu, Sep 05, 2019 at 07:26:00PM +0300, Vitaly Gaiduk wrote:
>> Add documentation of ti,sgmii-type which can be used to select
>> SGMII mode type (4 or 6-wire).
> Hi Vitaly
>
> Is 4 vs 6-wire a generic SGMII property? Or is it proprietary to TI?
>
> I did a quick search and i could not find any other PHYs supporting
> it.
>
> 	Andrew
