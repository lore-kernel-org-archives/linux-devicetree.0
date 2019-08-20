From: <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 2/3] macb: Update compatibility string for SiFive
 FU540-C000
Date: Tue, 20 Aug 2019 10:16:58 +0000
Message-ID: <0b50622a-1145-3637-082f-c4edaccbbaa1@microchip.com>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
 <1563534631-15897-2-git-send-email-yash.shah@sifive.com>
 <4075b955-a187-6fd7-a2e6-deb82b5d4fb6@microchip.com>
 <CAJ2_jOEHoh+D76VpAoVq3XnpAZEQxdQtaVX5eiKw5X4r+ypKVw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1908131142150.5033@viisi.sifive.com>
 <mvm5zmskxs3.fsf@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mvm5zmskxs3.fsf@suse.de>
Content-Language: en-US
Content-ID: <44B36E30E59D7841828B2F7738A2E610@namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: schwab@suse.de, paul.walmsley@sifive.com, davem@davemloft.net, jakub.kicinski@netronome.com
Cc: yash.shah@sifive.com, robh+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, ynezz@true.cz, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On 20/08/2019 at 11:10, Andreas Schwab wrote:
> External E-Mail
>=20
>=20
> On Aug 13 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
>=20
>> Dave, Nicolas,
>>
>> On Mon, 22 Jul 2019, Yash Shah wrote:
>>
>>> On Fri, Jul 19, 2019 at 5:36 PM <Nicolas.Ferre@microchip.com> wrote:
>>>>
>>>> On 19/07/2019 at 13:10, Yash Shah wrote:
>>>>> Update the compatibility string for SiFive FU540-C000 as per the new
>>>>> string updated in the binding doc.
>>>>> Reference: https://lkml.org/lkml/2019/7/17/200
>>>>
>>>> Maybe referring to lore.kernel.org is better:
>>>> https://lore.kernel.org/netdev/CAJ2_jOFEVZQat0Yprg4hem4jRrqkB72FKSeQj4=
p8P5KA-+rgww@mail.gmail.com/
>>>
>>> Sure. Will keep that in mind for future reference.
>>>
>>>>
>>>>> Signed-off-by: Yash Shah <yash.shah@sifive.com>
>>>>
>>>> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>>>
>>> Thanks.
>>
>> Am assuming you'll pick this up for the -net tree for v5.4-rc1 or earlie=
r.
>> If not, please let us know.
>=20
> This is still missing in v5.4-rc5, which means that networking is broken.

Andreas, Paul,

The patchwork state for the 2 first patches of this series is "Changes=20
Requested". It's probably due to my advice of using lore.kernel.org (or=20
something else).

I'm perfectly fine in accepting the patches are they are today but can't=20
change their patchwork state myself. We would need Dave or Jakub to take=20
them.

Dave, Jakub,

All tags are collected in patchwork and all should be fine on DT (Rob)=20
side as well.
Please tell me if you're waiting some sign from me.

Best regards,
--=20
Nicolas Ferre
