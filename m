From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cpuidle: kirkwood: Move out of mach directory, add DT.
Date: Fri, 28 Dec 2012 08:55:31 -0600
Message-ID: <50DDB2E3.103@gmail.com>
References: <1356698844-4220-1-git-send-email-andrew@lunn.ch>
 <50DDAA42.2020101@gmail.com> <20121228143517.GA5172@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121228143517.GA5172-g2DYL2Zd6BY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/28/2012 08:35 AM, Andrew Lunn wrote:
> On Fri, Dec 28, 2012 at 08:18:42AM -0600, Rob Herring wrote:
>> On 12/28/2012 06:47 AM, Andrew Lunn wrote:
>>> Move the Kirkwood cpuidle driver out of arch/arm/mach-kirkwood and
>>> into drivers/cpuidle. Convert the driver into a platform driver and
>>> add a device tree binding. Add a DT node to instantiate the driver for
>>> boards converted to DT, and a platform data for old style boards.
>>
>> Is this an old comment? I don't see any platform data.
> 
> There is no platform data, since all the driver needs is an address of
> the DDR control register. The code to create a platform device entry
> is in common.c hunk.

So you should say "a platform device for old style boards".

>>> +		cpuidle@1418 {
>>> +			compatible = "marvell,kirkwood-cpuidle";
>>> +			reg = <0x1418 0x4>;
>>> +		};
>>> +
>>
>> This is describing what linux wants, not the hardware. This is a common
>> problem with cpuidle drivers in that they use shared registers. I don't
>> have a good solution, but this doesn't belong in DTS.
> 
> Do you have a bad solution?

Ha! :) I should say I don't have a clear, obvious solution.

Don't do a platform driver and just check the machine compatible
property which is what I did for highbank. Have the machine code create
the platform device. Not *all* platform devices have to be created based
on the DTB. Create an MFD driver for the whole block of registers.

> I could just hard code the address, since its the same for all
> kirkwood SoCs. Also, the register is not being used by any other
> code on kirkwood, so its not shared.

Then describe it based on the reference manual, but you need to do so
assuming you are using all the other registers. I assume there are other
registers at say 0x1414 or 0x141c. You have to be careful if you create
separate nodes for each register or sub-group of registers. It needs to
work no matter what the OS expectation is.

Rob
