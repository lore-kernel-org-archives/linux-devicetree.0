From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 3/3] dtc: Add support for variable sized cells
Date: Mon, 26 Sep 2011 13:48:31 -0700
Message-ID: <CAF6FioUGZV4P10Z9A1U65bdue9Tqr5DyAV++z8ZyJDeLMXGWgA@mail.gmail.com>
References: <1316800974-30129-1-git-send-email-robotboy@chromium.org>
	<1316800974-30129-4-git-send-email-robotboy@chromium.org>
	<20110925110454.GP12286@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110925110454.GP12286-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 25, 2011 at 4:04 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Sep 23, 2011 at 11:02:54AM -0700, Anton Staaf wrote:
>> Cells of size 8, 16, 32, and 64 bits are supported. =A0The new
>> /bits/ syntax was selected so as to not pollute the reserved
>> keyword space with uint8/uint16/... type names.
>>
>> With this patch the following property assignment:
>>
>> =A0 =A0 property =3D /bits/ 16 <0x1234 0x5678 0x0 0xffff>;
>>
>> is equivalent to:
>>
>> =A0 =A0 property =3D <0x12345678 0x0000ffff>;
>>
>> It is now also possible to directly specify a 64 bit literal in a
>> cell list using:
>>
>> =A0 =A0 property =3D /bits/ 64 <0xdeadbeef00000000>;
>>
>> It is an error to attempt to store a literal into a cell that is too
>> small to hold the literal, and the compiler will generate an error
>> when it detects this. =A0For instance:
>>
>> =A0 =A0 property =3D /bits/ 8 <256>;
>>
>> Will fail to compile. =A0It is also an error to attempt to place a
>> reference in a non 32-bit cell.
>
> So, there's one small but serious error left in the patch, see below.
>
> Other than that, only two things concern me:
>
> =A0 =A0 =A0 =A01) Exactly what to call the keyword. =A0/bits/ is better t=
han
> /size/, but I'd still like to stew a bit on it to see if we can come
> up with anything better.

Sounds good.  I have a slight preference for /bits/ over something like
/element-bits/ or /elementbits/.  But could be convinced if that was
preferred.

> =A0 =A0 =A0 =A02) In the documentation and internal naming, we're using
> the term "cell" ambiguously. =A0In the discussion of this extension
> we've been using "cell" to mean one array element, which is fair
> enough since it's more-or-less standard CS terminology. =A0However, in
> previous FDT and OF terminology "cell" refers to an exactly 32-bit
> quantity [well, to be exact OF old-timers say this isn't strictly
> right in old OF-ese, but it's close enough to meaning that for most
> purposes].
> =A0 =A0 =A0 =A0So, I think we need to find a different name for array cel=
ls
> to clarify the terminology. =A0"elements" maybe?

The documentation all talks about arrays of cells.  Where as the source code
always calls them lists of cells.  I agree that calling them cells once the=
y are
no longer fixed to 32-bits should be avoided.  One solution would be to ren=
ame
the non-terminal and semantic variables in the parser from celllistprefix a=
nd
celllist to arrayprefix and array respectively.  I would also change the er=
ror
message about the size not being one of the supported sizes to say "element"
instead of "cell".

I could likewise clean up the documentation so that the only mentions of the
cell type were consistent with 32-bit cells.  In fact, reading over the
documentation, it looks like a lot of the references to "cell array"
can be turned
into just "array", and the remaining references to "cell" can become "eleme=
nt".

How does this sound?

> [snip]
>> + =A0 =A0 | celllistprefix DT_REF
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D eval_literal($1, 0, 32);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint64_t val =3D ~0ULL >> (64 =
- $1.bits);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ($1.bits !=3D 32)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 print_error("R=
eferences only allowed in 32-bit"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 " cell lists");
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.data =3D data_add_marker($1=
.data, REF_PHANDLE, $2);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.data =3D data_append_intege=
r($$.data, val, $1.bits);
>
> Uh, so, this is actually worse than what you had before. =A0Remember
> print_error() just prints an error, without aborting the parse. =A0So
> now, if bits !=3D 32 it will print the error, then add a phandle marker
> *and* a bits-sized -1. =A0So later, when we go through and fix up the
> REF_PHANDLE markers, we'll assume we're replacing 32-bits of data,
> which could overrun the end of the data if the element size is less
> than 32.
>
> So, basically the data_add_marker() needs to be in an else clause.

Done.

Thanks,
     Anton

> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
