From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 01/15] ARM: dts: alpine: fix PCIe node name
Date: Fri, 24 Mar 2017 18:00:30 +0100
Message-ID: <CAK8P3a2WOeNrz3J8vO+n+rhwn3N_vdOswZ0NMmYrdNvmkD8obQ@mail.gmail.com>
References: <20170322020313.24338-1-robh@kernel.org> <20170322080137.st3osq5ckfis6uwz@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170322080137.st3osq5ckfis6uwz@kwain>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tsahee Zidenberg <tsahee-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 9:01 AM, Antoine Tenart
<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi Rob,
>
> On Tue, Mar 21, 2017 at 09:02:59PM -0500, Rob Herring wrote:
>> PCIe bridges should have a node name of 'pcie'.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Acked-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>
> This can go through arm-soc directly. If not I'll take it.
> Thanks!

I have a mild preference for this kind of patch to get picked up by
platform maintainers.

Rob, once replies stop coming in, please send a pull request for anything
that did not get picked up by anyone else.

     Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
