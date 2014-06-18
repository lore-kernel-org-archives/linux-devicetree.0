From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 1/7] mfd: axp20x: add AXP221 PMIC support
Date: Wed, 18 Jun 2014 10:46:58 +0200
Message-ID: <53A15202.1070908@free-electrons.com>
References: <1402990723-28138-1-git-send-email-boris.brezillon@free-electrons.com> <1402990723-28138-2-git-send-email-boris.brezillon@free-electrons.com> <20140618083605.GQ21030@lee--X1>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBBBFEQWOQKGQEUYHSK2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140618083605.GQ21030@lee--X1>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 18/06/2014 10:36, Lee Jones wrote:
> On Tue, 17 Jun 2014, Boris BREZILLON wrote:
>
>> Add support for the AXP221 PMIC device to the existing AXP20x driver.
>>
>> The AXP221 defines a new set of registers, power supplies and regulators,
>> but most of the API is similar to the AXP20x ones.
>> The AXP20x irq chip definition is reused, though some interrupts are not
>> available in the AXP221.
>>
>> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>  drivers/mfd/axp20x.c       | 64 ++++++++++++++++++++++++++++++++++++++++++----
>>  include/linux/mfd/axp20x.h | 56 ++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 115 insertions(+), 5 deletions(-)
> Looks good to me now.
>   Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Can this go in independently to the other patches in the set?

Yes, as long as no one define an axp221 node in his DT.
In this case axp221 regulators would be considered as axp20x ones (which
might be a bit problematic), because axp20x-regulator driver does not
test the axp variant before probing its regulators (this test is
introduced in patch 3).

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
