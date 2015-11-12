From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] of: Check for overlap in reserved memory regions
Date: Thu, 12 Nov 2015 13:19:59 +1100
Message-ID: <1447294799.29472.15.camel@ellerman.id.au>
References: <1442367036-15205-1-git-send-email-mitchelh@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442367036-15205-1-git-send-email-mitchelh@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mitchel Humpherys <mitchelh@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-09-15 at 18:30 -0700, Mitchel Humpherys wrote:

> Any overlap in the reserved memory regions (those specified in the
> reserved-memory DT node) is a bug.

Can you expand a bit on why you think it's a bug? I assume it was discussed at
some point on the list but I didn't see it sorry.

There's nothing I can see in the binding document[1] about whether regions can
overlap, or what it would mean if they did.

If we want to declare that overlapping regions are always a bug then there
should be some text in the binding explaining that. There's also the
possibility that we have existing device trees in the wild that contain
overlapping regions, and whether we think it's OK to retrospectively declare
that they're incorrect.

cheers

[1]: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
