From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCHv3][ 3/5] video: mx3fb: Add device tree suport.
Date: Sat, 26 Oct 2013 01:43:23 -0500
Message-ID: <93D2899F-E285-4794-8F32-AD55360A4A80@codeaurora.org>
References: <1382532229-32755-1-git-send-email-denis@eukrea.com> <1382532229-32755-3-git-send-email-denis@eukrea.com> <20131025195040.0CCC3C404DA@trevor.secretlab.ca> <20131026001854.GE17135@pengutronix.de>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131026001854.GE17135-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, =?iso-8859-1?Q?Eric_B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Oct 25, 2013, at 7:18 PM, Sascha Hauer wrote:

> On Fri, Oct 25, 2013 at 08:50:40PM +0100, Grant Likely wrote:
>> On Wed, 23 Oct 2013 14:43:47 +0200, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>=
 wrote:
>>> Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
>>> Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
>>> Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>>> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>> Cc: Eric B=E9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
>>> ---
>>> ChangeLog v2->v3:
>>> - The device tree bindings were reworked in order to make it look m=
ore like the
>>>  IPUv3 bindings.
>>> - The interface_pix_fmt property now looks like the IPUv3 one.
>>> ---
>>> .../devicetree/bindings/video/fsl,mx3-fb.txt       |   35 ++++++
>>> drivers/video/Kconfig                              |    2 +
>>> drivers/video/mx3fb.c                              |  125 +++++++++=
++++++++---
>>> 3 files changed, 147 insertions(+), 15 deletions(-)
>>> create mode 100644 Documentation/devicetree/bindings/video/fsl,mx3-=
fb.txt
>>>=20
>>> diff --git a/Documentation/devicetree/bindings/video/fsl,mx3-fb.txt=
 b/Documentation/devicetree/bindings/video/fsl,mx3-fb.txt
>>> new file mode 100644
>>> index 0000000..0b31374
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/video/fsl,mx3-fb.txt
>>> @@ -0,0 +1,35 @@
>>> +Freescale MX3 fb
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Required properties:
>>> +- compatible: Should be "fsl,mx3fb". compatible chips include the =
imx31 and the
>>> +  imx35.
>>> +- reg: should be register base and length as documented in the dat=
asheet.
>>> +- clocks: Handle to the ipu_gate clock.
>>> +
>>> +Example:
>>> +
>>> +lcdc: mx3fb@53fc00b4 {
>>> +	compatible =3D "fsl,mx3-fb";
>>> +	reg =3D <0x53fc00b4 0x0b>;
>>> +	clocks =3D <&clks 55>;
>>> +};
>>=20
>> This (and some of the other bindings) are trivial, and they are all
>> associated with a single SoC. I think it would be better to collect =
all
>> the mx3 bindings into a single file rather than distributing them al=
l
>> over the bindings tree.
>>=20
>> I started thinking about this after some of the DT conversations in
>> Edinburgh this week. Unless there is a high likelyhood of components
>> being used separately, I think it is far more useful to collect all =
the
>> bindings for an SoC into a single file. It will certainly reduce a l=
ot
>> of the boilerplate that we've been collecting in bindings documentat=
ion
>> files.
>>=20
>> A long time ago I took that approach for the mpc5200 documentation[1=
].
>> Take a look at that organization and let me know what you think.
>=20
> I don't think this is a good idea. When a new SoC comes out we don't
> know which components will be reused on the next SoC. This will cause=
 a
> lot of bikeshedding when it actually is reused and then has to be mov=
ed.
>=20
> Also I would find it quite inconsistent if I had to lookup some devic=
es
> in a SoC file and most bindings in subsystem specific files. So when
> searching for a binding I would first have to know if the hardware is
> unique to the SoC or not.

I agree that as new SoC come out its better to have these things split =
out.  Also for IP that is sold by vendors like Synopsys/Designware that=
 get used on a lot of SoCs its makes it easier to ensure consistency by=
 having the binding split out for the IP and not the SoC.

Also, by having bindings for similar devices for different SoCs kept to=
gether it becomes easier for us to see patterns across SoCs as we might=
 come up with a more generic binding in the future.  Far more difficult=
 if things are SoC oriented.

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
