From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH v1 0/3] device property: Support MAC address in VPD
Date: Fri, 31 Aug 2018 09:43:30 +0100
Message-ID: <44c7fc7a-9c1c-e894-f27f-5320c061aafc@linaro.org>
References: <20180814223758.117433-1-briannorris@chromium.org>
 <a240b3f9-d41b-30d7-ef11-5dcd1a981c0f@gmail.com>
 <20180815002204.GA258561@ban.mtv.corp.google.com>
 <bb1b2b7d-2c47-a6b3-7618-063351f379b2@gmail.com>
 <20180815014436.GA17200@ban.mtv.corp.google.com>
 <20180815221601.GB24830@rob-hp-laptop>
 <20180831012656.GB67271@ban.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831012656.GB67271@ban.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>, Rob Herring <robh@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

Sorry for the delay!! For some reason I missed this email thread totally!

On 31/08/18 02:26, Brian Norris wrote:
>> Seems to me that nvmem needs to be extended to allow providers to
>> retrieve and interpret data. Not everything is at some fixed offset and
>> size. Something like this is valid dts:
>>
>> nvmem = <&phandle> "a-string";
>>

There has been some discussion on extending nvmem support to MTD and 
non-DT users in https://patchwork.kernel.org/cover/10562365/

One of the thing which we discussed in this thread is adding compatible 
strings to cells mainly to
1> Differentiate between actual cells and partitions for MTD case.

2> Allow provider specific bindings for each cell, in VPD instance key 
string & value length could be one them.

This means that we would endup adding xlate callback support to the 
nvmem_config.

AFAIU, From consumer side old bindings should still work!

 From non-dt or ACPI side these cells can be parsed by the provider 
driver and add it to the nvmem_config.

Does this make sense? Or Did I miss anything obvious ?


>> But that's pretty uncommon (I can't think of a binding that actually
>> uses that). Perhaps the provider has an array of keys defined and the
>> consumer just provides the index.
> In the case of VPD, all keys are 0-terminated strings (there's also a
> length field, but the key is still 0-terminated), so that scheme could
> work. (I'm not sure an indexed provider is extremely relevant right now,
> although it probably could be supported if I expand the of_nvmem
> retrieval to support a generic of_xlate() override anyway.) The
> information represented is almost the same as in my proposal, except that:
> (a) now I have to give the VPD a phandle -- so far, I've avoided that,
>      as it's just an auto-enumerated device underneath the
>      /firmware/coreboot device (see drivers/firmware/google/vpd.c)
> (b) this is no longer directly useful to ACPI systems -- I'm not
>      actually sure how (if at all) nvmem provider/consumer is supposed to
>      work there
> 
> But maybe this isn't really that useful to ACPI, and it's sufficient to
> just have fwnode_get_mac_address() call of_get_nvmem_mac_address() when
> we're using DT.
> 
>> Or we could do '<key>-nvmem = <&phandle>', but parsing that is a bit
>> more complicated.
> That doesn't seem to have much advantage to me.
