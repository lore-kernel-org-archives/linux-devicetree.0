From: Andy Green <andy@warmcat.com>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 07:49:43 +0000
Message-ID: <4D830E97.4010403@linaro.org>
References: <20110311165642.GA9996@kroah.com> <20110317214042.GQ31411@opensource.wolfsonmicro.com> <20110317214736.GA29014@kroah.com> <201103172333.01474.arnd@arndb.de> <20110317232756.GA3148@angua.secretlab.ca>
Reply-To: andy.green@linaro.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110317232756.GA3148@angua.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <greg@kroah.com>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Linux USB list <linux-usb@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/17/2011 11:27 PM, Somebody in the thread at some point said:

> The patch below also looks right to me.  I believe it also has the
> advantage of u-boot already knowing how to update the
> local-mac-address property at boot time.

In my (tested, working, complete) patch series, I allow platform_data 
based override of MAC at usbnet level, so all the drivers can benefit 
from it.

Is this not a case of "small thinking" from a Device Tree perspective 
that Arnd's patch only targets smsc95xx?  Or did I miss some 
disadvantage to allowing this functional configuration option at usbnet 
layer?

-Andy
