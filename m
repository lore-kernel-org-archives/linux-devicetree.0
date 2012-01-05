From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [RFC PATCH v3 2/5] pinctrl: add dt binding support for pinmux mappings
Date: Thu, 5 Jan 2012 21:14:13 +0800
Message-ID: <CAA+hA=Tx0==PLFSN-vqOkRKmKZ-5FvzTNZqRwCLov+FcQxiNNQ@mail.gmail.com>
References: <1324402840-32451-1-git-send-email-b29396@freescale.com>
	<1324402840-32451-3-git-send-email-b29396@freescale.com>
	<74CDBE0F657A3D45AFBB94109FB122FF176BE92F00@HQMAIL01.nvidia.com>
	<7FE21149F4667147B645348EC6057885075542@039-SN2MPN1-013.039d.mgd.msft.net>
	<74CDBE0F657A3D45AFBB94109FB122FF176CC743EF@HQMAIL01.nvidia.com>
	<7FE21149F4667147B645348EC6057885077F82@039-SN2MPN1-013.039d.mgd.msft.net>
	<20111229024647.GA11309@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111229024647.GA11309@S2100-06.ap.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@freescale.com>
Cc: Dong Aisheng-B29396 <B29396@freescale.com>, Stephen Warren <swarren@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 29, 2011 at 10:46 AM, Shawn Guo <shawn.guo@freescale.com> w=
rote:
> On Tue, Dec 27, 2011 at 02:41:25PM +0000, Dong Aisheng-B29396 wrote:
> [...]
>> > You could have nested sub-nodes, say something like:
>> >
>> > iomuxc@020e0000 {
>> > =A0 =A0 compatible =3D "fsl,imx6q-iomuxc";
>> > =A0 =A0 reg =3D <0x020e0000 0x4000>;
>> > =A0 =A0 fsl,pins {
>> > =A0 =A0 =A0 =A0 ... // fsl-specific pin properties
>> > =A0 =A0 };
>> > =A0 =A0 fsl,groups {
>> > =A0 =A0 =A0 =A0 ... // fsl-specific group properties
>> > =A0 =A0 };
>> > =A0 =A0 fsl,functions {
>> > =A0 =A0 =A0 =A0 ... // fsl-specific mux function properties
>> > =A0 =A0 };
>> > =A0 =A0 pinmux-usage {
>> > =A0 =A0 =A0 =A0 // standardized pinmux "table" properties
>> > =A0 =A0 =A0 =A0 sd4 { // pin group name
>> > =A0 =A0 =A0 =A0 =A0 =A0 function =3D "sdio4"; // this function act=
ive on it
>> > =A0 =A0 =A0 =A0 =A0 =A0 ...
>> > =A0 =A0 =A0 =A0 };
>> > =A0 =A0 =A0 =A0 ...
>> > =A0 =A0 }
>> > =A0 =A0 ...
>> > }
>> >
>> Yes, I could do that.
>> The extra effort is that we have to manually exclude one pinmux-usag=
e
>> node in pinmux driver since originally i take the child node count o=
f
>> iomuxc as the function count since all child nodes are functions,
>> that why I firstly took the mapping node out of iomuxc, in addition
>> the old way i used seems to be more brief and clear.
>>
> Stephen suggested you put all the function nodes under node
> 'fsl,functions' (not sure prefix fsl is necessary). =A0In that case,
> of_get_child_count() on 'fsl,functions' still get you the function
> count you want, right?
>
> But we do not bother with it, if we do not have pinmux-usage at all.
> See below ...
>
>> I tried adding pinmux-usage as a sub node of iomuxc and got two issu=
es:
>> Taking imx6q as an example:
>> iomuxc@020e0000 {
>> =A0 =A0 =A0 =A0 uart4 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 func-name =3D "uart4";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 grp-name =3D "uart4grp";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 grp-pins =3D <107 108>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 num-pins =3D <2>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 grp-mux =3D <4 4>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 num-mux =3D <2>;
>> =A0 =A0 =A0 =A0 };
>>
>> =A0 =A0 =A0 =A0 sd4 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 func-name =3D "sd4";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 grp-name =3D "sd4grp";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 grp-pins =3D <170 171 180 181 182 18=
3 184 185 186 187>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 num-pins =3D <10>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 grp-mux =3D <0 0 1 1 1 1 1 1 1 1>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 num-mux =3D <10>;
>> =A0 =A0 =A0 =A0 };
>>
>> =A0 =A0 =A0 =A0 pinmux-mapping {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart4 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 function =3D "uart4"=
;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev =3D <&uart4>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 usdhc4 {
>> /* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ctrl-dev-name =3D =
"20e0000.iomuxc"; */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 function =3D "sd4";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev =3D <&usdhc4>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> =A0 =A0 =A0 =A0 };
>> };
>>
>> If we remove ctrl-dev-name and get it from its parent node in driver=
s as
>> you suggested,
>> first, since this work will be done in the common API (pinmux_of_reg=
ister_mappings
>> Requires pass the pinmux mapping node to it for construct the mappin=
g table)
>> It will introduce a restriction that all platforms should define thi=
s node
>> under their pinctrl device node.
>> Second, it seems we cannot get its parent node device or device name=
 in driver
>> (can only get node Name which is not sufficient for construct the pi=
n map table
>> required by pinctrl core) and current device tree subsystem seems do=
 not support
>> get its associated device from a device node.
>> We may not be able to construct ctrl-dev-name or ctrl-dev for struct=
 pinmux_map.
>> I'm not sure if I missed something, if missed please let me know.
>> To support it, we may need to add support for converting device node
>> to device. Not sure it's applicable since I still have not tried it.
>>
>> The same issue applies to dev using a phandle.
>>
> We do not bother with it, if we do not have pinmux-usage at all.
> See below ...
>
> [...]
>
>> I was ever thought putting a phandle of pinmux function in each devi=
ce,
>> Then pinmux mapping table seems not need anymore. Like:
>>
>> usdhc4: usdhc@0219c000 { /* uSDHC4 */
>> =A0 =A0 =A0 =A0 compatible =3D "fsl,imx6q-usdhc";
>> =A0 =A0 =A0 ....
>> =A0 =A0 =A0 =A0 pinmux =3D <&pinmux-sd4>;
>> };
>>
>> iomuxc@020e0000 {
>> =A0 =A0 =A0 =A0 pinmux-sd4 : sd4 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 func-name =3D "sd4";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 grp-name =3D "sd4grp";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 grp-pins =3D <170 171 180 181 182 18=
3 184 185 186 187>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 num-pins =3D <10>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 grp-mux =3D <0 0 1 1 1 1 1 1 1 1>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 num-mux =3D <10>;
>> =A0 =A0 =A0 =A0 };
>>
>> It is a pure hw point of view to define node.
>
> That's the way we should go for. =A0This is exactly the same thing th=
at
> clk and regulator DT support is doing. =A0And right, in that way, we =
do
> not need pinmux mapping for DT at all.
>
I tried this way and basically it works but has a few limitations due t=
o
via dt.
I will send out patch in this thread for discussion.

>> And it may need to implement a of_pinmux_get.
>
> To make the pinmux api generic for both dt and non-dt users, the pinm=
ux
> client driver should still see/call pinmux_get, something like
> of_pinmux_get should be sorted out behind pinmux_get.
>
>> But what about the pin maps without device associated?
>>
> Do we have such cases?
>
It's hog_on_boot function.

Regards
Dong Aisheng
