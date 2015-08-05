From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: [PATCH v3 0/2] Add display timing for Okaya RS800480T-7X0
Date: Wed, 5 Aug 2015 10:42:40 +0200
Message-ID: <CAAMH-ysZ_g1X3eNuB43vYoqSvg01DE38_hcTEa+iWxTxdMtpaA@mail.gmail.com>
References: <1432827466-8104-1-git-send-email-gary.bisson@boundarydevices.com>
	<1433954663-31444-1-git-send-email-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433954663-31444-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

On Wed, Jun 10, 2015 at 6:44 PM, Gary Bisson
<gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> Hi all,
>
> This patch is the follow-up of a request from Philipp to add the Okaya display
> to the simple panel driver.
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-May/346657.html
>
> v2:
> - split into 2 patches, adding Okaya to the vendor prefixes should be its own
> patch as suggested by Thierry
> https://patchwork.kernel.org/patch/6503261/
>
> v3:
> - add poweron/poweroff sequencing delays as suggested by Philipp. Values are
> based on datasheet available at:
> http://boundarydevices.com/datasheets/RS800480T-7X0GP-A.pdf

Now that Philipp's change that fixes the drm_panel support in the
parallel-display has been merged, would it be ok to merge the okaya
timings?
http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=553a59fc

Regards,
Gary
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
