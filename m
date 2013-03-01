From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] <linux/of_platform.h>: fix compilation warnings with
 DT disabled
Date: Fri, 01 Mar 2013 08:02:46 -0600
Message-ID: <5130B506.5020908@gmail.com>
References: <201302190258.25726.sergei.shtylyov@cogentembedded.com> <20130301070925.GA24369@verge.net.au> <5130B12F.20409@gmail.com> <5130B1A7.9060001@gmail.com> <5130B34F.2090700@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <5130B34F.2090700@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, linux-sh@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, vladimir.barinov@cogentembedded.com
List-Id: devicetree@vger.kernel.org

On 03/01/2013 07:55 AM, Sergei Shtylyov wrote:
> Hello.
>=20
> On 01-03-2013 17:48, Rob Herring wrote:
>=20
>>>>> Fix the following compilation warnings (in Simon Horman's
>>>>> renesas.git repo):
>=20
>>>>> In file included from arch/arm/mach-shmobile/setup-r8a7779.c:24:0=
:
>>>>> include/linux/of_platform.h:107:13: warning: =E2=80=98struct of_d=
evice_id=E2=80=99
>>>>> declared
>>>>> inside parameter list [enabled by default]
>>>>> include/linux/of_platform.h:107:13: warning: its scope is only th=
is
>>>>> definition
>>>>> or declaration, which is probably not what you want [enabled by
>>>>> default]
>>>>> include/linux/of_platform.h:107:13: warning: =E2=80=98struct devi=
ce_node=E2=80=99
>>>>> declared
>>>>> inside parameter list [enabled by default]
>=20
>>>>> <linux/of_platform.h> only #include's headers with definitions of
>>>>> the above
>>>>> mentioned structures if CONFIG_OF_DEVICE=3Dy but uses them even i=
f
>>>>> not. One
>>>>> solution is to move some #include's out of #ifdef CONFIG_OF_DEVIC=
E
>>>>> and use
>>>>> incomplete declarations for the rest of the structures where the
>>>>> #ifdef move
>>>>> doesn't help...
>=20
>>>>> Reported-by: Vladimir Barinov <vladimir.barinov@cogentembedded.co=
m>
>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.co=
m>
>=20
>>>> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>=20
>>>> Grant, could you consider taking this patch?
>=20
>>> Yes, I can, but I don't seem to have the original patch. Can you se=
nd it
>>> again.
>=20
>> Nevermind. Found it. I'll apply it.
>=20
>    Will you drop 'struct device_node' declaration then or should I
> resend? In fact, I think I should better resend it with the changelog
> somewhat edited.

No, I plan to leave it as is and not rely on device.h by chance
declaring device_node.

Rob

>=20
>> Rob
>=20
> WBR, Sergei
>=20

