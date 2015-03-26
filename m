From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 2/7] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Thu, 26 Mar 2015 11:58:05 +0000
Message-ID: <5513F44D.1060405@arm.com>
References: <1425466367-30556-1-git-send-email-vincent.yang@socionext.com> <1425466884-30648-1-git-send-email-vincent.yang@socionext.com> <5513F0D9.5080807@arm.com> <20150326114955.GE8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150326114955.GE8656-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <vincent.cw.yang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <vincent.yang-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 26/03/15 11:49, Russell King - ARM Linux wrote:
> On Thu, Mar 26, 2015 at 11:43:21AM +0000, Sudeep Holla wrote:
>> I tried using this driver and found that AMBA driver expects apb_clk
>> without which probe fails. Though your example have it, it's not
>> explicit from the binding. Also AMBA binding expects the primecell id in
>> the binding.
>
> That's optional:
>
> Optional properties:
>
> - arm,primecell-periphid : Value to override the h/w value with
>
> It's only required when the hardware doesn't provide the correct value.
>

Ah sorry my bad, I meant the compatible(somehow left this word at the
end of earlier email - it should have been" .. AMBA binding expects the
primecell id in the binding compatible")

- compatible : should be a specific name for the peripheral and
	"arm,primecell". The specific name will match the ARM
	engineering name for the logic block in the form: "arm,pl???"

So I wanted to make sure either we follow that here(unlikely as ARM is
not publishing this as standard primecell yet) or specify that it's
exception here.

Regards,
Sudeep

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
