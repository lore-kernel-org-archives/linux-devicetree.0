From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 3/6] Add fdtget utility to read property values from
	device tree
Date: Thu, 8 Sep 2011 05:47:34 -0700
Message-ID: <CAPnjgZ0qnr8VVOX7kCq6wEZ-OxAsxmHkPcTGE7wu1B_9ME_SPA@mail.gmail.com>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
	<1315425260-2711-4-git-send-email-sjg@chromium.org>
	<20110908052547.GR30278@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110908052547.GR30278-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Wed, Sep 7, 2011 at 10:25 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Sep 07, 2011 at 12:54:17PM -0700, Simon Glass wrote:
>> This simply utility makes it easy for scripts to read values from the de=
vice
>> tree. It is written in C and uses the same libfdt as the rest of the dtc
>> package.
>>
>> What is it for:
>> - Reading fdt values from scripts
>> - Extracting fdt information within build systems
>> - Looking at particular values without having to dump the entire tree
>>
>> To use it, specify the fdt binary file on command line followed by a lis=
t of
>> node, property pairs. The utility then looks up each node, finds the pro=
perty
>> and displays the value.
>>
>> Each value is printed on a new line.
>>
>> fdtget tries to guess the type of each property based on its contents. T=
his
>> is not always reliable, so you can use the -t option to force fdtget to =
decode
>> the value as a string, or byte, etc.
>>
>> To read from stdin, use - as the file.
>>
>> Usage:
>> =A0 =A0 =A0 fdtget <options> <dt file> [<node> <property>]...
>> Options:
>> =A0 =A0 =A0 -t [<type>][<format>] =A0 Type of data
>> =A0 =A0 =A0 -h =A0 =A0 =A0 =A0 =A0 =A0 =A0Print this help
>>
>> =A0 =A0 =A0 <type> =A0 =A0 =A0 =A0 =A0One character (s=3Dstring, i=3Dint=
, u=3Dunsigned, b=3Dbyte)
>> =A0 =A0 =A0 <format> =A0 =A0 =A0 =A0Optional format character (x=3Dhex)
>
> It is not terribly clear how these are combined.

A type character, then an optional format character. In fact the type
character is also optional at present since integer is assumed.

Please can you suggest a suitable help message to convey this?

>
> Is there any way to make these more closely resemble printf() style
> format specifiers?

The first patch series allowed printf specifiers but could segfault if
the user specified %s for something that was in fact not a string. I
have moved away from that as you suggested at the time. I am not keen
to re-implement printf(), or manually decode a partial subset of
printf strings, to avoid that problem. So something simple like this
is what I have come up with.

We need to encode the data size in there also - byte or integer - so
it is not quite the same as what printf is trying to do. While
printf() has %c I don't think it is a good idea to use that, since we
are printing a byte as a number, not an ASCII character.

But it is fairly close to printf, in that you can use:

-ts
-tx
-ti
-tu
-tix
-tbx

We could combine -tbx into a single letter somehow but I'm not sure I
like that idea.

I don't see any point in requiring a % since then users would expect
to be able to provide an arbitrary printf() string (see first patch
set).

So, suggestions please.

Regards,
Simon

>
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>> Changes in v2:
>> - Separate arguments for node and property
>> - Merge two related commits into this one
>> - Use structure for storing display options
>> - Remove use of getopt_long()
>>
>> =A0.gitignore =A0 =A0 =A0| =A0 =A01 +
>> =A0Makefile =A0 =A0 =A0 =A0| =A0 =A04 +
>> =A0Makefile.fdtget | =A0 12 +++
>> =A0fdtget.c =A0 =A0 =A0 =A0| =A0200 ++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++
>> =A04 files changed, 217 insertions(+), 0 deletions(-)
>> =A0create mode 100644 Makefile.fdtget
>> =A0create mode 100644 fdtget.c
>>
[snip]
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
