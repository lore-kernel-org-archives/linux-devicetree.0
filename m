From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] net: phy: dp83867: Add documentation for SGMII mode
 type
Date: Sat, 7 Sep 2019 08:41:22 -0700
Message-ID: <8055f8ce-5a8e-fa53-311d-3f27a72f58bd@gmail.com>
References: <1567700761-14195-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <20190906192919.GA2339@lunn.ch>
 <23dc47ea-209f-9f51-d4a5-161e62e2a69e@cloudbear.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <23dc47ea-209f-9f51-d4a5-161e62e2a69e@cloudbear.ru>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>, Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>, Trent Piepho <tpiepho@impinj.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 9/6/2019 1:45 PM, Vitaly Gaiduk wrote:
> Hi, Andrew.
> 
> I'm not familiar with generic PHY HW archs but suppose that it is
> proprietary to TI.
> 
> I'v never seen such feature so moved it in TI dts field.

My search engine results seem to indicate that this is indeed TI
specific only and this is not something that exists with other vendors
apparently. The "ti," prefix is therefore appropriate.
-- 
Florian
