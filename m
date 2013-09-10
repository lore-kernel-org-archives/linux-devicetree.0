From: Rob Herring <robherring2@gmail.com>
Subject: Re: [GIT PULL] Device tree updates for v3.12
Date: Tue, 10 Sep 2013 17:06:39 -0500
Message-ID: <522F97EF.5050303@gmail.com>
References: <CACxGe6v8hO4sRX_KGcH=YBAMrF8mQHqWdxXEvVwoC2pVS5Yv9Q@mail.gmail.com> <CA+bK7J5cAWFPLTBR2afNLm2JaKFH4_dJO_NpVL5gom0iX+L2dQ@mail.gmail.com> <CA+55aFzBbKXJnaG_6X8Fff_APGJ3EkbG0thsbithDXtiEJjdHA@mail.gmail.com> <CA+bK7J4F=X97HUQP6Tt8RkVe5vttE_Sw4Pd7kT19k_KGDFfpKA@mail.gmail.com> <CA+55aFwkAQGRo9mLa2GVeVgzToRZr=Ny8LTogzgOpO6_4BJY1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwkAQGRo9mLa2GVeVgzToRZr=Ny8LTogzgOpO6_4BJY1Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Tim Bird <tbird20d@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anton Blanchard <anton@samba.org>
List-Id: devicetree@vger.kernel.org

On 09/10/2013 04:44 PM, Linus Torvalds wrote:
> On Tue, Sep 10, 2013 at 2:39 PM, Tim Bird <tbird20d@gmail.com> wrote:
>>
>> Well, I'm not sure how many bits of randomness this will add anyway.
>> The way we're using device tree, we get the same values every boot, on
>> all instances of the same phone model.  So this seems of little value.
> 
> If I recall correctly, somebody said that things like ethernet MAC
> addresses etc sometimes come from DT. Is my memory going, or is that
> true but very rare?

It is true and fairly common. You can also have serial numbers in the
DT, but that is more rare. The bootloader will also add the kernel
command line, initrd start and end addresses.

Rob
