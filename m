From: Yang Zhang <yang.zhang@96boards.org>
Subject: Re: [PATCH 3/5] dt-bindings: arm: Document Socionext MB86S71 and Fujitsu F-Cue
Date: Mon, 6 Nov 2017 08:05:03 +0000
Message-ID: <F42D0D73-7F2E-4AD3-A4EF-6C48EF08D40D@96boards.org>
References: <20170625170020.11791-1-afaerber@suse.de> <20170625170020.11791-4-afaerber@suse.de> <20170628164605.2gnvrv4g7jluzyrm@rob-hp-laptop> <CAK7LNATqjOMUajUCYVq=L6wWVTUEc1M7Po+KQ3M3Z=A7+FHX5w@mail.gmail.com> <51221840-b08e-45f1-5601-937fb15f3947@suse.de> <CAK7LNASYvdWq5rV6q5Xf4Zqjso3H+XQY9Z6byJgcgfN7wT6fog@mail.gmail.com> <a39e3d09-4182-ee54-c855-3817498b306a@suse.de> <CAKv+Gu8fkOhQCx-BsyTkottkk63dohzSqa8RhAgTDcMVcmFbxQ@mail.gmail.com> <3327258c-b222-248b-9550-7620a57328f5@suse.de> <CAKv+Gu98dns-VoWF6xc0h_2R7SjcA3+85KVhLyLDgOBenhXJRQ@mail.gmail.com> <4d589d7a-2035-085e-17c4-1b88785b59f9@suse.de> <CAKv+Gu-m-KYnsgyFBUuez3gRhwPF=_sD4fGpE6BDugzW9NUnsA@mail.gmail.com> <c3c5b129-cd30-335d-80fd-05e9e4756121@suse.de>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c3c5b129-cd30-335d-80fd-05e9e4756121@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Grant Likely <Grant.Likely@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Satoru OKAMOTO <okamoto.satoru@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, manivannan.sadhasivam@linaro.org, daniel.thompson@linaro.org
List-Id: devicetree@vger.kernel.org



