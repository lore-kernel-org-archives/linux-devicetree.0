From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 3/3] dtc: Add support for variable sized cells
Date: Thu, 22 Sep 2011 11:02:59 -0700
Message-ID: <CAF6FioV55CX9wBo5d1nKV=_t4+6BtHS6_hays08ZVgs2eDFvtA@mail.gmail.com>
References: <1316637731-21872-1-git-send-email-robotboy@chromium.org>
	<1316637731-21872-4-git-send-email-robotboy@chromium.org>
	<20110922024255.GG22223@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110922024255.GG22223-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On Wed, Sep 21, 2011 at 7:42 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Sep 21, 2011 at 01:42:11PM -0700, Anton Staaf wrote:
>> Cells of size 8, 16, 32, and 64 bits are supported. =A0The new
>> /size/ syntax was selected so as to not pollute the reserved
>> keyword space with uint8/uint16/... type names.
>>
>> With this patch the following property assignment:
>>
>> =A0 =A0 property =3D /size/ 16 <0x1234 0x5678 0x0 0xffff>;
>
> I'm now thinking that just plain "/size/" is maybe a bit too generic
> for this keyword. =A0But I'm not sure what would be better. =A0Maybe
> /cellsize/ or /intsize/ or /arraysize/.

Also /bits/ or /cellbits/ might make good choices because the size is in
bits and not in bytes.  I'm not fond of /arraysize/ because we are
specifying the size of each element in the array, not the array itself.

>>
>> is equivalent to:
>>
>> =A0 =A0 property =3D <0x12345678 0x0000ffff>;
>>
>> It is now also possible to directly specify a 64 bit literal in a
>> cell list using:
>>
>> =A0 =A0 property =3D /size/ 64 <0xdeadbeef00000000>;
>>
>> It is an error to attempt to store a literal into a cell that is too
>> small to hold the literal, and the compiler will generate an error
>> when it detects this. =A0For instance:
>>
>> =A0 =A0 property =3D /size/ 8 <256>;
>>
>> Will fail to compile. =A0It is also an error to attempt to place a
>> reference in a non 32-bit cell.
>>
>> The sized_cells test tests the creation and access of 8, 16, 32,
>> and 64-bit sized cells. =A0It also tests that the creation of two
>> properties, one with 16 bit cells and one with 32 bit cells result
>> in the same property contents.
>>
>> Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
>> Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> ---
>> =A0Documentation/dts-format.txt | =A0 18 +++++++-
>> =A0dtc-lexer.l =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A06 +++
>> =A0dtc-parser.y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 59 +++++++++++++++=
++++----------
>> =A0dtc.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++
>> =A0tests/.gitignore =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
>> =A0tests/Makefile.tests =A0 =A0 =A0 =A0 | =A0 =A01 +
>> =A0tests/run_tests.sh =A0 =A0 =A0 =A0 =A0 | =A0 =A03 +
>> =A0tests/sized_cells.c =A0 =A0 =A0 =A0 =A0| =A0 84 +++++++++++++++++++++=
+++++++++++++++++++++
>> =A0tests/sized_cells.dts =A0 =A0 =A0 =A0| =A0 11 +++++
>> =A0tests/testdata.h =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +
>> =A010 files changed, 165 insertions(+), 24 deletions(-)
>> =A0create mode 100644 tests/sized_cells.c
>> =A0create mode 100644 tests/sized_cells.dts
>>
>> diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
>> index 555bd89..0502f49 100644
>> --- a/Documentation/dts-format.txt
>> +++ b/Documentation/dts-format.txt
>> @@ -29,18 +29,27 @@ except for properties with empty (zero length) value=
 which have the
