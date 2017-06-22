From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] Overlay syntax sugar using <&label>
Date: Thu, 22 Jun 2017 14:31:52 -0700
Message-ID: <594C3748.1030409@gmail.com>
References: <1497451986-15515-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497451986-15515-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/14/17 07:53, Pantelis Antoniou wrote:
> This patchset makes overlays simpler to write by utilizing
> the standard &label { }; syntax instead of the manual
> method which is more error prone.
> 
> Pantelis Antoniou (3):
>   overlay: Documentation for the overlay sugar syntax
>   overlay: Add syntactic sugar version of overlays
>   tests: Add a test for overlays syntactic sugar
> 
>  Documentation/dt-object-internal.txt | 17 +++++++++++++++++
>  dtc-parser.y                         | 20 +++++++++++++++++---
>  dtc.h                                |  1 +
>  livetree.c                           | 22 ++++++++++++++++++++++
>  tests/run_tests.sh                   |  6 ++++++
>  5 files changed, 63 insertions(+), 3 deletions(-)
> 

Hi David,

Any thoughts on this series?

I have been hoping this new syntax would be accepted.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
