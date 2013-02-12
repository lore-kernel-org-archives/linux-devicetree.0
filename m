From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drm/exynos: Add device tree based discovery
 support for G2D
Date: Tue, 12 Feb 2013 22:57:41 +0900
Message-ID: <CAAQKjZMcmhb7djsSgRHFvVujq6TDTwDgkH=SzVVYOdegKa-tMQ@mail.gmail.com>
References: <1360128584-23167-1-git-send-email-sachin.kamat@linaro.org>
 <1360128584-23167-2-git-send-email-sachin.kamat@linaro.org>
 <CAAQKjZNmUVZnDcy3fbWkairnneOK7dooJT2gn=9++tzS=uhhzA@mail.gmail.com>
 <511A4442.6000402@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <511A4442.6000402-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

2013/2/12 Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
> On 02/12/2013 02:17 PM, Inki Dae wrote:
>> Applied and will go to -next.
>> And please post the document(in
>> Documentation/devicetree/bindings/gpu/) for it later.
>
> There is already some old patch applied in the devicetree/next tree:
>
> http://git.secretlab.ca/?p=linux.git;a=commitdiff;h=09495dda6a62c74b13412a63528093910ef80edd
>
> I guess there is now an incremental patch needed for this.
>

I think that this patch should be reverted because the compatible
string of this document isn't generic and also the document file
should be moved into proper place(.../bindings/gpu/).

So Mr. Grant, could you please revert the below patch?
        "of/exynos_g2d: Add Bindings for exynos G2D driver"
        commit: 09495dda6a62c74b13412a63528093910ef80edd

This document should be modifed correctly and re-posted. For this, we
have already reached an arrangement with other Exynos maintainters.

Thanks,
Inki Dae

>
> Regards,
> Sylwester
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
