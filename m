Return-Path: <SRS0=W+aX=KV=crashcourse.ca=rpjday@kernel.org>
Date: Mon, 6 Aug 2018 12:55:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: is there any continuing value in node "chosen@0"?
In-Reply-To: <CAL_JsqJnzYoKP-3PN_5g1rFTotMBDx5N-KecbQYAus+mspbBmw@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.1808061253130.27570@localhost.localdomain>
References: <alpine.LFD.2.21.1808060829250.18773@localhost.localdomain> <CAL_JsqJnzYoKP-3PN_5g1rFTotMBDx5N-KecbQYAus+mspbBmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 6 Aug 2018, Rob Herring wrote:

> On Mon, Aug 6, 2018 at 6:34 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >   while the current DTSpec says nothing about the chosen node
> > possibly having a unit-address, if i search the current linux
> > kernel code base, there are a few examples of just that:
> >
> > $ git grep chosen@
> > arch/mips/generic/yamon-dt.c:           chosen_off = fdt_path_offset(fdt, "/chosen@0");
> > arch/mips/generic/yamon-dt.c:           chosen_off = fdt_path_offset(fdt, "/chosen@0");
>
> Nothing MIPS based should need this I think.

  i just submitted a patch to the MIPS list, and they're applying it
to mips-next for 4.19, so i just need to browbeat the PPC folks into
dropping it, and all references to "/chosen@0" can be tossed entirely.

  i love deleting stuff.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                  http://crashcourse.ca/dokuwiki

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
