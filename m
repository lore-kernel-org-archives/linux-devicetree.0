From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 0/3] Variable sized array element support
Date: Tue, 11 Oct 2011 11:11:02 -0700
Message-ID: <CAF6FioUyhpYX6PGTcNsEEBetppdQ291esmw9AfULp2B1FRw23w@mail.gmail.com>
References: <1318353749-24513-1-git-send-email-robotboy@chromium.org>
 <E1RDge1-00015M-D3@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1RDge1-00015M-D3-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 11, 2011 at 11:01 AM, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
>> This patch set adds, tests, and documents support for variable sized ele=
ments in
>> arrays (known as cell lists when they could only support 32-bit entries)=
. =A0The
>> new syntax is:
>>
>> =A0 =A0 property =3D /bits/ [8|16|32|64] <0x00 .... 0x12>;
>>
>> So arrays of 8, 16, 32, or 64-bit elements can now be created. =A0No pad=
ding is
>> done on the resulting array. =A0So if three 8-bit elements are specified=
 the
>> resulting property will contain three bytes.
>>
>> Changes in v2:
>> - sized_data renamed to celllist
>> - celllist definition moved to dtc-parser.y
>> - celllist non-terminal renamed to celllistprefix
>> - references always appended as -1 masked to the size of the cell
>> - smaller test values derived from TEST_VALUE_1
>> - data_append_literal renamed to data_append_integer
>> - be_ removed from values in data_append_integer
>> - len renamed to bits in data_append_integer
>>
>> Changes in v3:
>> - Renamed size to bits in docs, parser, commit messages, and celllist st=
ruct
>> - Remove die on overflow from data_append_integer
>> - Rewrite data_append_cell|addr in terms of data_append_integer
>> - Minor cosmetic change to property names in test case (added 'b' to las=
t two)
>>
>> Changes in v4:
>> - Only add phandle reference marker when element size is 32-bits
>> - Rename non-terminal celllistprefix to arrayprefix
>> - Rename semantic variable celllist to array
>> - Update documentation to use array and element instead of cell list and=
 cell
>>
>> Anton Staaf (3):
>> =A0 libfdt: Add fdt16_to_cpu utility function
>> =A0 dtc: Add data_append_integer function
>> =A0 dtc: Add support for variable sized elements
>>
>> =A0Documentation/dts-format.txt | =A0 34 +++++++++++-----
>> =A0data.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 39 +++++++++=
+++++++---
>> =A0dtc-lexer.l =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A06 +++
>> =A0dtc-parser.y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 70 +++++++++++++++=
+++++++++-----------
>> =A0dtc.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
>> =A0libfdt/libfdt_env.h =A0 =A0 =A0 =A0 =A0| =A0 =A06 +++
>> =A0tests/.gitignore =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
>> =A0tests/Makefile.tests =A0 =A0 =A0 =A0 | =A0 =A01 +
>> =A0tests/run_tests.sh =A0 =A0 =A0 =A0 =A0 | =A0 =A03 +
>> =A0tests/sized_cells.c =A0 =A0 =A0 =A0 =A0| =A0 84 +++++++++++++++++++++=
+++++++++++++++++++++
>> =A0tests/sized_cells.dts =A0 =A0 =A0 =A0| =A0 11 +++++
>> =A011 files changed, 216 insertions(+), 40 deletions(-)
>> =A0create mode 100644 tests/sized_cells.c
>> =A0create mode 100644 tests/sized_cells.dts
>
> Series applied.

Excellent, thanks.

-Anton

> Thanks,
> jdl
>
