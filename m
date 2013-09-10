From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Device tree updates for v3.12
Date: Tue, 10 Sep 2013 14:44:56 -0700
Message-ID: <CA+55aFwkAQGRo9mLa2GVeVgzToRZr=Ny8LTogzgOpO6_4BJY1Q@mail.gmail.com>
References: <CACxGe6v8hO4sRX_KGcH=YBAMrF8mQHqWdxXEvVwoC2pVS5Yv9Q@mail.gmail.com>
	<CA+bK7J5cAWFPLTBR2afNLm2JaKFH4_dJO_NpVL5gom0iX+L2dQ@mail.gmail.com>
	<CA+55aFzBbKXJnaG_6X8Fff_APGJ3EkbG0thsbithDXtiEJjdHA@mail.gmail.com>
	<CA+bK7J4F=X97HUQP6Tt8RkVe5vttE_Sw4Pd7kT19k_KGDFfpKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+bK7J4F=X97HUQP6Tt8RkVe5vttE_Sw4Pd7kT19k_KGDFfpKA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tim Bird <tbird20d@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anton Blanchard <anton@samba.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2013 at 2:39 PM, Tim Bird <tbird20d@gmail.com> wrote:
>
> Well, I'm not sure how many bits of randomness this will add anyway.
> The way we're using device tree, we get the same values every boot, on
> all instances of the same phone model.  So this seems of little value.

If I recall correctly, somebody said that things like ethernet MAC
addresses etc sometimes come from DT. Is my memory going, or is that
true but very rare?

            Linus
