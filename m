From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v4 04/20] arm: fdt: Ensure that an embedded fdt
	is word-aligned
Date: Sun, 19 Feb 2012 08:23:54 -0800
Message-ID: <CAPnjgZ2sq7Gx8XQ3OG0a6sAVS_S_F7V3XkyCXMz2GvA=e+y_Vg@mail.gmail.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-5-git-send-email-sjg@chromium.org>
	<4F3F90A6.3070002@aribaud.net>
	<CAPnjgZ0hqaKEavwwO+5v7w08XPh7nObu0b_MQuE=wLjrOjyKzw@mail.gmail.com>
	<4F40B25D.1090704@aribaud.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0706246583=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F40B25D.1090704@aribaud.net>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Albert ARIBAUD <albert.u.boot@aribaud.net>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <twarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

--===============0706246583==
Content-Type: multipart/alternative; boundary=e89a8f234d5d9d68ba04b9539a04

--e89a8f234d5d9d68ba04b9539a04
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Albert,

On Feb 19, 2012 12:27 AM, "Albert ARIBAUD" <albert.u.boot@aribaud.net>
wrote:
>
> Hi Simon,
>
> Le 18/02/2012 19:09, Simon Glass a =E9crit :
>
>> Hi Albert,
>>
>> On Feb 18, 2012 3:51 AM, "Albert ARIBAUD"<albert.u.boot@aribaud.net>
 wrote:
>>>
>>>
>>> Hi Simon,
>>>
>>> Le 12/01/2012 05:32, Simon Glass a =E9crit :
>>>
>>>> By putting the fdt blob into a distinctive area we can ensure that it
>>
>> appears
>>>>
>>>> at the start of the data section and is word-aligned.
>>>>
>>>> Note: It does not seem to be possible to get objcopy to honour its
>>>> --section-alignment flag, which would otherwise provide an easier fix
>>>> for this problem.
>>>
>>>
>>>
>>> Stop me if I am wrong, but objcopy obviously works with output sections
>>
>> of its input file, not with input ones that this file was linked from,
and
>> so it cannot act upon alignment of data input sections, right? And as,
>> before your patch, there is no designated output section for DTS data, i=
t
>> ends up (possibly mis-aligned) in the .data output section (which is
>> globally aligned however), so there is no chance anyway that objcopy can
>> re-align DTS data if they were mis-aligned.
>>
>> Well that's a shame if true. I was rather hoping that it would respect
>> input section alignment when packing into an output section - it must do
>> that in at least some cases since otherise I don't see how code regions
>> could be collected together without one becoming misaligned if the one
>> before was an odd size.
>
>
> Objcopy is only a utility to convert built binaries from one format to
another, and rightly ignores any alignment considerations. Alignment
constraints are solved at link time within the .lds file. This is why I
suggest a separate output section in u-boot.lds, because then you can set
that section's alignment where all alignment constraints are laid out.
>

Sorry I had that wrong - it's not the link step I am bothered by, it is the
objcopy step.

What I would like to do is mark the input section, created by objcopy, with
a particular alignment so that the linker does the right thing. This
feature appears to be present in objcopy but does not appear to work.
Perhaps I should debug that first to see what is going on.

>
>>> So I must be missing something. Can you clarify the scenario that gets
>>
>> fixed here?
>>
>> The fdt blob is in one of the object files. If during linking the file
>> before it has a data segment whose size is not a multiple of 4, then the
>> fdt object can be misaligned in the output.
>
>
> Understood. This example of an alignment failure scenario shows that the
failure cause is indeed that the FDT is embedded in the .data output
section at link time.
>
>
>>> Not that I am against the patch, mind you, quite the opposite. I am jus=
t
>>
>> wondering about the pros and cons of having a separated (and aligned) DT=
S
>> data *output* section and placing that section after .code and .data
rather
>> than between them.
>>
>> Bear in mind that embedding the fdt in the image is really only for
>> development.
>
>
> Understood, and I think that's one more reason to make sure that the act
of FDT embedding does not alter .data input section ordering.
>

Well it is just a data section really.

>
>> We could have a separate output section if you like. Up to you.
>
>
> I much prefer embedded FDT data to be explicitly mapped to a a dedicated
.fdt output section in u-boot.lds, because it ensures that aligment
constaints for .fdt and .data can be controlled independently.

I will take a look at this.

Regards,
Simon

>
>
>> Regards,
>> Simon
>
>
> Amicalement,
> --
> Albert.

--e89a8f234d5d9d68ba04b9539a04--

--===============0706246583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0706246583==--
