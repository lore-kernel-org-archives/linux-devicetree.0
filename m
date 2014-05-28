MIME-Version: 1.0
In-Reply-To: <1401301204-12834-1-git-send-email-sudeep.holla@arm.com>
References: <1401301204-12834-1-git-send-email-sudeep.holla@arm.com>
Date: Wed, 28 May 2014 13:45:32 -0500
Message-ID: <CAL_JsqLvseiwokJTAUZc=5SSz5RjEk8ouoWHoHphe6h0hr-eeg@mail.gmail.com>
Subject: Re: [PATCH] of: return -ENOSYS instead of -EINVAL in stub implementations
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, May 28, 2014 at 1:20 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> From: Sudeep Holla <sudeep.holla@arm.com>
>
> Currently the stub implementation(when !CONFIG_OF) of few of_* helpers
> return -EINVAL. This makes it difficult to distinguish between the
> function not being implemented and the function returning error due to
> invalid parameters.
>
> This patch replaces -EINVAL with -ENOSYS in the stub implementations
> of those of_* helpers.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  include/linux/of_address.h | 2 +-
>  include/linux/of_iommu.h   | 2 +-
>  include/linux/of_irq.h     | 2 +-
>  include/linux/of_pci.h     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> Hi,
>
> This was identified on one of the patch review on LKML[1].
> Looking into the of_* helpers revealed few such instances.

I don't see the problem. In the !OF case, of_node_get will always be NULL, so the return code does not matter because the whole if statement is dead code.

I'm not wholesale changing return codes unless there is a real problem.

Rob
