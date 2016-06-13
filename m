From: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] usb: phy: mxs: Add DT bindings to configure TX settings
Date: Mon, 13 Jun 2016 16:40:55 -0400
Message-ID: <575F1A57.6030807@timesys.com>
References: <20160318211936.GA4158@rob-hp-laptop> <1458577947-12614-1-git-send-email-jaret.cantu@timesys.com> <20160323043638.GA18462@peterchendt> <56F2D43D.1040404@timesys.com> <56F2DDB7.7070700@timesys.com> <20160324022117.GA5301@peterchendt> <57588DA8.4050000@timesys.com> <CAL411-of2Phqx18LBaGt6FMg5DxaJesRYvrRzsfSNyJRopsUZQ@mail.gmail.com> <CAENNV6+978syhexzQber58xuai=grC2_TsVF3GmHCAp_Zj=HZQ@mail.gmail.com> <20160612032538.GB22054@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160612032538.GB22054@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Justin Waters <justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/11/2016 11:25 PM, Peter Chen wrote:
> On Thu, Jun 09, 2016 at 02:07:52PM -0400, Justin Waters wrote:
>> Peter,
>>
>> On Wed, Jun 8, 2016 at 10:41 PM, Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On Thu, Jun 9, 2016 at 5:27 AM, Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org> wrote:
>>>> On 03/23/2016 10:21 PM, Peter Chen wrote:
>>>>>
>>>>> On Wed, Mar 23, 2016 at 02:17:27PM -0400, Jaret Cantu wrote:
>>>>>>
>>>>>> On 03/23/2016 01:37 PM, Jaret Cantu wrote:
>>>>>>>
>>>>>>> On 03/23/2016 12:36 AM, Peter Chen wrote:
>>>>>>>>
>>>>>>>> On Mon, Mar 21, 2016 at 12:32:27PM -0400, Jaret Cantu wrote:
>>>>>>>>>
>>>>>>>>> The TX settings can be calibrated for particular hardware.  The
>>>>>>>>> phy is reset by Linux, so this cannot be handled by the bootloader.
>>>>>>>>>
>>>>>>>>> The TRM mentions that the maximum resistance should be used for the
>>>>>>>>> DN/DP calibration in order to pass USB certification.
>>>>>>>>>
>>>>>>>>> The values for the TX registers are poorly described in the TRM.
>>>>>>>>> The meanings of the register values were taken from another
>>>>>>>>> Freescale-provided document:
>>>>>>>>> https://community.freescale.com/message/566147#comment-566912
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
>>>>>>>>> ---
>>>>>>>>> v3. Added unit suffix (-ohms) to tx-cal-45-d*
>>>>>>>>>
>>>>>>>>> v2. Copying devicetree list
>>>>>>>>>       Removed prettifying extra whitespace
>>>>>>>>>       Removed unnecessary register rewrite on resume
>>>>>>>>>       Use min and max constants for clarity
>>>>>>>>>
>>>>>>>>>    .../devicetree/bindings/phy/mxs-usb-phy.txt        |   10 ++++
>>>>>>>>>    drivers/usb/phy/phy-mxs-usb.c                      |   58
>>>>>>>>> ++++++++++++++++++++
>>>>>>>>>    2 files changed, 68 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
>>>>>>>>> b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
>>>>>>>>> index 379b84a..1d25b04 100644
>>>>>>>>> --- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
>>>>>>>>> +++ b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
>>>>>>>>> @@ -12,6 +12,16 @@ Required properties:
>>>>>>>>>    - interrupts: Should contain phy interrupt
>>>>>>>>>    - fsl,anatop: phandle for anatop register, it is only for imx6 SoC
>>>>>>>>> series
>>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +    if (!of_property_read_u32(np, "fsl,tx-d-cal", &val) &&
>>>>>>>>> +        val >= MXS_PHY_TX_D_CAL_MIN && val <= MXS_PHY_TX_D_CAL_MAX) {
>>>>>>>>> +        /* scale to 4-bit value */
>>>>>>>>> +        val = (MXS_PHY_TX_D_CAL_MAX - val) * 0xF
>>>>>>>>> +            / (MXS_PHY_TX_D_CAL_MAX - MXS_PHY_TX_D_CAL_MIN);
>>>>>>>>> +        mxs_phy->tx_reg_mask |= GM_USBPHY_TX_D_CAL(~0);
>>>>>>>>> +        mxs_phy->tx_reg_set  |= GM_USBPHY_TX_D_CAL(val);
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>
>>>>>>>>
>>>>>>>> I have tested "tx-d-cal", but it seems incorrect according to the xls
>>>>>>>> you
>>>>>>>> have provided, would you please check it again or am I wrong?
>>>>>>>
>>>>>>>
>>>>>>> Gah! You're right. Some of the D_CAL values need to be rounded up to
>>>>>>> match the xls.  And even then, the value for 86 still doesn't play nice.
>>>>>>>    I was really hoping to avoid using a table for these values.
>>>>>>>
>>>>>>> The TXCALDP/DN values use a much simpler 1-to-1 scale across the 16
>>>>>>> possible register values and so are unaffected by a similar issue.  I
>>>>>>> rechecked their numbers just to be sure.
>>>>>>
>>>>>>
>>>>>> The solution looks to be to scale D_CAL starting from 80 instead of
>>>>>> 79.  If you look at the xls listing, the jump from 79 to 83 is the
>>>>>> only time two adjacent register values result in a change greater
>>>>>> than 2% or 3%.
>>>>>>
>>>>>> This will result in some code ugliness as the minimum allowed
>>>>>> percentage (79), per the Freescale document, and the point at which
>>>>>> we are scaling the percentage values to register values (80) are
>>>>>> different.
>>>>>>
>>>>>> And, as mentioned before, the values will also have to be rounded up.
>>>>>>
>>>>>> This quick shell code confirms that these sorts of calculations
>>>>>> match up with the values in the spreadsheet:
>>>>>>
>>>>>> for d in 119 116 114 112 109 106 103 100 97 95 93 90 88 86 83 79; do
>>>>>> echo "$d="$(( ( (119-$d) * 0xf + (119-80)/2 ) / (119-80) ));
>>>>>> d=$((d+1)); done
>>>>>>
>>>>>>
>>>>>> I can't find any formula which would hit all of those same
>>>>>> percentages without rounding up.
>>>>>>
>>>>>
>>>>> Then, we had to use table for it. Besides, IC team confirms the default
>>>>> value and the step for TXCAL45DP/DN are changed at next generation SoCs,
>>>>> so I am wondering how we describe it at binding doc.
>>>>>
>>>>
>>>> Which next gen SoC would this be?  The MX7?  The documentation for the USB
>>>> PHY in that reference manual is even sparser than the one for the MX6 in
>>>> regards to these register values.
>>>>
>>>
>>> Here, I mean i.mx8
>>>
>>
>> Currently, there is no support in the mainline kernel for the i.MX8.
>> Do you mean to say that this feature is blocked until the i.MX8 is
>> supported in the mainline kernel? Or that we would be required to add
>> the register definitions for the i.MX8 as a prerequisite? Wouldn't it
>> make more sense to add support to the driver as part of the i.MX8
>> enablement, especially considering no documentation is freely
>> available at this time?
>>
>>>> The MX7 manual does still mention that HW_USBPHY_TX_TXCAL45DP and
>>>> HW_USBPHY_TX_TXCAL45DN should both be set to zero, but there is no listing
>>>> as to the location of these registers, let alone their defaults/step values.
>>>>
>>>> Do you know where we could get the default and step values for the TXCAL
>>>> registers on the new SoC?  This information had to come from a Freescale
>>>> community thread for the MX6 since it wasn't defined clearly elsewhere.
>>>
>>> In theory, these information should be listed at SoC reference manual.
>>>
>>
>> I have not seen the reference manual, so I'm not sure if it's in there
>> or not. However, if the i.MX6 manual is any indication, I'm not
>> certain it will be documented anyway.
>>
>> How do we unblock this issue? We currently have hardware that cannot
>> meet specifications without this feature, and based on the app note
>> from NXP, I'm certain plenty of other people do as well.
>>
>
> I agree with you that we don't need to consider i.mx8 case now.
>
> According to your previous information, the single formula can't be used
> to get D_CAL value, do you have any good ways except for using a table?

That is not exactly what I said:

"I can't find any formula which would hit all of those same percentages 
**without rounding up.**"

I did find a formula that hits all of the percentages with rounding up, 
and I listed this formula (in shell form) previously. The rounding (+ 
(119-80)/2) just makes it look a little more awkward than I would like:

$ for d in 119 116 114 112 109 106 103 100 97 95 93 90 88 86 83 79; do 
echo "$d="$(( ( (119-$d) * 0xf + (119-80)/2 ) / (119-80) )); d=$((d+1)); 
done
119=0
116=1
114=2
112=3
109=4
106=5
103=6
100=7
97=8
95=9
93=10
90=11
88=12
86=13
83=14
79=15

These current percentage/register value pairs match the D_CAL table.


 > Sending the patch for new algorithm to speed up this issue please.
 >
There were also some Documentation changes from between when I created 
this patch and the current HOL for which I had to modify the patch.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
