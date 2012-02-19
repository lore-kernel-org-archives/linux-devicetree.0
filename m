From: Albert ARIBAUD <albert.u.boot@aribaud.net>
Subject: Re: [PATCH v4 04/20] arm: fdt: Ensure that an embedded fdt
	is word-aligned
Date: Sun, 19 Feb 2012 19:33:27 +0100
Message-ID: <4F414077.7040100@aribaud.net>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-5-git-send-email-sjg@chromium.org>
	<4F3F90A6.3070002@aribaud.net>
	<CAPnjgZ0hqaKEavwwO+5v7w08XPh7nObu0b_MQuE=wLjrOjyKzw@mail.gmail.com>
	<4F40B25D.1090704@aribaud.net>
	<CAPnjgZ2sq7Gx8XQ3OG0a6sAVS_S_F7V3XkyCXMz2GvA=e+y_Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ2sq7Gx8XQ3OG0a6sAVS_S_F7V3XkyCXMz2GvA=e+y_Vg@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <twarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

Hi Simon,

Le 19/02/2012 17:23, Simon Glass a =E9crit :

> Sorry I had that wrong - it's not the link step I am bothered by, it is t=
he
> objcopy step.
>
> What I would like to do is mark the input section, created by objcopy, wi=
th
> a particular alignment so that the linker does the right thing. This
> feature appears to be present in objcopy but does not appear to work.
> Perhaps I should debug that first to see what is going on.

(Formally there are two "objcopy steps" in u-boot building. One happens =

after the link step, where from the u-boot ELF binary objcopy derives =

the u-boot.bin pure binary and u-boot.srec S-Record file. I suspect =

you're referring to the other one, which happens before the link stage =

and which turns the binary FDT data into an ELF-linkable object. Correct?)

Maybe one is allowed to specify alignment requirements when making an =

ELF object file from a pure binary with objcopy; but obviously it does =

not work as you want it to, whereas section alignment in linker scripts =

is a tried and proven method.

>>>> So I must be missing something. Can you clarify the scenario that gets
>>>
>>> fixed here?
>>>
>>> The fdt blob is in one of the object files. If during linking the file
>>> before it has a data segment whose size is not a multiple of 4, then the
>>> fdt object can be misaligned in the output.
>>
>>
>> Understood. This example of an alignment failure scenario shows that the
> failure cause is indeed that the FDT is embedded in the .data output
> section at link time.
>>
>>
>>>> Not that I am against the patch, mind you, quite the opposite. I am ju=
st
>>>
>>> wondering about the pros and cons of having a separated (and aligned) D=
TS
>>> data *output* section and placing that section after .code and .data
> rather
>>> than between them.
>>>
>>> Bear in mind that embedding the fdt in the image is really only for
>>> development.
>>
>>
>> Understood, and I think that's one more reason to make sure that the act
> of FDT embedding does not alter .data input section ordering.
>
> Well it is just a data section really.

So are the relocation tables in .rel.dyn and .dynsyms, but that does not =

mean they have to go to the "dot data" output section.

>>> We could have a separate output section if you like. Up to you.
>>
>>
>> I much prefer embedded FDT data to be explicitly mapped to a a dedicated
> .fdt output section in u-boot.lds, because it ensures that aligment
> constaints for .fdt and .data can be controlled independently.
>
> I will take a look at this.

Thanks. This should be fairly easy to do in the linker script by =

inserting an output section (e.g. ".fdt") after .data, aligning the =

start of that section to a word boundary, and explicitly mapping the =

.data section of the FDT object file into it.

> Regards,
> Simon

Amicalement,
-- =

Albert.
