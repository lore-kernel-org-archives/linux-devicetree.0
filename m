From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 1/4] net: dsa: Change DT bindings for Vitesse VSC73xx
 switches
Date: Thu, 4 Jul 2019 13:22:10 -0700
Message-ID: <ae24004f-64c5-fb80-db59-8ad7ecddfd95@gmail.com>
References: <20190703171924.31801-1-paweldembicki@gmail.com>
 <20190703171924.31801-2-paweldembicki@gmail.com>
 <CACRpkdb5LonYLpbOHj=Oo8Z7XjVUWoO0CuhOokxfSoY_fRinPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb5LonYLpbOHj=Oo8Z7XjVUWoO0CuhOokxfSoY_fRinPw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Pawel Dembicki <paweldembicki@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 7/4/2019 12:05 AM, Linus Walleij wrote:
> On Wed, Jul 3, 2019 at 7:21 PM Pawel Dembicki <paweldembicki@gmail.com> wrote:
> 
>> This commit introduce how to use vsc73xx platform driver.
>>
>> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> 
> Nice!
> 
>> +If Platform driver is used, the device tree node is an platform device so it
>> +must reside inside a platform bus device tree node.
> 
> I would write something like "when connected to a memory bus, and
> used in memory-mapped I/O mode, a platform device is used to represent
> the vsc73xx" so it is clear what is going on.

Agreed, with that fixed:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
