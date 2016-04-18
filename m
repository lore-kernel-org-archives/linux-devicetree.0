From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 1/5] phy: Add a driver for simple phy
Date: Mon, 18 Apr 2016 18:00:19 +0530
Message-ID: <5714D35B.8000208@ti.com>
References: <1447708924-15076-1-git-send-email-albeu@free.fr>
 <1447708924-15076-2-git-send-email-albeu@free.fr> <570F303A.6030605@ti.com>
 <4848615.OezLJod6Cv@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4848615.OezLJod6Cv@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alban Bedel <albeu@free.fr>, linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Sunday 17 April 2016 01:20 AM, Arnd Bergmann wrote:
> On Thursday 14 April 2016 11:22:58 Kishon Vijay Abraham I wrote:
>>
>> IMO simple-phy driver should be an independent driver and shouldn't export
>> symbols. The dt binding for the simple phy device should be something like
>> below where all the properties of the simple phy device should be in the
>> binding documentation.
>> usbphy {
>>         compatible = "simple-phy";
>>         phy-supply = <&supply>;
>>         clocks = <&clock>;
>>         reset = <&reset>;
>> };
>>
>> Anything that needs more than this shouldn't be a simple phy.
> 
> I think there are two aspects here:
> 
> a) I agree that a driver that matches "simple-phy" should only call
>    the generic functions and not use any other properties.
> 
> b) Independent of that, I think that it makes a lot of sense to export
>    those functions from the generic PHY subsystems so they can be
>    called from drivers that are a little less generic, or that already
>    have an established binding but need no other code.

These export functions can be abused and called directly from the controller
driver bypassing the phy core.

Actually lot of generic PHY programming are done in the phy-core itself. (For
example, the generic PHY regulator binding "phy-supply" can be used for the phy
core to enable the regulator during power on and disable during power off, phy
core also invokes pm_runtime API's during power_on and power_off which can be
used to enable/disable clocks). So drivers which are less generic can just
populate their specific handling part in their phy ops and leave the rest to be
done in phy core.
"simple-phy" should be used to avoid adding new PHY drivers that does simple
PHY ops.

Thanks
Kishon
