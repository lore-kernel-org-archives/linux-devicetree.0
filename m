From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v2 1/3] Documentation: Update the APM X-Gene SoC EDAC DTS
 binding for missing RB
Date: Wed, 20 Jan 2016 15:14:07 -0800
Message-ID: <CAPw-ZT=ThVjyTtOrs3GSukrsvasbokk1p3XT24sZxXBP5MS0PQ@mail.gmail.com>
References: <1453250812-15097-1-git-send-email-lho@apm.com>
	<1453250812-15097-2-git-send-email-lho@apm.com>
	<20160120183543.GK23186@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160120183543.GK23186-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-edac <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 20, 2016 at 10:35 AM, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org> wrote:
> On Tue, Jan 19, 2016 at 05:46:50PM -0700, Loc Ho wrote:
>>  This patch updates the APM X-Gene SoC EDAC documentation binding to
>>  reference the missing register bus for the the SoC EDAC.
>>
>>  Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
>>  ---
>>   .../devicetree/bindings/edac/apm-xgene-edac.txt    |   12 ++++++++++++
>>   1 files changed, 12 insertions(+), 0 deletions(-)
>>
>>  diff --git a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
>>  index 78e2a31..17b29af 100644
>>  --- a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
>>  +++ b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
>>  @@ -20,6 +20,12 @@ Required properties:
>>   - interrupts            : Interrupt-specifier for MCU, PMD, L3, or SoC error
>>                         IRQ(s).
>>
>>  +Optional property:
>>  +- regmap-rb         : Regmap of the register bus resource. This properity
>>  +                      is optional only for compatibility. If the RB
>>  +                      erorr conditions are not cleared, it will
>
> s/erorr/error/
>
> Please integrate a spellchecker into your patch creation workflow.

I will integrate aspell into the patch creation workflow and shoot for
an update version sometime this Friday.

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
