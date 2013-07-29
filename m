From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] pinctrl: pinconf_generic: add utility functions for
 add map/configs
Date: Mon, 29 Jul 2013 10:38:39 -0600
Message-ID: <51F69A8F.2000802@wwwdotorg.org>
References: <1374833754-19659-1-git-send-email-ldewangan@nvidia.com> <1374833754-19659-2-git-send-email-ldewangan@nvidia.com> <51F2B384.9050706@wwwdotorg.org> <51F39D98.1090008@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51F39D98.1090008@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "grant.likely@linaro.org" <grant.likely@linaro.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "kishon@ti.com" <kishon@ti.com>, Stephen Warren <swarren@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/27/2013 04:14 AM, Laxman Dewangan wrote:
> On Friday 26 July 2013 11:06 PM, Stephen Warren wrote:
>> On 07/26/2013 04:15 AM, Laxman Dewangan wrote:
>>> Some of pincontrol driver needs the utility function to create map
>>> list. The utility function needed for adding mux, configs etc.
>> Which other drivers already contain this code? Are you planning on
>> converting them over to use these new functions? The code looks
>> familiar, so I assume it's just cut/paste from Tegra with some renames,
>> so I didn't read it through in detail.
> 
> Yes, these functions are taken from the pinctrl-tegra driver. Other
> drivers which have similar implementation are nomadik, tegra, abx500,
> tz1090, tz1090-pdc.
> So All can use these utility function to avoid duplication and reduce
> code size.
> Yes, I have plan to use this in Tegra atleast but once this patch get
> accepted.
> 
> 
>>
>>>   drivers/pinctrl/pinconf-generic.c       |  105
>>> +++++++++++++++++++++++++++++++
>>>   include/linux/pinctrl/pinconf-generic.h |   52 +++++++++++++++
>> I don't think those are the correct files for this code. Presumably
>> there's no reason at all why a pinctrl driver that doesn't require
>> CONFIG_GENERIC_PINCONF can't use these basic utility functions. Perhaps
>> add a new pinctrl-utils file?
> 
> I thought generic implementation of parsing of dt is pinctrl-generic
> file and as these newly added APIs are require for the parsing the DT
> node, I added here.
> I can move this to pinctrl-util.c/h also.

pinctrl-generic isn't about DT, it's about defining generic options for
pin configuration rather than SoC-/driver-specific options for pin
configuration. (pin configuration being e.g. pull-up/down, bias
direction/strength, slew rate, etc.)
