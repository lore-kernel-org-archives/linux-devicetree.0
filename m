From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 0/6] Krait L1/L2 EDAC driver
Date: Mon, 06 Jan 2014 14:09:48 -0800
Message-ID: <52CB29AC.8070406@codeaurora.org>
References: <1388434457-4194-1-git-send-email-sboyd@codeaurora.org> <20140104101901.GA4439@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140104101901.GA4439-K5JNixvcfoxupOikMc4+xw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Stepan Moskovchenko <stepanm-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/04/14 02:19, Borislav Petkov wrote:
> On Mon, Dec 30, 2013 at 12:14:11PM -0800, Stephen Boyd wrote:
>> This patchset adds support for the Krait L1/L2 cache error detection
>> hardware. The first patch fixes a generic framework bug. The next
>> two patches lay the groundwork for this driver to be added by 
>> exporting percpu irq functions as well as adding the Krait l2 indirection
>> register code. The next two patches add the driver and the binding and 
>> the final patch hooks it all up by adding the device tree node.
>>
>> I'm not sure which tree this is supposed to go through. Ideally we could
>> send the first 3 plus the 5th one through an edac tree.
> Sure, I can take a look at the drivers/edac/ changes but I'd need an ack
> for the arch/arm/ stuff before/if I pick it up, i.e. patch 3.

Ok great. Perhaps Russell King or Mark Rutland can ack the arch/arm patch.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
