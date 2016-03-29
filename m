From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (adm1031) Add device tree support
Date: Tue, 29 Mar 2016 07:20:29 -0700
Message-ID: <56FA8F2D.3040703@roeck-us.net>
References: <1459241443-28392-1-git-send-email-joel@jms.id.au>
 <56FA477C.8030607@roeck-us.net>
 <CACPK8XdyB2mwswJu8=EVjf9519fwBxhrrkkMSn3=JGSqiAY_Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <CACPK8XdyB2mwswJu8=EVjf9519fwBxhrrkkMSn3=JGSqiAY_Dw@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>, linux-hwmon@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Joel,

On 03/29/2016 02:34 AM, Joel Stanley wrote:
> Hello Guenter,
>
> On Tue, Mar 29, 2016 at 7:44 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 03/29/2016 01:50 AM, Joel Stanley wrote:
>>>
>>> This adds a of_device_id table so we can probe the driver using the
>>> device tree.
>>>
>> The subject line does not match the driver being modified; it suggests
>> adm1031
>> while in reality the adm1275 driver is being modified.
>
> Apologies, that's what I get for writing a patch as I'm walking out the door.
>
>> Besides, this should already work, through trivial bindings.
>> Is there a reason to believe that it does not already work ?
>
> I wasn't aware that we had such a mechanism, thank you. I assume you
> referring to bindings/i2c/trival-devices.txt?
>
Yes, and the associated mechanism.

> As background for why I added the bindings; originally this code was
> patch one of two. The second added a device tree property to inform
> the kernel of the external sense resistor so we could perform scaling
> in the kernel.
>
Add the bindings (all of them) in patch 1, and the code (all of it) in patch 2.

> I read the hwmon documentation on why this is not currently done.
> However, as the device tree is specific to a board - things like i2c
> addresses and which bus they are on - I was wondering if you would
> take patches to add such a feature?
>
Yes. Search for "shunt-resistor", which is already used for some of the
TI devices. Also see Documentation/devicetree/bindings/hwmon/ina2xx.txt.

Guenter