> On 6 Nov 2017, at 06:58, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>=20
>> Am 05.11.2017 um 04:39 schrieb Ard Biesheuvel:
>>> On 4 November 2017 at 20:06, Andreas F=C3=A4rber <afaerber@suse.de> wrot=
e:
>>>> Am 04.11.2017 um 23:39 schrieb Ard Biesheuvel:
>>>>> On 4 November 2017 at 15:30, Andreas F=C3=A4rber <afaerber@suse.de> wr=
ote:
>>>>>> Am 04.11.2017 um 22:57 schrieb Ard Biesheuvel:
>>>>>>> On 4 November 2017 at 13:44, Andreas F=C3=A4rber <afaerber@suse.de> w=
rote:
>>>>>>> Hi everyone,
>>>>>>>=20
>>>>>>> The non-building clk driver has been removed for 4.14, but this patc=
hset
>>>>>>> seems stuck on matters of naming and maintenance...
>>>>>>>=20
>>>>>>>> Am 30.06.2017 um 01:18 schrieb Masahiro Yamada:
>>>>>>>> Hi Andreas,
>>>>>>>>=20
>>>>>>>> 2017-06-29 21:53 GMT+09:00 Andreas F=C3=A4rber <afaerber@suse.de>:
>>>>>>>>> Hi Masahiro-san,
>>>>>>>>>=20
>>>>>>>>>> Am 29.06.2017 um 14:18 schrieb Masahiro Yamada:
>>>>>>>>>> 2017-06-29 1:46 GMT+09:00 Rob Herring <robh@kernel.org>:
>>>>>>>>>>>> On Sun, Jun 25, 2017 at 07:00:18PM +0200, Andreas F=C3=A4rber w=
rote:
>>>>>>>>>>>> For consistency with existing SoC bindings, use "fujitsu,mb86s7=
1" but
>>>>>>>>>>>> socionext.txt.
>>>>>>>>>>>>=20
>>>>>>>>>>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>>>>>>>>>>> ---
>>>>>>>>>>>> Documentation/devicetree/bindings/arm/socionext.txt | 17 ++++++=
+++++++++++
>>>>>>>>>>>> 1 file changed, 17 insertions(+)
>>>>>>>>>>>> create mode 100644 Documentation/devicetree/bindings/arm/socion=
ext.txt
>>>>>>>>>>>=20
>>>>>>>>>>> Acked-by: Rob Herring <robh@kernel.org>
>>>>>>>>>>> --
>>>>>>>>>>=20
>>>>>>>>>> I do not mind this, but
>>>>>>>>>> please note there are multiple product lines in Socionext
>>>>>>>>>> because Socionext merged LSI divisions from Panasonic and Fujitsu=
.
>>>>>>>>>>=20
>>>>>>>>>> I maintain documents for Socionext UniPhier SoC family
>>>>>>>>>> (which inherits SoC architecture of Panasonic)
>>>>>>>>>> in Documentation/devicetree/bindings/arm/uniphier/.
>>>>>>>>>=20
>>>>>>>>> Actually you seemed to be lacking bindings beyond the cache contro=
ller
>>>>>>>>> for Uniphier:
>>>>>>>>>=20
>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t/tree/Documentation/devicetree/bindings/arm/uniphier
>>>>>>>>>=20
>>>>>>>>> The SoC compatible, e.g. "socionext,uniphier-ld11", needs to be de=
fined
>>>>>>>>> somewhere too, as done here. A git-grep for that particular compat=
ible
>>>>>>>>> only finds derived clk and reset bindings.
>>>>>>>>=20
>>>>>>>> I can care to send a patch later, but it is off-topic here.
>>>>>>>=20
>>>>>>> [The relevance was that had there been any bindings precedence from
>>>>>>> UniPhier, it would've influenced my naming choices.]
>>>>>>>=20
>>>>>>>>> Using socionext.txt allows you to add those bindings to a shared f=
ile;
>>>>>>>>> if you prefer to host them separately below uniphier/ or as uniphi=
er.txt
>>>>>>>>=20
>>>>>>>> I was thinking of this way.
>>>>>>>>=20
>>>>>>>> For example, TI has omap/, keystone/, davinci.txt, etc.
>>>>>>>> in this directory level.
>>>>>>>>=20
>>>>>>>>> do you have a better name suggestion for this one? I was trying to=
 keep
>>>>>>>>> our options open to later add SC2A11 in socionext.txt, and I also s=
aw
>>>>>>>>> some mb8ac300 or so (MB86S7x predecessor?) in downstream sources, s=
o I
>>>>>>>>> don't know a good common name for the non-Panasonic parts. And if w=
e
>>>>>>>>> take fujitsu.txt for MB86S7x to match the vendor prefix then we wi=
ll
>>>>>>>>> need a separate file for the new SC2A11 IIUC.
>>>>>>>>=20
>>>>>>>> I have no idea.
>>>>>>>> Actually, I am not familiar with those SoCs.
>>>>>>>>=20
>>>>>>>> I am not sure if there exists a common name for those Fujitsu-deriv=
ed SoCs.
>>>>>>>> I think a SoC family name will be helpful to avoid proliferating
>>>>>>>> arch/arm/mach-{mb86s7x,mb8ac300, ...}.
>>>>>>>>=20
>>>>>>>> I see some Socionext guys CC'ed in this mail,
>>>>>>>> somebody might have information about this.
>>>>>>>>=20
>>>>>>>> As I said before, I do not mind adding socionext.txt
>>>>>>>> and it seems reasonable enough
>>>>>>>> if there is no common name for those SoCs.
>>>>>>>>=20
>>>>>>>>> Also if you can tell us where the cut between Fujitsu and Socionex=
t
>>>>>>>>> should be done, we can certainly adapt. NXP is still adding all th=
eir
>>>>>>>>> new SoCs in fsl.txt, it seems.
>>>>>>>>> (A similar naming issue exists for my not-yet-submitted FM4 patche=
s,
>>>>>>>>> where it changed owners from Fujitsu to Spansion and then to Cypre=
ss.)
>>>>>>>>=20
>>>>>>>> Right, vendor names are not future-proof in some cases.
>>>>>>>>=20
>>>>>>>> We use "uniphier" because it is convenient to
>>>>>>>> make a group of SoCs with similar architecture,
>>>>>>>> and it will work even if UniPhier product lines are sold again in t=
he
>>>>>>>> future.  :-)
>>>>>>>=20
>>>>>>> Summarizing: Masahiro-san only wants to maintain the UniPhier family=
 of
