From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 20 Jan 2015 09:59:54 -0800
Message-ID: <1421776794.2724.1.camel@perches.com>
References: <1421764441-11928-1-git-send-email-pantelis.antoniou@konsulko.com>
	 <CAL_JsqLVJjq3Ov=J-5LtXiTQPLvR5Y=+tB1i16k_rN3j5dODFQ@mail.gmail.com>
	 <E7065DB3-DD6B-4110-A066-8C7268186831@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <E7065DB3-DD6B-4110-A066-8C7268186831@konsulko.com>
Sender: linux-doc-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@secretlab.ca>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-01-20 at 16:52 +0200, Pantelis Antoniou wrote:
> Hi Rob,
> 
> > On Jan 20, 2015, at 16:47 , Rob Herring <robherring2@gmail.com> wrote:
> > 
> > On Tue, Jan 20, 2015 at 8:34 AM, Pantelis Antoniou
> > <pantelis.antoniou@konsulko.com> wrote:
> >> 90% of the usage of device node's full_name is printing it out
> >> in a kernel message. Preparing for the eventual delayed allocation
> >> introduce a custom printk format specifier that is both more
> >> compact and more pleasant to the eye.
[]
> >> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
[]
> >> +Device tree nodes:
> >> +
> >> +       %pO{,1,2}
> > 
> > 'O' is not very obvious, but I imagine we are somewhat limted in our
> > choice here?
> > 
> 
> All the good women are married, all the handsome men are gay, all the obvious
> format specifiers are taken.

Not really at all.

I quite dislike '0' as the format type specifier for
a device tree node as there's no mnemonic mapping.



