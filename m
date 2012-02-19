From: Albert ARIBAUD <albert.u.boot@aribaud.net>
Subject: Re: [PATCH v4 04/20] arm: fdt: Ensure that an embedded fdt
	is word-aligned
Date: Sun, 19 Feb 2012 09:27:09 +0100
Message-ID: <4F40B25D.1090704@aribaud.net>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-5-git-send-email-sjg@chromium.org>
	<4F3F90A6.3070002@aribaud.net>
	<CAPnjgZ0hqaKEavwwO+5v7w08XPh7nObu0b_MQuE=wLjrOjyKzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ0hqaKEavwwO+5v7w08XPh7nObu0b_MQuE=wLjrOjyKzw@mail.gmail.com>
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

Le 18/02/2012 19:09, Simon Glass a =E9crit :
> Hi Albert,
>
> On Feb 18, 2012 3:51 AM, "Albert ARIBAUD"<albert.u.boot@aribaud.net>  wro=
te:
>>
>> Hi Simon,
>>
>> Le 12/01/2012 05:32, Simon Glass a =E9crit :
>>
>>> By putting the fdt blob into a distinctive area we can ensure that it
> appears
>>> at the start of the data section and is word-aligned.
>>>
>>> Note: It does not seem to be possible to get objcopy to honour its
>>> --section-alignment flag, which would otherwise provide an easier fix
>>> for this problem.
>>
>>
>> Stop me if I am wrong, but objcopy obviously works with output sections
> of its input file, not with input ones that this file was linked from, and
> so it cannot act upon alignment of data input sections, right? And as,
> before your patch, there is no designated output section for DTS data, it
> ends up (possibly mis-aligned) in the .data output section (which is
> globally aligned however), so there is no chance anyway that objcopy can
> re-align DTS data if they were mis-aligned.
>
> Well that's a shame if true. I was rather hoping that it would respect
> input section alignment when packing into an output section - it must do
> that in at least some cases since otherise I don't see how code regions
> could be collected together without one becoming misaligned if the one
> before was an odd size.

Objcopy is only a utility to convert built binaries from one format to =

another, and rightly ignores any alignment considerations. Alignment =

constraints are solved at link time within the .lds file. This is why I =

suggest a separate output section in u-boot.lds, because then you can =

set that section's alignment where all alignment constraints are laid out.

>> So I must be missing something. Can you clarify the scenario that gets
> fixed here?
>
> The fdt blob is in one of the object files. If during linking the file
> before it has a data segment whose size is not a multiple of 4, then the
> fdt object can be misaligned in the output.

Understood. This example of an alignment failure scenario shows that the =

failure cause is indeed that the FDT is embedded in the .data output =

section at link time.

>> Not that I am against the patch, mind you, quite the opposite. I am just
> wondering about the pros and cons of having a separated (and aligned) DTS
> data *output* section and placing that section after .code and .data rath=
er
> than between them.
>
> Bear in mind that embedding the fdt in the image is really only for
> development.

Understood, and I think that's one more reason to make sure that the act =

of FDT embedding does not alter .data input section ordering.

> We could have a separate output section if you like. Up to you.

I much prefer embedded FDT data to be explicitly mapped to a a dedicated =

.fdt output section in u-boot.lds, because it ensures that aligment =

constaints for .fdt and .data can be controlled independently.

> Regards,
> Simon

Amicalement,
-- =

Albert.
