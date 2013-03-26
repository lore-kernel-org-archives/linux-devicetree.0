From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3] USB: PHY: Palmas USB Transceiver Driver
Date: Tue, 26 Mar 2013 10:14:18 -0600
Message-ID: <5151C95A.6080508@wwwdotorg.org>
References: <1362662506-14823-4-git-send-email-kishon@ti.com> <1364203926-24488-1-git-send-email-kishon@ti.com> <51501CFB.4020905@nvidia.com> <51513A40.7080905@ti.com> <515163F6.3010400@slimlogic.co.uk> <20130326102100.GD11244@arwen.pp.htv.fi> <51517859.2020407@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51517859.2020407@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "balbi@ti.com" <balbi@ti.com>, Graeme Gregory <gg@slimlogic.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Rajendra Nayak <rnayak@ti.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "s-guiriec@ti.com" <s-guiriec@ti.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/26/2013 04:28 AM, Laxman Dewangan wrote:
> On Tuesday 26 March 2013 03:51 PM, Felipe Balbi wrote:
>> On Tue, Mar 26, 2013 at 09:01:42AM +0000, Graeme Gregory wrote:
...
>>>>> +       return regmap_read(palmas->regmap[slave], addr, dest);
>>>>>
>>>>>
>>>>> Please use the generic api for palmas_read()/palmas_write(0 as it will
>>>>> be ease on debugging on register access.
>>>>> Direct regmap_read() does not help much on this.
>>>>
>>>> Any reason why you dint use palmas_read()/palmas_write here?
>>>> Btw palmas_read()/palmas_write() internally uses regmap APIs.
>>>
>>> Because I was not a fan of tightly coupling the child devices to the
>>> parent MFD. palmas_read/write were added by Laxman.
>>
>> I guess regmap would also help abstracting SPI versus I2C connection.
>> IMHO, palmas_read/write should be removed.
>>
>> Laxman's complaint that it doesn't help with debugging is utter
>> nonsense.
>
> palams read/write api uses the regmap only and hence not break anything
> on abstraction.
> in place of doing the following three statement in whole word, it
> provides wrapper of palmas_read()
> which actually does the same.
> 
> slave = PALMAS_BASE_TO_SLAVE(PALMAS_USB_OTG_BASE);
> addr = PALMAS_BASE_TO_REG(PALMAS_USB_OTG_BASE, reg);
> regmap_read(palmas->regmap[slave], addr, dest);

Why would you ever do that? Surely each module's probe should create or
obtain a regmap object somehow, and then all other code in that driver
should simply use regmap_read()/regmap_write() without having to perform
any kind of calculations at all.

If the MFD components truly are pluggable mix/match IP blocks, then all
the register offset #defines must all be relative to the base of the IP
block, so there would be no need for any calculations there.

The I2C address and base register address for the regmap object should
come from DT or platform data, and be used one time in probe() to create
the regmap object.

Then, there would be no need for palmas_read()/palmas_write().

> Above 3 lines in all the places for resgister access or make single call:
> palmas_read(palmas, PALMAS_USB_OTG_BASE, PALMAS_USB_OTG_BASE, dest).
> 
> This function implement the above 3 lines.
