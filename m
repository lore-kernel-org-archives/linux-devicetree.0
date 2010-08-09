From: Li Yang-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Review Request: New proposal for device tree clock binding.
Date: Mon, 9 Aug 2010 15:05:49 +0800
Message-ID: <F9BD3E0A8083BE4ABAA94D7EDD7E3F6310925F@zch01exm26.fsl.freescale.net>
References: <AANLkTimm7G--LQHYBqPB1YCXQb7fSXPDaYsLq0p30DG1@mail.gmail.com>
	<F9BD3E0A8083BE4ABAA94D7EDD7E3F63109216@zch01exm26.fsl.freescale.net>
	<AANLkTi=3MQBSd_phbSZnRA-wFB7cfa4U_PKND+BgZVhd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTi=3MQBSd_phbSZnRA-wFB7cfa4U_PKND+BgZVhd-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>>><tt>*-clock</tt> is named for the signal name for the ''clock input''
>>>of the device. it should describe the function of the signal for that
>>>device, rather than the name of the system-wide clock line. For
>>>example, a UART with two clocks - one for baud-rate clocking, and the
>>>other for register clocking - may have clock input properties named
>>>"baud-clock" and "register-clock". =A0The property value is a tuple
>>>containing the phandle to the clock provider and the name of the clock
>output signal.
>>>
>>>For example:
>>>
>>> =A0 =A0uart {
>>> =A0 =A0 =A0 =A0baud-clock =3D <&osc>, "ckil";
>>> =A0 =A0 =A0 =A0register-clock =3D <&ref>, "bus";
>>> =A0 =A0};
>>>
>>>
>>>This represents a device with two clock inputs, named "baud" and
>>>"register". The baud clock is connected to the "ckil" output of the
>"osc"
>>>device, and the register clock is connected to the "bus" output of the
>>>"ref" device.
>>
>>
>> Instead of having two items to identify a clock, I would suggest to have
>a node for each clock. =A0So that clock can be referenced by one
>handle. =A0Also we can have clock specific information defined in the clock
>node. =A0Here is the example I am planning to use on 85xx PMC.
>>
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0power@e0070{
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "fsl,mpc85=
48-pmc",
>> "fsl,p2020-pmc";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0xe0070 0x20>;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0etsec1_clk: soc-clk@24{
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fsl,pmcdr=
-mask =3D <0x00000080>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0etsec2_clk: soc-clk@25{
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fsl,pmcdr=
-mask =3D <0x00000040>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0etsec3_clk: soc-clk@26{
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fsl,pmcdr=
-mask =3D <0x00000020>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enet0: ethernet@24000 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0......
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0master-clock =3D <&etsec1=
_clk>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0......
>>
>>
>> What do you think?

Quoting your reply:

> I've avoided requiring clock nodes to have a separate sub node for
> each output because it is more verbose and it prevents clock providers
> from having child nodes for other purposes.  Are you concerned that

I don't see why there should be child nodes for other purposes under clock =
node.

> having the <phandle>+output name pair will be difficult to manage?

That's part of my concern.  But my main concern is the inability of describ=
ing the properties of each clock in the device tree.  The clock stuff is mu=
ch SoC related, which means it could be variable among chips even in a same=
 family.  Having clock properties defined in device tree will make it easie=
r to have an abstracted driver to handle clock operations.  That's why devi=
ce trees are used in the first place, right?

- Leo