>> =A0form:
>> =A0 =A0 =A0 [label:] property-name;
>>
>> -Property values may be defined as an array of 32-bit integer cells, as
>> -NUL-terminated strings, as bytestrings or a combination of these.
>> +Property values may be defined as an array of 8, 16, 32, or 64-bit inte=
ger
>> +cells, as NUL-terminated strings, as bytestrings or a combination of th=
ese.
>>
>> =A0* Arrays of cells are represented by angle brackets surrounding a
>> =A0 =A0space separated list of C-style integers or character literals.
>> + =A0Cells default to 32-bits in size.
>>
>> =A0 =A0 =A0 e.g. interrupts =3D <17 0xc>;
>>
>> -* A 64-bit value is represented with two 32-bit cells.
>> +* A 64-bit value can be represented with two 32-bit cells.
>>
>> =A0 =A0 =A0 e.g. clock-frequency =3D <0x00000001 0x00000000>;
>>
>> +* The storage size of a cell can be changed using the /size/ prefix. =
=A0The
>> + =A0/size/ prefix allows for the creation of 8, 16, 32, and 64-bit cell=
s.
>> + =A0The resulting cell array will not be padded to a multiple of the de=
fault
>> + =A032-bit cell size.
>> +
>> + =A0 =A0 e.g. interrupts =3D /size/ 8 <17 0xc>;
>> + =A0 =A0 e.g. clock-frequenct =3D /size/ 64 <0x0000000100000000>;
>> +
>> =A0* A NUL-terminated string value is represented using double quotes
>> =A0 =A0(the property value is considered to include the terminating NUL
>> =A0 =A0character).
>> @@ -65,6 +74,8 @@ NUL-terminated strings, as bytestrings or a combinatio=
n of these.
>> =A0 =A0 =A0 e.g. interrupt-parent =3D < &mpic >;
>> =A0 =A0or they may be '&' followed by a node's full path in braces:
>> =A0 =A0 =A0 e.g. interrupt-parent =3D < &{/soc/interrupt-controller@4000=
0} >;
>> + =A0References are only permitted in cell arrays that have a cell size =
of
>> + =A032-bits.
>>
>> =A0* Outside a cell array, a reference to another node will be expanded
>> =A0 =A0to that node's full path.
>> @@ -109,3 +120,4 @@ Version 1 DTS files have the overall layout:
>>
>> =A0 =A0 =A0 -- David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>> =A0 =A0 =A0 -- Yoder Stuart <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> + =A0 =A0 -- Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> diff --git a/dtc-lexer.l b/dtc-lexer.l
>> index 494e342..01ed628 100644
>> --- a/dtc-lexer.l
>> +++ b/dtc-lexer.l
>> @@ -97,6 +97,12 @@ static int pop_input_file(void);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return DT_MEMRESERVE;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>
>> +<*>"/size/" =A0{
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DPRINT("Keyword: /size/\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 BEGIN_DEFAULT();
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return DT_SIZE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> =A0<*>{LABEL}: =A0{
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DPRINT("Label: %s\n", yytext=
);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 yylval.labelref =3D xstrdup(=
yytext);
>> diff --git a/dtc-parser.y b/dtc-parser.y
>> index bc05a24..6355ce2 100644
>> --- a/dtc-parser.y
>> +++ b/dtc-parser.y
>> @@ -44,9 +44,9 @@ static unsigned char eval_char_literal(const char *s);
>> =A0 =A0 =A0 unsigned int cbase;
>> =A0 =A0 =A0 uint8_t byte;
>> =A0 =A0 =A0 struct data data;
>> + =A0 =A0 struct sized_data sized_data;
>>
>> =A0 =A0 =A0 uint64_t addr;
>> - =A0 =A0 cell_t cell;
>> =A0 =A0 =A0 struct property *prop;
>> =A0 =A0 =A0 struct property *proplist;
>> =A0 =A0 =A0 struct node *node;
>> @@ -56,6 +56,7 @@ static unsigned char eval_char_literal(const char *s);
>>
>> =A0%token DT_V1
>> =A0%token DT_MEMRESERVE
>> +%token DT_SIZE
>> =A0%token <propnodename> DT_PROPNODENAME
>> =A0%token <literal> DT_LITERAL
>> =A0%token <literal> DT_CHAR_LITERAL
>> @@ -71,8 +72,7 @@ static unsigned char eval_char_literal(const char *s);
>> =A0%type <re> memreserve
>> =A0%type <re> memreserves
>> =A0%type <addr> addr
>> -%type <data> celllist
>> -%type <cell> cellval
>> +%type <sized_data> celllist
>> =A0%type <data> bytestring
>> =A0%type <prop> propdef
>> =A0%type <proplist> proplist
>> @@ -182,9 +182,9 @@ propdata:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D data_merge($1, $2);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 | propdataprefix '<' celllist '>'
>> + =A0 =A0 | propdataprefix celllist '>'
>
> I'd rename celllist to cellistprefix or something, or this looks
> decidedly odd.

Done

>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D data_merge($1, $3);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D data_merge($1, $2.data);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 | propdataprefix '[' bytestring ']'
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> @@ -243,33 +243,50 @@ propdataprefix:
>> =A0 =A0 =A0 ;
>>
>> =A0celllist:
>> - =A0 =A0 =A0 /* empty */
>> + =A0 =A0 DT_SIZE DT_LITERAL '<'
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D empty_data;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.data =3D empty_data;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.size =3D eval_literal($2, 0=
, 7);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (($$.size !=3D =A08) &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ($$.size !=3D 16) &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ($$.size !=3D 32) &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ($$.size !=3D 64))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 print_error("O=
nly 8, 16, 32 and 64-bit cell"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 " sizes are currently supported");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.size =3D 32;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 | celllist cellval
>> + =A0 =A0 | '<'
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D data_append_cell($1, $2=
);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.data =3D empty_data;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.size =3D 32;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 | celllist DT_REF
>> + =A0 =A0 | celllist DT_LITERAL
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D data_append_cell(data_a=
dd_marker($1, REF_PHANDLE,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $2), -1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint64_t val =3D eval_literal(=
$2, 0, $1.size);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.data =3D data_append_litera=
l($1.data, val, $1.size);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 | celllist DT_LABEL
>> + =A0 =A0 | celllist DT_CHAR_LITERAL
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D data_add_marker($1, LAB=
EL, $2);
>> - =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 ;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint64_t val =3D eval_char_lit=
eral($2);
>>
>> -cellval:
>> - =A0 =A0 =A0 DT_LITERAL
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.data =3D data_append_litera=
l($1.data, val, $1.size);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 | celllist DT_REF
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D eval_literal($1, 0, 32);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ($1.size !=3D 32)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 print_error("R=
eferences only allowed in 32-bit"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 " cell lists");
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.data =3D data_add_marker($1=
.data, REF_PHANDLE, $2);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.data =3D data_append_cell($=
$.data, -1);
>
> Ouch, this is kind of nasty. =A0If you get a REF in a celllist of the
> wrong size, you print an error, but then insert the ref as a 32-bit
> quantity, regardless of the actual cell size. =A0While you can argue
> that correct behaviour is undefined in this error case, I think this
> is a fair way from least-surprise.
>
> I'd suggest instead that in the error case, you insert either a 0 or
> -1 of the correct cell size instead of the reference.

Done, I opted for 0xffffffffffffffff masked to the right size so the check =
in
data_append_integer wouldn't fail out.  And for consistency with the -1
that is stored in the normal 32-bit case.

>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 | DT_CHAR_LITERAL
>> + =A0 =A0 | celllist DT_LABEL
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$ =3D eval_char_literal($1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $$.data =3D data_add_marker($1=
.data, LABEL, $2);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 ;
>>
>> diff --git a/dtc.h b/dtc.h
>> index 50433f6..199b3f1 100644
>> --- a/dtc.h
>> +++ b/dtc.h
>> @@ -87,6 +87,10 @@ struct data {
>> =A0 =A0 =A0 struct marker *markers;
>> =A0};
>>
>> +struct sized_data {
>> + =A0 =A0 struct data =A0 =A0 data;
>> + =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 size;
>> +};
>
> This is only used internal to the parser, so the definition can just
> go in dtc-parser.y. =A0And maybe call it cellarray or something more
> specific to its usage. =A0"sized_data" suggests it holds the size of the
> whole of the data, which doesn't make sense, since a struct data does
> that already.

Done, I didn't see a simple way to add the definition to the part of the
generated header that comes before the definition of the union.  So
instead I added this as an anonymous struct directly in the union.

>> =A0#define empty_data ((struct data){ /* all .members =3D 0 or NULL */ })
>>
>> diff --git a/tests/.gitignore b/tests/.gitignore
>> index a3e9bd1..9e062c3 100644
>> --- a/tests/.gitignore
>> +++ b/tests/.gitignore
>> @@ -40,6 +40,7 @@
>> =A0/set_name
>> =A0/setprop
>> =A0/setprop_inplace
>> +/sized_cells
>> =A0/string_escapes
>> =A0/subnode_offset
>> =A0/supernode_atdepth_offset
>> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
>> index e718b63..60f3af0 100644
>> --- a/tests/Makefile.tests
>> +++ b/tests/Makefile.tests
>> @@ -6,6 +6,7 @@ LIB_TESTS_L =3D get_mem_rsv \
>> =A0 =A0 =A0 node_check_compatible node_offset_by_compatible \
>> =A0 =A0 =A0 get_alias \
>> =A0 =A0 =A0 char_literal \
>> + =A0 =A0 sized_cells \
>> =A0 =A0 =A0 notfound \
>> =A0 =A0 =A0 setprop_inplace nop_property nop_node \
>> =A0 =A0 =A0 sw_tree1 \
>> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
>> index 1246df1..df97f83 100755
>> --- a/tests/run_tests.sh
>> +++ b/tests/run_tests.sh
>> @@ -209,6 +209,9 @@ dtc_tests () {
>> =A0 =A0 =A0run_dtc_test -I dts -O dtb -o dtc_char_literal.test.dtb char_=
literal.dts
>> =A0 =A0 =A0run_test char_literal dtc_char_literal.test.dtb
>>
>> + =A0 =A0run_dtc_test -I dts -O dtb -o dtc_sized_cells.test.dtb sized_ce=
lls.dts
>> + =A0 =A0run_test sized_cells dtc_sized_cells.test.dtb
>> +
>> =A0 =A0 =A0run_dtc_test -I dts -O dtb -o dtc_extra-terminating-null.test=
.dtb extra-terminating-null.dts
>> =A0 =A0 =A0run_test extra-terminating-null dtc_extra-terminating-null.te=
st.dtb
>>
>> diff --git a/tests/sized_cells.c b/tests/sized_cells.c
>> new file mode 100644
>> index 0000000..5a5e7c2
>> --- /dev/null
>> +++ b/tests/sized_cells.c
>> @@ -0,0 +1,84 @@
>> +/*
>> + * libfdt - Flat Device Tree manipulation
>> + * =A0 Testcase for variable sized cells in dtc
>> + * Copyright (C) 2006 David Gibson, IBM Corporation.
>> + * Copyright (C) 2011 The Chromium Authors. All rights reserved.
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public License
>> + * as published by the Free Software Foundation; either version 2.1 of
>> + * the License, or (at your option) any later version.
>> + *
>> + * This library is distributed in the hope that it will be useful, but
>> + * WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, write to the Free Software
>> + * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301=
 USA
>> + */
>> +#include <stdlib.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <stdint.h>
>> +
>> +#include <fdt.h>
>> +#include <libfdt.h>
>> +
>> +#include "tests.h"
>> +#include "testdata.h"
>> +
>> +static void check_compare_properties(void *fdt,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cha=
r const *name_one,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cha=
r const *name_two)
>> +{
>> + =A0 =A0 const void *propval;
>> + =A0 =A0 int proplen;
>> +
>> + =A0 =A0 propval =3D fdt_getprop(fdt, 0, name_one, &proplen);
>> +
>> + =A0 =A0 if (!propval)
>> + =A0 =A0 =A0 =A0 =A0 =A0 FAIL("fdt_getprop(\"%s\"): %s",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0name_one,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fdt_strerror(proplen));
>> +
>> + =A0 =A0 check_getprop(fdt, 0, name_two, proplen, propval);
>> +}
>> +
>> +int main(int argc, char *argv[])
>> +{
>> + =A0 =A0 void *fdt;
>> + =A0 =A0 uint8_t expected_8[6] =3D {TEST_CHAR1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0TEST_CHAR2,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0TEST_CHAR3,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0TEST_CHAR4,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0TEST_CHAR5,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0TEST_VALUE_=
3};
>> + =A0 =A0 uint16_t expected_16[6];
>> + =A0 =A0 uint32_t expected_32[6];
>> + =A0 =A0 uint64_t expected_64[6];
>> + =A0 =A0 int i;
>> +
>> + =A0 =A0 for (i =3D 0; i < 5; ++i) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 expected_16[i] =3D cpu_to_fdt16(expected_8[i]);
>> + =A0 =A0 =A0 =A0 =A0 =A0 expected_32[i] =3D cpu_to_fdt32(expected_8[i]);
>> + =A0 =A0 =A0 =A0 =A0 =A0 expected_64[i] =3D cpu_to_fdt64(expected_8[i]);
>> + =A0 =A0 }
>> +
>> + =A0 =A0 expected_16[5] =3D cpu_to_fdt16(TEST_VALUE_4);
>> + =A0 =A0 expected_32[5] =3D cpu_to_fdt32(TEST_VALUE_1);
>> + =A0 =A0 expected_64[5] =3D cpu_to_fdt64(TEST_ADDR_1);
>> +
>> + =A0 =A0 test_init(argc, argv);
>> + =A0 =A0 fdt =3D load_blob_arg(argc, argv);
>> +
>> + =A0 =A0 check_getprop(fdt, 0, "cells-8b", sizeof(expected_8), expected=
_8);
>> + =A0 =A0 check_getprop(fdt, 0, "cells-16b", sizeof(expected_16), expect=
ed_16);
>> + =A0 =A0 check_getprop(fdt, 0, "cells-32b", sizeof(expected_32), expect=
ed_32);
>> + =A0 =A0 check_getprop(fdt, 0, "cells-64b", sizeof(expected_64), expect=
ed_64);
>> +
>> + =A0 =A0 check_compare_properties(fdt, "cells-one-16", "cells-one-32");
>> +
>> + =A0 =A0 PASS();
>> +}
>> diff --git a/tests/sized_cells.dts b/tests/sized_cells.dts
>> new file mode 100644
>> index 0000000..abd0caf
>> --- /dev/null
>> +++ b/tests/sized_cells.dts
>> @@ -0,0 +1,11 @@
>> +/dts-v1/;
>> +
>> +/ {
>> + =A0 =A0 cells-8b =3D /size/ 8 <'\r' 'b' '\0' '\'' '\xff' 0xde>;
>> + =A0 =A0 cells-16b =3D /size/ 16 <'\r' 'b' '\0' '\'' '\xff' 0xdead>;
>> + =A0 =A0 cells-32b =3D /size/ 32 <'\r' 'b' '\0' '\'' '\xff' 0xdeadbeef>;
>> + =A0 =A0 cells-64b =3D /size/ 64 <'\r' 'b' '\0' '\'' '\xff' 0xdeadbeef0=
0000000>;
>> +
>> + =A0 =A0 cells-one-16 =3D /size/ 16 <0x1234 0x5678 0x0 0xffff>;
>> + =A0 =A0 cells-one-32 =3D <0x12345678 0x0000ffff>;
>> +};
>> diff --git a/tests/testdata.h b/tests/testdata.h
>> index d4c6759..2d89470 100644
>> --- a/tests/testdata.h
>> +++ b/tests/testdata.h
>> @@ -11,6 +11,8 @@
>>
>> =A0#define TEST_VALUE_1 0xdeadbeef
>> =A0#define TEST_VALUE_2 123456789
>> +#define TEST_VALUE_3 0xde
>> +#define TEST_VALUE_4 0xdead
>
> I think it would be better to use masked versions of the existing
> constants, rather than defining new short ones.
>
>>
>> =A0#define PHANDLE_1 =A0 =A00x2000
>> =A0#define PHANDLE_2 =A0 =A00x2001
>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>

Thanks,
    Anton
