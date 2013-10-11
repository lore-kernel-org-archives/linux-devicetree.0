From: Benoit Cousson <bcousson@baylibre.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: dra7-evm: Add mmc1 node for micro-sd
 support
Date: Fri, 11 Oct 2013 21:16:23 +0200
Message-ID: <52584E87.3030809@baylibre.com>
References: <1381163104-6318-1-git-send-email-balajitk@ti.com> <5255A59C.5040301@ti.com> <52582AF2.6070502@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <52582AF2.6070502@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Balaji T K <balajitk@ti.com>, Sekhar Nori <nsekhar@ti.com>
Cc: devicetree@vger.kernel.org, tony@atomide.com, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Balaji,

On 11/10/2013 18:44, Balaji T K wrote:
> On Thursday 10 October 2013 12:21 AM, Sekhar Nori wrote:
>> On Monday 07 October 2013 09:55 PM, Balaji T K wrote:
>>> Add mmc1 dt node to dra7-evm board.
>>> Input for ldo1 regulator is controlled by gpio 5 of pcf8575 chip (0x21)
>>> on i2c1 bus. When dt support for gpio-pcf857x is available, input supply
>>> will be modelled as cascaded regulator.
>>>
>>> Signed-off-by: Balaji T K <balajitk@ti.com>
>>
>> Acked-by: Sekhar Nori <nsekhar@ti.com>
>>
> Hi Benoit,
>
> Can you let me know if you have any comments on this patch series?

The series looks good, and I've just applied it for 3.13.

Thanks,
Benoit