>>>>>>> Socionext SoCs, not this MB86S71. No one from Socionext or Linaro ha=
s
>>>>>>> volunteered as maintainer for these F-Cue MB86S71 patches - that see=
ms
>>>>>>> to indicate I'll again have to set up a new repository and start
>>>>>>> maintaining it myself.
>>>>>>>=20
>>>>>>> Naming it linux-socionext.git wouldn't quite be right due to UniPhie=
r
>>>>>>> also being Socionext.
>>>>>>>=20
>>>>>>> It's also unclear whether and by whom there may be SC2A11 patches - I=

>>>>>>> hear for now Linaro are maintaining a SynQuacer DT in EDK2, rebellin=
g
>>>>>>> against linux.git.
>>>>>>=20
>>>>>> Eh, wait, what? "Rebelling against linux.git"? What is that supposed
>>>>>> to mean exactly?
>>>>>=20
>>>>> Bindings must be submitted to the devicetree mailing list, acked by Ro=
b
>>>>> and merged into the Linux tree before compatible strings may be used i=
n
>>>>> Linux drivers or in-tree .dts[i] files. checkpatch.pl checks for that.=

>>>>=20
>>>> OK, so where did we deviate from this in your opinion?
>>>=20
>>> I was very clear which new Socionext 96board platform my remark was
>>> about. There not being a socionext.txt file before this patch here hints=

>>> at there being no official SoC binding defined for any.
>>>=20
>>> Adding one would require coordinating how to go about these platforms,
>>> as unsuccessfully attempted here.
>>>=20
>>> I was also referring to off-list remarks wrt EDK2 DT vs. Linux, which
>>> could've well come from you, given your rant.
>>=20
>> I honestly have no idea what you are talking about here. You see
>> rebellion and argument where there is none.
>>=20
>>> Note that both the
>>> bindings maintainer and one arm-soc maintainer are from Linaro afaik, so=

>>> you're essentially fighting against your colleagues here...
>>>=20
>>=20
>> I am not fighting anyone, but you seem to think we are rebelling.
>>=20
>> The reality is that the platform topology is not finalized yet, and
>> submitting and merging what are essentially draft version of DT
>> descriptions and then having to update them is something we are trying
>> very hard to avoid. There is enough churn in upstream DTs as it is.
>>=20
>>> Last but not least pretty much every shipping 96Board to date had a
>>> pre-installed DT that did not have official bindings submitted (I don't
>>> count the Cello as shipping) and thus later changed incompatibly.
>>>=20
>>=20
>> We are working very hard to make sure the upstream bindings and
>> drivers in the kernel are in shape to support the SoC we are
>> developing firmware support for. When the time comes, we may or may
>> not decide to propose the SoC DT for inclusion in the kernel. But
>> those are two different things.
>>=20
>> This has nothing to do with 'rebelling against linux.git' (your words)
>>=20
>>>>> U-Boot only allows import of new .dts files from Linux, too.
>>>>>=20
>>>>> So Linus' linux.git is the location to merge any vendor prefixes and
>>>>> device tree bindings,
>>>>=20
>>>> Agreed.
>>>>=20
>>>>> as well as the central location for device trees.
>>>>=20
>>>> Why should there be a central location for device trees?
>>>=20
>>> Because with a .dtsi for SoC and SoM we can share DT code across boards
>>> and bootloaders. And at least one .dts is needed for compile-testing it.=

