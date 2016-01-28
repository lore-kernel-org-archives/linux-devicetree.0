From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH resend] ARM: dts: sun7i: Add dts file for the lamobo-r1
 board
Date: Thu, 28 Jan 2016 08:49:24 +0100
Message-ID: <56A9C804.9080503@redhat.com>
References: <1453920105-7093-1-git-send-email-hdegoede@redhat.com>
 <1453920105-7093-2-git-send-email-hdegoede@redhat.com>
 <20160127194735.GT4317@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160127194735.GT4317@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 27-01-16 20:47, Maxime Ripard wrote:
> Hi Hans,
>
> On Wed, Jan 27, 2016 at 07:41:45PM +0100, Hans de Goede wrote:
>> From: Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
>>
>> The lamobo-r1 board, sometimes called the BPI-R1 but not labelled as such
>> on the PCB, is meant as a A20 based router board. As such the board comes
>> with a built-in switch chip giving it 5 gigabit ethernet boards, and it
>> has a large empty area on the pcb with mounting holes which will fit a
>> 2.5 inch harddisk. To complete its networking features it has a
>> Realtek RTL8192CU for WiFi 802.11 b/g/n.
>>
>> Signed-off-by: Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> Sorry that I missed it :/
>
> It looks mostly fine, I just have a minor question / comment below.
>
>> +&cpu0 {
>> +	cpu-supply = <&reg_dcdc2>;
>> +	operating-points = <
>> +		/* kHz	  uV */
>> +		960000	1400000
>> +		912000	1400000
>> +		864000	1350000
>> +		720000	1250000
>> +		528000	1150000
>> +		312000	1100000
>> +		144000	1050000
>> +		>;
>> +};
>
> Have you used the default OPPs and it turned out to be unstable, or is
> it just some copy / paste from the FEX file?

Just copy paste from the fex file, let me know if you want a new version with
the opp-s removed.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
