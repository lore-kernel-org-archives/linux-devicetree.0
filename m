From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 0/8] Allwinner H6 Mali GPU support
Date: Tue, 14 May 2019 22:56:50 +0100
Message-ID: <3c2c9094-69d4-bace-d5ee-c02b7f56ac82@arm.com>
References: <20190512174608.10083-1-peron.clem@gmail.com>
 <20190513151405.GW17751@phenom.ffwll.local>
 <de50a9da-669f-ab25-2ef2-5ffb90f8ee03@baylibre.com>
 <CAJiuCccuEw0BK6MwROR+XUDvu8AJTmZ5tu=pYwZbGAuvO31pgg@mail.gmail.com>
 <CAJiuCccWa5UTML68JDQq6q8SyNZzVWwQWTOL=+84Bh4EMHGC3A@mail.gmail.com>
Reply-To: robin.murphy-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZOPTGF6YHRBLXT5TTAKGQENYSDSTQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAJiuCccWa5UTML68JDQq6q8SyNZzVWwQWTOL=+84Bh4EMHGC3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2019-05-14 10:22 pm, Cl=C3=A9ment P=C3=A9ron wrote:
> Hi,
>=20
> On Tue, 14 May 2019 at 17:17, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>>
>> Hi,
>>
>> On Tue, 14 May 2019 at 12:29, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> w=
rote:
>>>
>>> Hi,
>>>
>>> On 13/05/2019 17:14, Daniel Vetter wrote:
>>>> On Sun, May 12, 2019 at 07:46:00PM +0200, peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>>>> From: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>
>>>>> Hi,
>>>>>
>>>>> The Allwinner H6 has a Mali-T720 MP2. The drivers are
>>>>> out-of-tree so this series only introduce the dt-bindings.
>>>>
>>>> We do have an in-tree midgard driver now (since 5.2). Does this stuff =
work
>>>> together with your dt changes here?
>>>
>>> No, but it should be easy to add.
>> I will give it a try and let you know.
> Added the bus_clock and a ramp delay to the gpu_vdd but the driver
> fail at probe.
>=20
> [    3.052919] panfrost 1800000.gpu: clock rate =3D 432000000
> [    3.058278] panfrost 1800000.gpu: bus_clock rate =3D 100000000
> [    3.179772] panfrost 1800000.gpu: mali-t720 id 0x720 major 0x1
> minor 0x1 status 0x0
> [    3.187432] panfrost 1800000.gpu: features: 00000000,10309e40,
> issues: 00000000,21054400
> [    3.195531] panfrost 1800000.gpu: Features: L2:0x07110206
> Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002821 AS:0xf
> JS:0x7
> [    3.207178] panfrost 1800000.gpu: shader_present=3D0x3 l2_present=3D0x=
1
> [    3.238257] panfrost 1800000.gpu: Fatal error during GPU init
> [    3.244165] panfrost: probe of 1800000.gpu failed with error -12
>=20
> The ENOMEM is coming from "panfrost_mmu_init"
> alloc_io_pgtable_ops(ARM_MALI_LPAE, &pfdev->mmu->pgtbl_cfg,
>                                           pfdev);
>=20
> Which is due to a check in the pgtable alloc "cfg->ias !=3D 48"
> arm-lpae io-pgtable: arm_mali_lpae_alloc_pgtable cfg->ias 33 cfg->oas 40
>=20
> DRI stack is totally new for me, could you give me a little clue about
> this issue ?

Heh, this is probably the one bit which doesn't really count as "DRI stack"=
.

That's merely a somewhat-conservative sanity check - I'm pretty sure it=20
*should* be fine to change the test to "cfg->ias > 48" (io-pgtable=20
itself ought to cope). You'll just get to be the first to actually test=20
a non-48-bit configuration here :)

Robin.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/3c2c9094-69d4-bace-d5ee-c02b7f56ac82%40arm.com.
For more options, visit https://groups.google.com/d/optout.
