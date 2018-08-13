MIME-Version: 1.0
Date: Mon, 13 Aug 2018 08:19:50 -0600
References: <1532001244-8349-1-git-send-email-harish_kandiga@mentor.com>
	<9a6321f6-8706-97b4-3e6c-8f5d8724ecc2@gmail.com>
	<3e9a6139-fc84-188f-5139-349f491abea6@mentor.com>
In-Reply-To: <3e9a6139-fc84-188f-5139-349f491abea6@mentor.com>
Message-ID: <CAL_JsqJvk=EtXU+-pFyUVdwgEKGHS9QqOUBMomiOAGpjA1=zDw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: remove dynamic-resolution-notes reference
 to non-existent file
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: harish_kandiga@mentor.com
Cc: Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 13, 2018 at 3:33 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:
>
>
> On Thursday 19 July 2018 09:48 PM, Frank Rowand wrote:
> > On 07/19/18 04:54, Harish Jenny K N wrote:
> >> File dt-object-internal.txt does not exist. This patch removes
> >> a reference to it.
> >>
> >> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> >> ---
> >>  Documentation/devicetree/dynamic-resolution-notes.txt | 5 ++---
> >>  1 file changed, 2 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/dynamic-resolution-notes.txt b/Documentation/devicetree/dynamic-resolution-notes.txt
> >> index 083d232..c24ec36 100644
> >> --- a/Documentation/devicetree/dynamic-resolution-notes.txt
> >> +++ b/Documentation/devicetree/dynamic-resolution-notes.txt
> >> @@ -2,15 +2,14 @@ Device Tree Dynamic Resolver Notes
> >>  ----------------------------------
> >>
> >>  This document describes the implementation of the in-kernel
> >> -Device Tree resolver, residing in drivers/of/resolver.c and is a
> >> -companion document to Documentation/devicetree/dt-object-internal.txt[1]
> >> +Device Tree resolver, residing in drivers/of/resolver.c
> >>
> >>  How the resolver works
> >>  ----------------------
> >>
> >>  The resolver is given as an input an arbitrary tree compiled with the
> >>  proper dtc option and having a /plugin/ tag. This generates the
> >> -appropriate __fixups__ & __local_fixups__ nodes as described in [1].
> >> +appropriate __fixups__ & __local_fixups__ nodes.
> >>
> >>  In sequence the resolver works by the following steps:
> >>
> >> --
> >> 2.7.4
> >>
> >>
> > Reviewed-by: Frank Rowand <frank.rowand@sony.com>
>
>
> Can anyone please commit this ?

Applied.

Rob
