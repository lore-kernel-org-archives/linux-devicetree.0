From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 0/3] edac: xgene: Add missing SoC register bus error
 handling and fix CE promotes to UE
Date: Sat, 23 Jan 2016 15:34:15 +0100
Message-ID: <20160123143415.GD16329@pd.tnic>
References: <1453495625-28006-1-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453495625-28006-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 22, 2016 at 01:47:02PM -0700, Loc Ho wrote:
> Add missing register bus error handling for SoC and fix an checking
> condition for CE error promotes to UE. DT binding and documentation are
> also updated.
> 
> v3:
> * Move the regmap-rb property back to the required section.
> * Fix typo in documentation and comment code
> 
> v2:
> * Make the register bus resource optional
> * Update DT binding accordinlgy
> 
> ---
> Loc Ho (3):
>   Documentation: Update the APM X-Gene SoC EDAC DTS binding for missing
>     RB
>   edac: xgene: Add missing SoC register bus error handling and fix CE
>     promotes to UE
>   arm64: Update the APM X-Gene EDAC node with the RB register resource
> 
>  .../devicetree/bindings/edac/apm-xgene-edac.txt    |   10 +++
>  arch/arm64/boot/dts/apm/apm-storm.dtsi             |    6 ++
>  drivers/edac/xgene_edac.c                          |   70 +++++++++++++++++++-
>  3 files changed, 85 insertions(+), 1 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
