Return-Path: <SRS0=kxya=HG=codeaurora.org=yossim@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 17 Apr 2018 16:00:23 +0300
From: yossim@codeaurora.org
Subject: Re: [Dragonboard-aosp] [PATCH 2/4] usb: chipidea: Hook into mux
 framework to toggle usb switch
In-Reply-To: <b0f6848a-08d6-04ab-4b60-c31aea81041b@axentia.se>
References: <1519199101-27065-1-git-send-email-yossim@codeaurora.org>
 <1519199101-27065-2-git-send-email-yossim@codeaurora.org>
 <20180301221104.uo5xbwjn6gjhfcb6@rob-hp-laptop>
 <6f4463b04060484bb8cca2e3a5468012@euamsexm01e.eu.qualcomm.com>
 <22d3658b-d5a0-108b-c8f2-92cbe3786e5b@axentia.se>
 <889cbb389bee49aea02a8b5de89ed10f@euamsexm01e.eu.qualcomm.com>
 <b0f6848a-08d6-04ab-4b60-c31aea81041b@axentia.se>
Message-ID: <bc531a6e55ace1da59a05b4e93bf1cea@codeaurora.org>
To: Peter Chen <peter.chen@nxp.com>, Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, swboyd@chromium.org
Cc: Yossim@codeaurora.org
List-ID: <devicetree@vger.kernel.org>

On 2018-03-07 12:30, Peter Rosin wrote:
> [finally remembered to switch email for Stephen Boyd]
> 
> On 2018-03-07 10:22, Yossi Mansharoff wrote:
>>> On 2018-03-06 16:16, Yossi Mansharoff wrote:
>>>>> On Wed, Feb 21, 2018 at 09:44:59AM +0200, Yossi Mansharoff wrote:
>>>>>> On the db410c 96boards platform we have a TC7USB40MU on the board 
>>>>>> to
>>>>>> mux the D+/D- lines coming from the controller between a micro usb
>>>>>> "device" port and a USB hub for "host" roles[1]. During a role
>>>>>> switch, we need to toggle this mux to forward the D+/D- lines to
>>>>>> either the port or the hub. Add the necessary code to do the role
>>>>>> switch in chipidea core via the generic mux framework.
>>>>>> Board configurations like on db410c are expected to change roles 
>>>>>> via
>>>>>> the sysfs API described in
>>>>>> Documentation/ABI/testing/sysfs-platform-chipidea-usb2.
>>>>>> 
>>>>>> [1]
>>>>>> https://github.com/96boards/documentation/raw/master/ConsumerEdition
>>>>>> /DragonBoard-410c/HardwareDocs/Schematics_DragonBoard.pdf
>>>>>> 
>>>>>> Cc: Peter Rosin <peda@axentia.se>
>>>>>> Cc: Peter Chen <peter.chen@nxp.com>
>>>>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>> Cc: <devicetree@vger.kernel.org>
>>>>>> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
>>>>>> 
>>>>>> Signed-off-by: Yossi Mansharoff <yossim@codeaurora.org>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt |  6 
>>>>>> ++++++
>>>>> 
>>>>> Please make bindings a separate patch.
>>>> sure
>>>>> 
>>>>>>  drivers/usb/chipidea/Kconfig                           |  2 ++
>>>>>>  drivers/usb/chipidea/core.c                            |  6 
>>>>>> ++++++
>>>>>>  drivers/usb/chipidea/host.c                            |  7 
>>>>>> +++++++
>>>>>>  drivers/usb/chipidea/udc.c                             | 13 
>>>>>> ++++++++++++-
>>>>>>  include/linux/usb/chipidea.h                           |  2 ++
>>>>>>  6 files changed, 35 insertions(+), 1 deletion(-)
>>>>>> 
>>>>>> diff --git 
>>>>>> a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>>>>>> b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>>>>>> index 0e03344..2e93181 100644
>>>>>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>>>>>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>>>>>> @@ -76,6 +76,10 @@ Optional properties:
>>>>>>    needs to make sure it does not send more than 90%
>>>>>>    maximum_periodic_data_per_frame. The use case is multiple 
>>>>>> transactions, but
>>>>>>    less frame rate.
>>>>>> +- mux-controls: The mux control for toggling host/device output 
>>>>>> of
>>>>>> +this
>>>>>> +  controller. It's expected that a mux state of 0 indicates 
>>>>>> device
>>>>>> +mode and a
>>>>>> +  mux state of 1 indicates host mode.
>>>>>> +- mux-control-names: Shall be "usb_switch" if mux-controls is 
>>>>>> specified.
>>>>> 
>>>>> -names is pointless when there is only 1.
>>>> the names  is used to find the attached mux in the dt .
>>>> it is used in the following lines in mux/core.c if (mux_name) {
>>>> 		index = of_property_match_string(np, "mux-control-names",
>>>> 						 mux_name);
>>>> so I think iwe need to keep it, agreed?
>>> 
>>> If mux_name is NULL, index defaults to 0, i.e. the first (and 
>>> presumably
>>> only) mux control is grabbed from the mux-controls list.
>>> 
>>> So, you should be able to call mux_control_get_optional with a NULL 
>>> mux_name argument for this to work. But please try it...
>>> 
>>> Cheers,
>>> Peter
>> 
>> that's correct, my thought is that it would be safer to explicitly 
>> call the mux_control_get_optional function with a mux name, just for 
>> the case of multiple muxes.
>> Thanks.
>> For example another mux to switch off vBUS.
>> Yossi
> 
> Right. Rob, how do you propose to handle the future where a second
> mux with a different function is needed? Specifically, everything
> I come up with introduces some ugly compatibility crap in the future
> code to handle old devicetrees w/o the mux-control-names property.
> So, how to avoid that?
> 
> I'm inclined to just requiring a mux-control-names up front to keep
> the future simple.
> 
> Cheers,
> Peter
> 

is it ok to keep the "mux-control-names"?
I want to make a new patch set for this, currently, I'm splitting this 
patch into two (one for bindings and one for chipidea).

Thanks,
Yossi

>> 
>>> 
>>>>> 
>>>>>> 
>>>>>>  i.mx specific properties
>>>>>>  - fsl,usbmisc: phandler of non-core register device, with one @@
>>>>>> -102,4 +106,6 @@ Example:
>>>>>>  		rx-burst-size-dword = <0x10>;
>>>>>>  		extcon = <0>, <&usb_id>;
>>>>>>  		phy-clkgate-delay-us = <400>;
>>>>>> +		mux-controls = <&usb_switch>;
>>>>>> +		mux-control-names = "usb_switch";
>>>>>>  	};
>>>> _______________________________________________
>>>> Dragonboard-aosp mailing list
>>>> Dragonboard-aosp@lists.96boards.org
>>>> https://lists.96boards.org/mailman/listinfo/dragonboard-aosp
>>>> 
>>> 
>>> 
