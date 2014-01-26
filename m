From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2] of: make of_get_phy_mode parse 'phy-connection-type'
Date: Sat, 25 Jan 2014 19:04:49 -0800
Message-ID: <52E47B51.3030308@gmail.com>
References: <20131114074711.9A8C5C402E1@trevor.secretlab.ca> < 1384496612-28392-1-git-send-email-f.fainelli@gmail.com> <20131116122451.3F0B9C4038F@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131116122451.3F0B9C4038F@trevor.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: rob.herring@calxeda.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 16/11/2013 04:24, Grant Likely a =E9crit :
> On Fri, 15 Nov 2013 06:23:32 +0000, Florian Fainelli <f.fainelli@gmai=
l.com> wrote:
>> Per the ePAPR v1.1 specification, 'phy-connection-type' is the canon=
ical
>> property name for describing an Ethernet to PHY connection type. Mak=
e
>> sure that of_get_phy_mode() also attempts to parse that property and
>> update the comments mentioning 'phy-mode' to also include
>> 'phy-connection-type'.
>>
>> Acked-by: Grant Likely <grant.likely@linaro.org>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>
> Applied, thanks

Grant, where is that patch, and will it be part of a pull request to 3.=
14?

Thanks!

>
> g.
>
>> ---
>> Changes since v2:
>> - reworked the error condition to look nicer per Grant's suggestion
>> - added Grant's Acked-by tag
>> - fixed a typo in the commit message on "mentioning"
>>
>>   drivers/of/of_net.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
>> index 8f9be2e..651e249 100644
>> --- a/drivers/of/of_net.c
>> +++ b/drivers/of/of_net.c
>> @@ -13,8 +13,8 @@
>>
>>   /**
>>    * It maps 'enum phy_interface_t' found in include/linux/phy.h
>> - * into the device tree binding of 'phy-mode', so that Ethernet
>> - * device driver can get phy interface from device tree.
>> + * into the device tree binding of 'phy-mode' or 'phy-connection-ty=
pe',
>> + * so that Ethernet device driver can get phy interface from device=
 tree.
>>    */
>>   static const char *phy_modes[] =3D {
>>   	[PHY_INTERFACE_MODE_NA]		=3D "",
>> @@ -36,8 +36,9 @@ static const char *phy_modes[] =3D {
>>    * of_get_phy_mode - Get phy mode for given device_node
>>    * @np:	Pointer to the given device_node
>>    *
>> - * The function gets phy interface string from property 'phy-mode',
>> - * and return its index in phy_modes table, or errno in error case.
>> + * The function gets phy interface string from property 'phy-mode' =
or
>> + * 'phy-connection-type', and return its index in phy_modes table, =
or errno in
>> + * error case.
>>    */
>>   int of_get_phy_mode(struct device_node *np)
>>   {
>> @@ -46,6 +47,8 @@ int of_get_phy_mode(struct device_node *np)
>>
>>   	err =3D of_property_read_string(np, "phy-mode", &pm);
>>   	if (err < 0)
>> +		err =3D of_property_read_string(np, "phy-connection-type", &pm);
>> +	if (err < 0)
>>   		return err;
>>
>>   	for (i =3D 0; i < ARRAY_SIZE(phy_modes); i++)
>> --
>> 1.8.3.2
>>
>
