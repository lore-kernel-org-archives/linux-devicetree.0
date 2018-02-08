From: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: ls1021a: add quadspi node
Date: Thu, 8 Feb 2018 15:24:40 +0100
Message-ID: <43c533e2-2b93-9672-3905-5f4ba8d6db19@prevas.dk>
References: <20180126142014.13819-1-rasmus.villemoes@prevas.dk>
 <20180205080323.GP31354@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205080323.GP31354@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-02-05 09:03, Shawn Guo wrote:
> On Fri, Jan 26, 2018 at 03:20:14PM +0100, Rasmus Villemoes wrote:
>> Add a node to device tree repesenting the QuadSPI controller present on
>> LS1021a. Driver support has been present since e8c034b2fbe5 (mtd:
>> spi-nor: fsl-quadspi: add support for ls1021a).
>>
>> Signed-off-by: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> 
> Applied, thanks.
> 

Sorry, I didn't know you already had a similar patch queued for 4.16
(85f8ee78ab ARM: dts: ls1021a: Add support for QSPI with ls1021a SoC),
so I have to ask you to unapply (or do you want me to send a revert?) -
the ls1021a.dtsi in your imx/dt branch now has two almost-identical
qspi: nodes.

Rasmus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
