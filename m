From: Mitchel Humpherys <mitchelh@codeaurora.org>
Subject: Re: [PATCH v2] of: Check for overlap in reserved memory regions
Date: Fri, 04 Dec 2015 09:27:50 -0800
Message-ID: <vnkwy4daktt5.fsf@codeaurora.org>
References: <1442367036-15205-1-git-send-email-mitchelh@codeaurora.org>
	<1447294799.29472.15.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447294799.29472.15.camel@ellerman.id.au> (Michael Ellerman's
	message of "Thu, 12 Nov 2015 13:19:59 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 12 2015 at 01:19:59 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> On Tue, 2015-09-15 at 18:30 -0700, Mitchel Humpherys wrote:
>
>> Any overlap in the reserved memory regions (those specified in the
>> reserved-memory DT node) is a bug.
>
> Can you expand a bit on why you think it's a bug? I assume it was discussed at
> some point on the list but I didn't see it sorry.

The reason I think it's a bug is because the overlapping memory could be
handed out to multiple firmwares, which generally ends in "random"
firmware crashes.  We've found by sad experience that root-causing such
a crash can be quite difficult.

Is there a valid use case for overlapping regions?  I can't think of
one...

> There's nothing I can see in the binding document[1] about whether regions can
> overlap, or what it would mean if they did.

You're right, the bindings document doesn't say anything about
overlapping memory regions.  I can submit something unless someone comes
up with a reason why we should allow overlapping memory regions.

> If we want to declare that overlapping regions are always a bug then there
> should be some text in the binding explaining that. There's also the
> possibility that we have existing device trees in the wild that contain
> overlapping regions, and whether we think it's OK to retrospectively declare
> that they're incorrect.

I did a quick survey of in-tree users of reserved-memory and couldn't
find any overlapping regions.


-Mitch

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
