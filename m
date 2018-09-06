From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 18/21] edac: cpc925: use for_each_of_cpu_node iterator
Date: Thu, 6 Sep 2018 06:12:51 -0500
Message-ID: <CAL_JsqKNh+89dRef3RNx1YUfhD0yJ8BHsanUaGMfrF_EGPCHcA@mail.gmail.com>
References: <20180905193738.19325-1-robh@kernel.org> <20180905193738.19325-19-robh@kernel.org>
 <20180906083506.GA10768@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906083506.GA10768@zn.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 6, 2018 at 3:35 AM Borislav Petkov <bp@alien8.de> wrote:
>
> On Wed, Sep 05, 2018 at 02:37:35PM -0500, Rob Herring wrote:
> > Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
> > has the side effect of defaulting to iterating using "cpu" node names in
> > preference to the deprecated (for FDT) device_type == "cpu".
> >
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: linux-edac@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Please ack and I will take via the DT tree. This is dependent on the
> > first 2 patches.
>
> Completely unknown territory for me so I'd trust your judgement. Staring
> at 1/21, the conversion looks ok except the removal of those prints that
> a cpu nodes are not present - I wonder if they even meant anything or
> were just there during driver development...

I should have noted this. It's not the kernel's job to validate the DT
and certainly not some driver's job to validate cpu nodes. It's bad
enough that some random driver is parsing cpu nodes. If they are
missing or are crap, you should get warnings or messages well before
this point.

Rob
