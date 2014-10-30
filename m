From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 1/5] phy: berlin-sata: Move PHY_BASE into private data
 struct
Date: Thu, 30 Oct 2014 10:57:03 +0530
Message-ID: <5451CC27.7000604@ti.com>
References: <1413882477-27922-1-git-send-email-sebastian.hesselbarth@gmail.com> <1413882477-27922-2-git-send-email-sebastian.hesselbarth@gmail.com> <54462865.6000205@ti.com> <544629F0.3090505@gmail.com> <544AB33F.9030701@gmail.com> <20141024202510.GK11455@saruman> <544E3A1F.2060304@ti.com> <544E8FDB.109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <544E8FDB.109-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org
Cc: =?windows-1252?Q?Antoine_T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tuesday 28 October 2014 12:02 AM, Sebastian Hesselbarth wrote:
> On 10/27/2014 01:27 PM, Kishon Vijay Abraham I wrote:
>> On Saturday 25 October 2014 01:55 AM, Felipe Balbi wrote:
>>> On Fri, Oct 24, 2014 at 10:14:55PM +0200, Sebastian Hesselbarth wro=
te:
>>>> On 21.10.2014 11:40, Sebastian Hesselbarth wrote:
>>>>> On 10/21/2014 11:33 AM, Kishon Vijay Abraham I wrote:
>>>>>> On Tuesday 21 October 2014 02:37 PM, Sebastian Hesselbarth wrote=
:
>>>>>>> Currently, Berlin SATA PHY driver assumes PHY_BASE address bein=
g
>>>>>>> constant. While this PHY_BASE is correct for BG2Q, older BG2 PH=
Y_BASE
>>>>>>> is different. Prepare the driver for BG2 support by moving the =
phy_base
>>>>>>> into private driver data.
>>>>>>>
>>>>>>> Acked-by: Antoine T=E9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>>>>>> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gma=
il.com>
>>>>> ...
>>>>>>> ---
>>>>>>>   drivers/phy/phy-berlin-sata.c | 42
>>>>>>> ++++++++++++++++++++++++++++--------------
>>>>>>>   1 file changed, 28 insertions(+), 14 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/phy/phy-berlin-sata.c
>>>>>>> b/drivers/phy/phy-berlin-sata.c
>>>>>>> index 69ced52d72aa..9682b0f66177 100644
>>>>>>> --- a/drivers/phy/phy-berlin-sata.c
>>>>>>> +++ b/drivers/phy/phy-berlin-sata.c
>>>>>>> @@ -30,7 +30,7 @@
>>>>>>>   #define MBUS_WRITE_REQUEST_SIZE_128    (BIT(2) << 16)
>>>>>>>   #define MBUS_READ_REQUEST_SIZE_128    (BIT(2) << 19)
>>>>>>>
>>>>>>> -#define PHY_BASE        0x200
>>>>>>> +#define BG2Q_PHY_BASE        0x200
>>>>> [...]
>>>>>>> +static u32 bg2q_sata_phy_base =3D BG2Q_PHY_BASE;
>>>>>>> +
>>>>>>> +static const struct of_device_id phy_berlin_sata_of_match[] =3D=
 {
>>>>>>> +    {
>>>>>>> +        .compatible =3D "marvell,berlin2q-sata-phy",
>>>>>>> +        .data =3D &bg2q_sata_phy_base,
>>>>>>
>>>>>> Can't the base directly come from dt?
>>>>>
>>>>> You are suggesting a "marvell,phy-base-address" property, right?
>>>>> I have no strong opinion about it, I accept your call (or DT main=
tainer
>>>>> ones).
>>>>
>>>> I still have the DT patches for BG2Q queued up for v3.19 (I missed=
 the
>>>> arm-soc merge window for v3.18). That means, there has been no rel=
ease
>>>> with the phy binding used and I can rework a little more.
>>>>
>>>> Can you please confirm that you want a DT property for the phy bas=
e address,
>>>> e.g. marvell,phy-base-address =3D <{0x200,0x80}> ?
>>>>
>>>> If so, I'd also rename the compatible from berlin2q-sata-phy to mo=
re
>>>> generic berlin-sata-phy.
>>>
>>> I think what Kishon is asking, is why this 0x200 offset isn't alrea=
dy on
>>> reg. so that instead of, e.g.:
>>>
>>>     reg =3D <0x40000000 0x1000>;
>>>
>>> you would have:
>>>
>>>     reg =3D <0x40000200 0x1000>;
>>
>> I had something similar to what Sebastian suggested in mind. I think=
 phy_base
>> is used for a different reason and can't be directly used in 'reg'.
>=20
> Kishon,
>=20
> thanks for the clarification. While the extra marvell,phy-base-addres=
s
> property basically works and I agree with it, I may have some
> _potential_ draw-backs:
>=20
> The Marvell BSP code (which I have no clue _why_ it does what it does
> or if it is required) has some magic writes to "improve" serial signa=
l
> quality. I left them out as my HDD was detected with and without them=
=2E
>=20
> Now, if we find that they are required, we have to find a way to make
> the PHY driver know about the PHY revision. We'd usually add a
> different compatible and deal with it accordingly.
>=20
> So, not adding the compatible now _may_ just postpone a follow-up pat=
ch
> for the different PHY setup of BG2 and render the new phy_base proper=
ty
> basically useless.
>=20
> If you are just unhappy with the "static u32 bg2q_sata_phy_base"
> assigned to of_device_id.data, I can convert that to Felipe's proposa=
l.

Either way is fine with me.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
