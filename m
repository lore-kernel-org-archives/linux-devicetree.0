From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: mvebu: Add support for NAND controller in Armada
 38x SoC
Date: Thu, 13 Mar 2014 00:39:09 +0300
Message-ID: <5320D3FD.8010704@cogentembedded.com>
References: <1394637404-7651-1-git-send-email-ezequiel.garcia@free-electrons.com> <1394637404-7651-5-git-send-email-ezequiel.garcia@free-electrons.com> <5320CEE7.6020506@cogentembedded.com> <20140312203007.GA7396@arch.cereza>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140312203007.GA7396-nAQHv47ARr+vIlHkl8J1cg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/12/2014 11:30 PM, Ezequiel Garcia wrote:

>>> The Armada 38x SoC family has a NAND controller, compatible
>>> with the controller in Armada 370/375/XP SoCs. Add support for
>>> it in the devicetree file.

>>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>>   arch/arm/boot/dts/armada-38x.dtsi | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)

>>> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/=
armada-38x.dtsi
>>> index 76cc27e..18d8f80 100644
>>> --- a/arch/arm/boot/dts/armada-38x.dtsi
>>> +++ b/arch/arm/boot/dts/armada-38x.dtsi
>>> @@ -345,6 +345,16 @@
>>>   				clocks =3D <&mainpll>;
>>>   				clock-output-names =3D "nand";
>>>   			};
>>> +
>>> +			nand@d0000 {

>>     ePAPR standard [1] tells us:

>> The name of a node should be somewhat generic, reflecting the functi=
on of
>> the device and not its precise programming model. If appropriate, th=
e name
>> should be one of the following choices:

>> [...]
>> =E2=80=A2 flash

> I think 'nand' is generic enough, isn't it?

    It is but not more generic than "flash". :-)

> In any case, it seems sane to distinguish a NAND flash from a NOR fla=
sh,
> from a SPI flash.

    I don't know enough about the SPI flashes but this is only a node n=
ame, no=20
more, so I think we can afford to be really generic...

> FWIW, quite a few other SoCs have chosen 'nand' for the node name, in=
cluding
> the other Armada variants. Was this a wrong choice?

    I guess. There's a lot of wrong choices now all over the=20
arch/arm/boot/dts/ because people are probably not aware of the necessa=
ry=20
documentation such as http://devicetree.org/Device_Tree_Usage (pointing=
 to=20
ePAPR and having a passage on the generic device names too).

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
