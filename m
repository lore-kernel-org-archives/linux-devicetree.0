From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] [v2] power/fsl: add MDIO dt binding for FMan
Date: Mon, 22 Dec 2014 02:20:54 -0600
Message-ID: <5497D466.9090804@Freescale.com>
References: <1415958800-9867-1-git-send-email-shh.xie@gmail.com>
	 <1416966592.15957.172.camel@freescale.com>
	 <DM2PR0301MB08641FB289DBA17AD59FBEA0E26A0@DM2PR0301MB0864.namprd03.prod.outlook.com>
	 <1418940078.5581.143.camel@freescale.com>
	 <DM2PR0301MB0864AA31CD1A7438F476020FE26B0@DM2PR0301MB0864.namprd03.prod.outlook.com>
 <1419030955.5581.154.camel@freescale.com>
 <DM2PR0301MB086427C10254A0A749CD1326E2560@DM2PR0301MB0864.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR0301MB086427C10254A0A749CD1326E2560-Cwg/PA1lyPnq20u2fDgSrZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xie Shaohui-B21989 <Shaohui.Xie-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Wood Scott-B07421 <scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liberman Igal-B31950 <Igal.Liberman-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Shao-Hui,


On 12/21/2014 08:31 PM, Xie Shaohui-B21989 wrote:
>> On Fri, 2014-12-19 at 01:23 -0600, Xie Shaohui-B21989 wrote:
>>>> -----Original Message-----
>>>> From: Wood Scott-B07421
>>>> Sent: Friday, December 19, 2014 6:01 AM
>>>> To: Xie Shaohui-B21989
>>>> Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Medve
>>>> Emilian- EMMEDVE1; Liberman Igal-B31950
>>>> Subject: Re: [PATCH] [v2] power/fsl: add MDIO dt binding for FMan
>>>>
>>>> On Thu, 2014-12-18 at 06:53 -0600, Xie Shaohui-B21989 wrote:
>>>>> Ping.
>>>>>
>>>>> Best Regards,
>>>>> Shaohui Xie
>>>>
>>>> I can't put patches in my -next until the merge window closes.
>>>>
>>>>>>>> +EXAMPLE
>>>>>>>> +
>>>>>>>> +Example for FMan v2 external MDIO:
>>>>>>>> +
>>>>>>>> +mdio@f1000 {
>>>>>>>> +	compatible = "fsl,fman-xmdio";
>>>>>>>> +	reg = <0xf1000 0x1000>;
>>>>>>>> +	bus-frequency = <20000>;
>>>>>>>> +};
>>>>>>>
>>>>>>> So the bus frequency is only 20 KHz?  Or is the unit supposed
>>>>>>> to be something other than Hz?
>>>>>> [S.H] it's only an example, it could be different on real SoCs,
>>>>>> but they always lower than the standard one, The standard one is
>>>>>> 2.5MHz, I have
>>>> to use Hz for it.
>>>>
>>>> Is there any SoC for which 20 kHz is the right frequency?  I just
>>>> want to make sure the example is realistic.
>>> [S.H] the clock divider has a limitation that the MAX value it can get
>>> on Fman v2 is 255 (0xff, 8 bits), On Fman v3 is 511(0x1ff, 9 bits).
>>>
>>> So the lowest frequency on Fman v2 is: Fman_clock / (2 * 255), On Fman
>>> v3 is: Fman_clock / ((2 * 511) + 1).
>>>
>>> Take default Fman frequency setting from SDK1.7 as example, the lowest
>>> clock used for Fman v2 is 581MHz, The lowest clock for Fman v3 is 600MHz.
>>>
>>> Then the lowest bus frequency can get is:
>>> Fman v2: ~1140KHz
>>> Fman v3: ~587KHz
>>>
>>> 20KHz is not practice, we don't have a suggested value in errata document.
>>> For this example, should I post a new version with a value like 1200KHz?
>>
>> This is different from how you described the problem before.  If the limitation
>> is on the divider, rather than the absolute bus frequency, then specifiy the max
>> divider.  Or better, since according to the above this correlates with fman
>> version, just have the driver know what the max divider is for each fman version.
> [S.H] The problem is not the divider has limitation, the problem is a different bus frequency 
> Is needed which is lower than the standard, but due to the divider limitation, the lowest
> bus frequency also has limitation. i.e. we need to use the divider to get a lower frequency,
> but how much lower the value could be is restricted by the divider limitation.

For the purpose of an example in the binding document, I suggest we just
stick with the IEEE standard frequency. We can continue this
conversation about errata handling when we submit the code relevant to
this binding (and the FMan v3 support)


Cheers,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
