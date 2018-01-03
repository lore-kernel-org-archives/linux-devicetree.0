From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] dt: psci: Update DT bindings to support hierarchical
 PSCI states
Date: Wed, 3 Jan 2018 13:42:32 -0600
Message-ID: <20180103194232.nsa2tko6nooybkuj@rob-hp-laptop>
References: <1514472037-25969-1-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1514472037-25969-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Brendan Jackman <Brendan.Jackman-5wv7dgnIgG8@public.gmane.org>, Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 28, 2017 at 03:40:37PM +0100, Ulf Hansson wrote:
> From: Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Update DT bindings to represent hierarchical CPU and CPU domain idle states
> for PSCI. Also update the PSCI examples to clearly show how flattened and
> hierarchical idle states can be represented in DT.
> 
> Signed-off-by: Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> 
> Changes in v2:
> 	- Addressed comments from Rob.
> 	- Updated some labels in the examples to get more consistency.
> 
> For your information, I have picked up the work from Lina Iyer around the so
> called CPU cluster idling series [1,2] and I working on new versions. However,
> I decided to post the updates to the PSCI DT bindings first, as they will be
> needed to be agreed upon before further changes can be done to the PSCI firmware
> driver.
> 
> Note, these bindings have been discussed over and over again, at LKML, but
> especially also at various Linux conferences, like LPC and Linaro Connect. We
> finally came to a conclusion and the changes we agreed upon, should be reflected
> in this update.
> 
> Of course, it's a while ago since the latest discussions, but hopefully people
> don't have too hard time to remember.
> 
> Kind regards
> Uffe
> 
> [1]
> https://www.spinics.net/lists/arm-kernel/msg566200.html
> 
> [2]
> https://lwn.net/Articles/716300/
> 
> ---
>  Documentation/devicetree/bindings/arm/psci.txt | 152 +++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I'd like to see some R-by by some of the ARM folks too.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
