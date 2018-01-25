From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Thu, 25 Jan 2018 10:14:38 +0100
Message-ID: <90983180-ae3b-5a31-9dc0-b62b978a0fba@gmail.com>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
 <20180123124232.GA14832@umbus>
 <20328477-e511-e875-7dc4-253640f2219e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20328477-e511-e875-7dc4-253640f2219e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/23/2018 10:17 PM, Frank Rowand wrote:
[...]
> My knowledge of bootloader use of the FDT is nearly non-existent, so
> I'm on thin ice here.  But I am guessing that a lot of bootloader
> processing of FDT data could be removed if the kernel would unflatten
> a chained FDT and overlay FDT(s).
> 
> Comments from the bootloader folks on this topic would be much
> appreciated.

U-Boot, when using DT as a hardware-description (rather than just
passing it to Linux) usually operates on the FDT, unless explicitly
configured to unflatten the tree. That later option is not enabled by
default.

The reason for that is so that the DT can be accessed very early on, at
which point there may not be any other memory available than a very
limited stack and the FDT blob can still be located in some read-only
memory.

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
