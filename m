From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: pinctrl: Deprecate sunxi pinctrl bindings
Date: Tue, 25 Oct 2016 14:07:27 +0200
Message-ID: <CACRpkdYGYPhPZQmgeLA-K-RQKZMLy1qHY6P7LS6SKsFC=d=MHg@mail.gmail.com>
References: <cover.f893b02a9f816dad8fad3986672b05c4b211e2b1.1476971126.git-series.maxime.ripard@free-electrons.com>
 <6aec73cd3b9d3dbf1085d042ec6c23f385a300de.1476971126.git-series.maxime.ripard@free-electrons.com>
 <CACRpkdb7zs7Nhs3i1o=WUt787vJCuePre3Tj3wLu++qwpO0atQ@mail.gmail.com> <20161024194917.g5oezqc4uacsyt24@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161024194917.g5oezqc4uacsyt24@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 24, 2016 at 9:49 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> However, it looks like the first patch from this serie is missing from
> your tree, is there a reason for that?

No can you point it out?

> Also, in order to preserve bisectability, could you create an
> immutable branch for those sunxi patches so that I can merge the DT
> bits?

It's too late because they are already in the devel branch
and mixed up with merged of *other* immutable stuff.

However I think it is plain wrong to try to keep any bisectability
between the kernel at large and arch/*/boot/dts/*, because
the DTS stuff is supposed to at some point be maintained outside
of the kernel and for all OSes, they simply shouldn't be sync:ed.

Yours,
Linus Walleij