>>> =46rom a central location files can be either individually copied or
>>> potentially aggregated as submodules.
>>>=20
>>> DT patch reviews have resulted in GIC nodes growing virtualization
>>> support for instance, and there have been in-tree refactorings fixing
>>> the arch timer's interrupt type iirc. Comparing modeling across vendors
>>> is also useful to not live in silos.
>>>=20
>>> Also considering that drivers are spread over subsystem rather than SoC
>>> directories these days, the central location being Linux facilitates
>>> checking which platforms have been enabled already and to which degree.
>>>=20
>>=20
>> I understand all that. But being able to review SoC DTs is one thing,
>> and deciding that the kernel repository shall be the authoritative
>> source is another.
>>=20
>> In my view, this argues for having a shared repository, mailing list
>> etc between the Linux, u-boot, freebsd and EDK2 communities, because
>> it would increase review coverage, and make it easier to push back
>> against frivolous DT changes.
>>=20
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/devicetree/bindings
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/arch/arm/boot/dts
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/arch/arm64/boot/dts
>>>>>=20
>>>>> If you're unfamiliar with that, talk to your Linaro colleagues please!=

>>>>=20
>>>> Please don't lecture me on this.
>>>=20
>>> If you ask questions, you may get answers. Blame yourself if you
>>> intended them as rhetorical questions.
>>>=20
>>>> The bindings are the contract between the OS and the platform, and I
>>>> agree that those need to be reviewed and maintained in a central
>>>> location, and the kernel tree, while not optimal, is a suitable place
>>>> for that.
>>>>=20
>>>> However, the existence of such contracts means that there is no need
>>>> to have a central location for device trees, nor should there be a
>>>> need for distros to ever ship device trees with the kernel. That
>>>> practice defeats the entire purpose of having contracts in the first
>>>> place, especially with the pathetic churn we are seeing in device
>>>> trees that are kept in the kernel.
>>>=20
>>> Please don't argue with me about these fundamentals. Not my decisions!
>>>=20
>>> This is not about distros shipping things; there is no openSUSE on these=

>>> platforms precisely because code is not in central repositories.
>>>=20
>>=20
>> By 'these platforms' you mean 96boards? Fair point. But please don't
>> extrapolate from Hikey (and FYI, Cello has been running mainline Linux
>> and EDK2 from the beginning)
>>=20
>>> It's rather about three platforms by one vendor all going into different=

>>> directions: SC2A11 into some seemingly non-mainline EDK2, MB86S71 as
>>> vendor kernel / U-Boot tarballs (and my kernel patches here), and
>>> UniPhier as only one in mainline kernel and mainline U-Boot.
>>>=20
>>> Have you ever tried to boot e.g. a HiKey with a DT not from the mainline=

>>> kernel you are trying to boot? Good luck... Even server vendors
>>> occasionally change their device trees with firmware updates.
>>>=20
>>=20
>> You say that like it's a bad thing. Do you honestly think it is better
>> for the OS to pick its own DT from some tarball that shipped with it?
>>=20
>> If the kernel driver developers wouldn't keep making backward
>> incompatible changes to the bindings, they could actually stabilize to
>> the point where it makes even more sense for the platform vendor to
>> fix bugs in their DT descriptions.
>>=20
>>> Fact is, as platforms get enabled, device trees grow additional nodes
>>> and properties. DTs don't fall from skies in some final form for new SoC=
s.
>>>=20
>>> Especially not if they keep getting written by volunteers like me - I'm
>>> already enabling the fourth 96board because Linaro and its partners keep=

>>> throwing ~3.10 kernels at users again and again and again, which as I've=

>>> pointed out at BUD17 is highly annoying! Even more annoying every single=

