MIME-Version: 1.0
In-Reply-To: <6a6651f9-b5fb-0ec7-1f40-f72b1a630e70@gmail.com>
References: <20170918102349.8935-1-sakari.ailus@linux.intel.com>
	<20170918102349.8935-5-sakari.ailus@linux.intel.com>
	<20170918105655.GA14591@amd>
	<20170918144923.dnhrxkirle3fvdfo@valkosipuli.retiisi.org.uk>
	<20170918205407.GA1849@amd>
	<809f7590-7641-e8bc-c009-4fed05d5827c@gmail.com>
	<20170920205327.qmgz65kn45aavomx@rob-hp-laptop>
	<6a6651f9-b5fb-0ec7-1f40-f72b1a630e70@gmail.com>
Date: Sun, 24 Sep 2017 22:52:46 -0500
Message-ID: <CAL_JsqJMB7jQT6BWRb+0DePcpNjaVLcEKxgZ2FKx_hEY41fx5g@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/6] dt: bindings: as3645a: Improve label
 documentation, DT example
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>, Sakari Ailus <sakari.ailus@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 22, 2017 at 4:07 PM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> On 09/20/2017 10:53 PM, Rob Herring wrote:
>> On Tue, Sep 19, 2017 at 11:01:02PM +0200, Jacek Anaszewski wrote:
>>> Hi Pavel,
>>>
>>> On 09/18/2017 10:54 PM, Pavel Machek wrote:
>>>> On Mon 2017-09-18 17:49:23, Sakari Ailus wrote:
>>>>> Hi Pavel,
>>>>>
>>>>> On Mon, Sep 18, 2017 at 12:56:55PM +0200, Pavel Machek wrote:
>>>>>> Hi!
>>>>>>
>>>>>>> Specify the exact label used if the label property is omitted in DT, as
>>>>>>> well as use label in the example that conforms to LED device naming.
>>>>>>>
>>>>>>> @@ -69,11 +73,11 @@ Example
>>>>>>>                          flash-max-microamp = <320000>;
>>>>>>>                          led-max-microamp = <60000>;
>>>>>>>                          ams,input-max-microamp = <1750000>;
>>>>>>> -                        label = "as3645a:flash";
>>>>>>> +                        label = "as3645a:white:flash";
>>>>>>>                  };
>>>>>>>                  indicator@1 {
>>>>>>>                          reg = <0x1>;
>>>>>>>                          led-max-microamp = <10000>;
>>>>>>> -                        label = "as3645a:indicator";
>>>>>>> +                        label = "as3645a:red:indicator";
>>>>>>>                  };
>>>>>>>          };
>>>>>>
>>>>>> Ok, but userspace still has no chance to determine if this is flash
>>>>>> from main camera or flash for front camera; todays smartphones have
>>>>>> flashes on both cameras.
>>>>>>
>>>>>> So.. Can I suggset as3645a:white:main_camera_flash or main_flash or
>>>>>> ....?
>>>>>
>>>>> If there's just a single one in the device, could you use that?
>>>>>
>>>>> Even if we name this so for N9 (and N900), the application still would only
>>>>> work with the two devices.
>>>>
>>>> Well, I'd plan to name it on other devices, too.
>>>>
>>>>> My suggestion would be to look for a flash LED, and perhaps the maximum
>>>>> current as well. That should generally work better than assumptions on the
>>>>> label.
>>>>
>>>> If you just look for flash LED, you don't know if it is front one or
>>>> back one. Its true that if you have just one flash it is usually on
>>>> the back camera, but you can't know if maybe driver is not available
>>>> for the main flash.
>>>>
>>>> Lets get this right, please "main_camera_flash" is 12 bytes more than
>>>> "flash", and it saves application logic.. more than 12 bytes, I'm sure.
>>>
>>> What you are trying to introduce is yet another level of LED class
>>> device naming standard, one level below devicename:colour:function.
>>> It seems you want also to come up with the set of standarized LED
>>> function names. This would certainly have to be covered for consistency.
>>
>> I really dislike how this naming convention is used for label. label is
>> supposed to be the phyically identifiable name. Having the devicename
>> defeats that. Perhaps color, too. We'd be better off with a color
>> property. It seems we're overloading the naming with too many things.
>> Now we're adding device association.
>
> Regarding devicename - there is indeed inconsistency in the way how LED
> DT bindings use label, as some of them use it for defining full LED
> class device name, and the rest fill only colour and function, leaving
> addition of a devicename to the driver.
>
> The problem is also in current definition of label in LED common
> bindings documentation, which says:
>
> "It has to uniquely identify a device, i.e. no other LED class device
> can be assigned the same label."
>
> In view of your above words this is not true, and we probably should
> remove this sentence (it doesn't have DT maintainer ack btw).

Well if label is not unique, then what is the point? It's really just that using the controller is not really meaningful to a user except maybe a devboard that just hooks up LEDs with no defined function.

I can think of a case where you'd have duplicated labels if you had a back plane with multiple identical cards

>> I do want to see standard names though. On 96boards for example, there
>> are defined LEDs and locations. The function on some are defined (e.g.
>> WiFi/BT) and somewhat undefined on others (user{1-4}). I'd like to see
>> the same label across all boards.
>
> Currently we have following LED functions (obtained with
> grep label Documentation/devicetree/bindings/leds/* | sed
> s'/^.*label/label/g' | awk -F"=" '{print $2}' | sed '/^$/d' | sed
> s'/.*:\(.*\)";/\1/' | sed '/^\s\{1,\}/d' | sort -u)
>
> 0
> 1
> 2
> 2g
> 3
> 4
> 5
> 6
> 7
> adsl
> alarm
> alive
> aux
> broadband
> chrg
> dsl
> flash
> green
> indicator
> inet
> keypad
> phone
> power
> red
> sata
> sata0
> sata1
> tel
> tv
> upgrading
> usb
> usr0
> usr1
> usr35
> wan
> white
> wireless
> wps
> yellow
>
> By extracting numerical pattern names and replacing numbers with N
> we're getting something like this:
>
> N
> Ng
> colour
> adsl
> alarm
> alive
> aux
> broadband
> chrg
> dsl
> flash
> indicator
> inet
> keypad
> phone
> power
> sataN
> tel
> tv
> upgrading
> usb
> usrN
> wan
> wireless
> wps
>
> Is this list something you'd like to see as a base of standard LED
> functions? It seems that this list would have to be continuously
> supplemented with new positions.

Yes, I think this would be good.

>
> --
> Best regards,
> Jacek Anaszewski
