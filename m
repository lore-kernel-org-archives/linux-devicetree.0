From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 04/11] of/flattree: eliminate cell_t typedef
Date: Wed, 25 Nov 2009 21:05:59 -0700
Message-ID: <fa686aa40911252005o2db85dfk3d9acc61c12ca5e5@mail.gmail.com>
References: <20091124081316.6216.66310.stgit@angua> <20091124081827.6216.1896.stgit@angua>
	<1259207974.16367.226.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <1259207974.16367.226.camel@pasglop>
Sender: sparclinux-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, microblaze-uclinux@itee.uq.edu.au, sfr@canb.auug.org.au, davem@davemloft.net, monstr@monstr.eu
List-Id: devicetree@vger.kernel.org

On Wed, Nov 25, 2009 at 8:59 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Tue, 2009-11-24 at 01:18 -0700, Grant Likely wrote:
>> A cell is firmly established as a u32. =A0No need to do an ugly type=
def
>> to redefine it to cell_t. =A0Eliminate the unnecessary typedef so th=
at
>> it doesn't have to be added to the of_fdt header file
>>
>> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
>> ---
>
> I'm not sure about that one. Yes, we do use u32 a lot and cell_t rare=
ly,
> so it would seem logical to switch.... On the other hand, we have tha=
t
> pesky endianness issue we have never fully solved. So we need accesso=
rs
> to sort that out, which means directly tapping things as u32 * is not=
 a
> good idea if we're going to enforce the use of such accessors.
>
> I believe we should probably just enforce that properties are big end=
ian
> for flat device-trees. In which case we could just use __be32 or on o=
f
> thoes sparse-friendly types. I know x86 people won't like that much a=
nd
> to be honest I don't know what 1295 specifies for real OFs but there
> aren't enough real OFs around on LE machines for us to care much abou=
t
> it, is there ?

Word from Mitch is the device tree is network byte order.  period.

> The reason I prefer a fixed endianness is that allowing "LE" trees
> becomes really nasty when a number is expressed using multiple cells.
> That brings the question as to whether the two cells need to be flipp=
ed
> as well or only the bytes within each cell. And that's the easy bit
> (probably flip the whole thing). What about something like a PCI "reg=
"
> property which is made of 3 cells, two of them forming a 64-bit addre=
ss
> and one containing additional data & attributes ? What is flipped and
> where ?

exactly.

> So yes, cell_t might not be the right approach and by far to generic =
a
> name, but u32 isn't the answer neither.

You're right, it's not, but makes merging less complex, and then I can
refactor properly.

g.


--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
