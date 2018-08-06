MIME-Version: 1.0
Date: Mon, 6 Aug 2018 09:57:21 -0600
References: <alpine.LFD.2.21.1808060829250.18773@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.1808060829250.18773@localhost.localdomain>
Message-ID: <CAL_JsqJnzYoKP-3PN_5g1rFTotMBDx5N-KecbQYAus+mspbBmw@mail.gmail.com>
Subject: Re: is there any continuing value in node "chosen@0"?
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 6, 2018 at 6:34 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   while the current DTSpec says nothing about the chosen node possibly
> having a unit-address, if i search the current linux kernel code base,
> there are a few examples of just that:
>
> $ git grep chosen@
> arch/mips/generic/yamon-dt.c:           chosen_off = fdt_path_offset(fdt, "/chosen@0");
> arch/mips/generic/yamon-dt.c:           chosen_off = fdt_path_offset(fdt, "/chosen@0");

Nothing MIPS based should need this I think.

> arch/powerpc/boot/oflib.c:              chosen = of_finddevice("/chosen@0");
> drivers/of/base.c:              of_chosen = of_find_node_by_path("/chosen@0");
> drivers/of/fdt.c:               offset = fdt_path_offset(fdt, "/chosen@0");
> drivers/of/fdt.c:           (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
>
>   is there some lingering value to the node name "chosen@0"? or should
> this all be simplified to just "chosen"?

These are needed for some PPC system(s) though I don't have any clue
which ones specifically.

Rob
