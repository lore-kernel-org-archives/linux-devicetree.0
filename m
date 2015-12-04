From: Mitchel Humpherys <mitchelh@codeaurora.org>
Subject: Re: [PATCH] of: Fix comparison of reserved memory regions
Date: Fri, 04 Dec 2015 09:07:39 -0800
Message-ID: <vnkwk2oum9b8.fsf@codeaurora.org>
References: <1447843598-9355-1-git-send-email-mpe@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447843598-9355-1-git-send-email-mpe@ellerman.id.au> (Michael
	Ellerman's message of "Wed, 18 Nov 2015 21:46:38 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, frowand.list@gmail.com, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 18 2015 at 09:46:38 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> In order to check for overlapping reserved memory regions, we first need
> to sort the array of memory regions. This is implemented using sort(),
> and a custom comparison function __rmem_cmp().
>
> Unfortunatley __rmem_cmp() doesn't work in all cases. Because the two
> base values are phys_addr_t, they may be u64 on some platforms, in which
> case subtracting one from the other and then (implicitly) casting to int
> does not give us the -ve/0/+ve value we need.
>
> This leads to incorrect reports about overlaps, eg:
>
>   ibm,slw-image@1ffe600000 (0x0000001ffe600000--0x0000001ffe700000) overlaps with
>   ibm,firmware-allocs-memory@1000000000 (0x0000001000000000--0x0000001000dc0200)
>
> Fix it by just doing the standard double if and return 0 logic.
>
> Fixes: ae1add247bf8 ("of: Check for overlap in reserved memory regions")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  drivers/of/of_reserved_mem.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Woops, thanks.

Tested-by: Mitchel Humpherys <mitchelh@codeaurora.org>

-Mitch

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
