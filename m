From: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Subject: Re: [PATCHv1 2/3] arm: mvebu: add .dts file for Synology DS213j
Date: Tue, 18 Nov 2014 08:41:27 +1000
Message-ID: <546A7997.1040603@killerwolves.net>
References: <cover.1416095841.git.arno@natisbad.org>	<1eb26f8c1946622910a7e2318c895a7082fea7e5.1416095841.git.arno@natisbad.org>	<20141116020024.GC15870@lunn.ch> <87d28nb83u.fsf@natisbad.org>	<546931E1.5070909@killerwolves.net> <878ujas07o.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <878ujas07o.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17/11/14 18:25, Arnaud Ebalard wrote:
> Hi,
> 
> Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org> writes:
> 
>> On 16/11/2014 11:14 PM, Arnaud Ebalard wrote:
>>>>> +	gpio-fan-100-32-35 {
>>>> There is some logic to this naming, but i don't remember what it is.
>>>> Did you check this is appropriate?
>>> The 32-35 is for the MPP i.e. fan uses mpp32 to mpp35 (3 MPP for speed,
>>> one for alarm). I don't know what the 100 part means. What I did is I
>>> googled to see which fan supported kirkwood models have and noticed
>>> that the DS212j uses the exact same fan, i.e. Y.S.Tech FD129225LL-N so
>>> I opted for the same naming.
>>>
>>> On that aspect, you may be able to explain why the speed-map for this
>>> fan goes up to 5000 RPM. This fan is supposed to operate at 1900RPM.
>>> Note that it does not matter in practice.
>>
>> On the Kirkwood Diskstations, the first number (100, 120 or 150) refers
>> to the middle of the three fan speed resistors,
> 
> Would not have found that alone ;-) Thanks for clarifying.
> 
>> the second number (15 or
>> 32) refers to the first fan control pin, and the third number (18 or 35)
>> refers to the first fan alarm pin.
>>
>> i.e. the 100-32-35 uses fan speed resistors of 33, 100 and 150 ohms,
>> uses pins 32-34 for fan control, and uses pin 35 for the fan alarm.
>>
>> The 5000RPM was interpolated from my measured RPM pulse rate (4200PPM)
>> of the 80mm fan in my DS211j (which uses the 150-32-35 fan config) at
>> maximum RPM.
> 
> Then, I think I need to change the speed map to have 1900 RPM as max
> speed. Out of curiosity, how did you measured the RPM pulse rate
> exactly?

I hooked a logic analyzer to the sense pin and measured the pulse rate.

Looking at the specifications of the fan in this unit (an EC7025L12ER),
it has a maximum fan speed of 3000RPM, so it looks like it uses two
pulses per revolution and not one as I had assumed when I created the
speed map.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
