From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 20 Jan 2015 16:24:00 +0100
Message-ID: <CAMuHMdWnjawtgkKGuL8b4A17EhDS6B0L-1_uhSnvEXXk5dNjwQ@mail.gmail.com>
References: <1421764441-11928-1-git-send-email-pantelis.antoniou@konsulko.com>
	<CAL_JsqLVJjq3Ov=J-5LtXiTQPLvR5Y=+tB1i16k_rN3j5dODFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLVJjq3Ov=J-5LtXiTQPLvR5Y=+tB1i16k_rN3j5dODFQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@secretlab.ca>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 20, 2015 at 3:47 PM, Rob Herring <robherring2@gmail.com> wrote:
>> +       Examples:
>> +
>> +       %pO     /foo/bar@0              - Node full name
>> +       %pO0    /foo/bar@0              - Same as above
>> +       %pO1    /foo/bar@0[10]          - Node full name + phandle
>> +       %pO2    /foo/bar@0[10:DdPB]     - Node full name + phandle + node flags
>> +                                        D - dynamic
>> +                                        d - detached
>> +                                        P - Populated
>> +                                        B - Populated bus
>
> We should think about what else we want to print for a node. Perhaps
> 'On' for name, 'Oc' for compatible, etc.

I was just going to say "The least verbose variant is name, not full_name".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
