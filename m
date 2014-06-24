From: Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: Add PMU node for APM X-Gene Storm SOC
Date: Mon, 23 Jun 2014 23:42:00 -0400
Message-ID: <53A8F388.80101@redhat.com>
References: <1395308847-16317-1-git-send-email-vkale@apm.com>	<1395308847-16317-3-git-send-email-vkale@apm.com> <CACVXFVMiOvV=CytiaLFgEdt3_f7frJ6afjz39iLhafOhvJ0m7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACVXFVMiOvV=CytiaLFgEdt3_f7frJ6afjz39iLhafOhvJ0m7g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ming Lei <ming.lei-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/23/2014 10:47 PM, Ming Lei wrote:

> On Thu, Mar 20, 2014 at 5:47 PM, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org> wrote:
>> This patch adds the PMU device tree node for APM X-Gene Storm SOC.
>>
>> Please note that this patch has dependancy on a GIC driver patch [1] which is
>> yet to be approved by maintainers.
>>
>> [1]- https://lkml.org/lkml/2014/2/27/605
>> (irqchip:gic: change access of gicc_ctrl register to read modify write)

> No matter if Feng Kan's gic patch is applied or not, perf(PMU)
> still can't work well with your patch, and the failure[1] will be
> triggered when 'perf top' is started.
> 
> The failure happened during the 1st pmu overflow interrupt.
> 
> I test several mustang boards, and all has the problem with
> upstream kernel.

Note that the GIC bypass register config is set by the firmware and this
only preserves the original setting, so you could be running an older
firmware (such as U-Boot). On our (UEFI-enabled systems, complete with
correct patch) perf top runs correctly without any such problems.

Jon.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