>>> time Linaro marketing asks people to join as paying members because
>>> Linaro supposedly does so awesome Open Source work and such great
>>> 96Boards. Just this Friday again.
>>=20
>> Who's ranting now?
>>=20
>> Again, please don't extrapolate. For the SynQuacer based platform we
>> are involved with, there will be no vendor trees whatsoever. And I
>> share your frustration, especially when it comes to HiKey, because
>> they claim to implement UEFI (but building your own bootloader from
>> some random collection of EDK2 source files !=3D UEFI), and keep trying
>> to upstream it.
>=20
> Thanks for that.
>=20
>>> Nobody needs Reference Platform kernels if everything just timely gets
>>> merged into linux-next and mainline, where code belongs.
>>=20
>> Agreed.
>>=20
>>> Same for device trees, until the powers that be decide on a different
>>> location - which would not change the problem at all: Every review will
>>> be regarded as churn by someone else, and some people will always be
>>> lazy in submitting patches to whatever widely agreed-upon location, be
>>> it kernel drivers or DTs or U-Boot or EDK2 or ATF or something else.
>>>=20
>>> We wouldn't be having this argument if everything were great with the
>>> various non-central 96boards trees and downstream DTs.
>>>=20
>>=20
>> Everything we need in the kernel and EDK2 will be upstream before the
>> product ships, and we are trying to do the same for ARM Trusted
>> Firmware, but this is a bit problematic due to the sorry state the
>> code is in.
>>=20
>> Again, I am not the one who is ranting here. You hit a nerve by
>> accusing me of 'rebelling against linux.git' while this is quite the
>> opposite of what I am doing.
>=20
> Actually you did confirm that point by starting an argument about not
> needing a central repository and you not liking Linux as the location.
> That was exactly what I meant with my original comment.
>=20
> Adding Actions Semi was somewhat easy as a new vendor and now - roughly
> a year after the board went to market - there's Linaro contributions
> from Mani that I'm thankful for.

Thanks for your comments Andreas. Cc Mani as due to his joining, we continue=
 to improve our upstream efforts.=20
>=20
> Whereas patches keep falling into a dark hole when there's already other
> work for a certain vendor, such as Marvell and now Socionext, with no
> one feeling responsible for either taking them or saying, "hey, we're
> not going to submit any conflicting DT bindings for SynQuacer because we
> use ACPI, so please go ahead with proposal X, thanks for your efforts".
>=20
> Don't complain about me ranting if you belittle my volunteer work that I
> believe Linaro and its partners should've done in the first place

No one is belittling the work you have put in place. We certainly appreciate=
 all you have helped to put together so far and we do not claim 96Boards is a=
 perfect child as far as cross SoC upstreaming efforts is concerned. We are q=
uite constrained when there=E2=80=99s little or none at all or initial resou=
rce from SoC vendors pulling away from a platform. But we are still trying v=
ery hard. And we are exploring different ways of doing this too.

> : If I
> can get an initial mainline PoC done as an individual on a few
> evenings/weekends, then the same should be super-easy for an
> organization with lots of engineers and paying member companies.

No it=E2=80=99s not. 96Boards (in Linaro) has bare minimum amount budget and=
 is relying heavily on volunteering efforts from people such as Ard and your=
self.

> As I've pointed out, an ever-increasing frustration builds over Linaro
> continuing to announce new boards (such as SynQuacer) that will be the
> best since sliced bread, while neglecting the 96boards that are already
> on the market and equally are promoted under the "96Boards" brand.
> The Linaro CEO has been promoting the Orange Pi i96 in keynotes, so
> management is aware of that hardware, and yet not a single patch came
> from Xunlong, RDA Micro or Linaro. No patch review from RDA either.

You are correct. We have been struggling to get commitment from parties to s=
ort out the 3.10 based old code line on a SoC, although still very useful bu=
t now EoL. 96Boards simply does not have such resource to carry out each pla=
tform upstreaming work in absence of other vendors commitment.

> And
> my patches got stuck on the bindings not including interrupts property
> for the UART yet, since I still do not have their custom interrupt
> controller working... So the context here is that not just my 4.14+
> pulls got stuck but three other 96Boards patch series, too.
> Regards,
> Andreas

We could certainly have a discussion regarding multiple 96Boards software st=
atus (or lack of it) but I feel we are hijacking the original topic of this t=
hread.
>=20
> --=20
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton
> HRB 21284 (AG N=C3=BCrnberg)
