From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] r8169: Load MAC address from device tree if present
Date: Fri, 25 Jan 2019 20:23:29 +0100
Message-ID: <39547002-74f3-66c4-93ce-9adf72841b8e@gmail.com>
References: <20190125101814.6262-1-thierry.reding@gmail.com>
 <20190125145711.GF12962@lunn.ch>
 <42d32783-c433-b859-6ba4-f2864f034871@gmail.com>
 <20190125190715.GG22211@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125190715.GG22211@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>, "David S. Miller" <davem@davemloft.net>, Realtek linux nic maintainers <nic_swsd@realtek.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25.01.2019 20:07, Andrew Lunn wrote:
>> Andrew, for my understanding: What do you think is wrong with the 
>> alignment requirement? It was introduced because we do a 32 bit access
>> to the start address of the array and want to avoid an unaligned access.
> 
> Hi Heiner
> 
> Because you are doing pointer aliasing, the compiler will by default
> generate bad code, doing unaligned access. Adding the attribute works
> around this. But it is just a work around. Since this is very slow
> path code, i would just avoid the pointer aliasing, write a bit more C
> code as Thierry suggested, and the optimiser will probably figure out
> what is going on and produce reasonable code.
> 
> Also, in general, by avoiding pointer aliasing, you allow static code
> checkers to work better. They are more likely to discover buffer
> overruns, etc.
> 
>     Andrew
> 

Thanks, good to know.

The following doesn't hurt us here, but things like this have to be
considered too. According to chip spec:

"The ID registers 0-5 are only permitted to write by 4-byte access.
Read access can be byte, word, or double word access."

Heiner
