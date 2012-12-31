From: Dongjin Kim <tobetter@gmail.com>
Subject: Re: [PATCH] USB: misc: Add USB3503 High-Speed Hub Controller
Date: Mon, 31 Dec 2012 12:36:07 +0900
Message-ID: <CADoNuNdJyH5+RrtS9LCY_zMpfOG6C=+0WyaG9H1XK2E39mm6CQ@mail.gmail.com>
References: <1356922268-13098-1-git-send-email-tobetter@gmail.com>
	<20121231032200.GA5769@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121231032200.GA5769@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, =?ISO-8859-1?Q?Ren=E9_B=FCrgel?= <rene.buergel@sohard.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Greg,

Thanks for your reviewing.

The mode switching is required for power management, and actually it
is not tested properly yet. Therefore suspend/resume functions are
missing in the current patch but kept the switching function for the
future.

Thanks again.
Dongjin.


On Mon, Dec 31, 2012 at 12:22 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Mon, Dec 31, 2012 at 11:50:54AM +0900, Dongjin Kim wrote:
>> This patch adds new driver of SMSC USB3503 USB 2.0 hub controller with HSIC
>> upstream connectivity and three USB 2.0 downstream ports. The specification
>> can be found from 'http://www.smsc.com/index.php?tid=295&pid=325'.
>>
>> The current version have been tested very basic features switching the modes,
>> HUB-MODE and STANDBY-MODE.
>
> What causes the modes to be switched?  From reading the driver, that
> only seems possible to do at boot/load time when the driver reads the
> platform data, right?  After that, nothing happens to the device from
> what I can tell.
>
> Is something going to cause the state of the device to change in the
> future?
>
>> +             hub->mode = mode;
>> +             dev_info(&i2c->dev, "switched to HUB mode\n");
>
> Can you please switch all of the dev_info() calls to dev_dbg()?  There's
> no need to tell the world what is going on in this driver, no one really
> cares.  And if they do, they can dynamically enable debugging and get
> the information then :)
>
> thanks,
>
> greg k-h
