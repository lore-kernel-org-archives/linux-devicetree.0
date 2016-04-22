From: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 7/7] arm64/perf: Add Broadcom Vulcan PMU support
Date: Fri, 22 Apr 2016 16:49:17 +0530
Message-ID: <CAKc_7PXng0zjbfm_w9=p+HKc693Mc50A439v2GRH1j9WC-cvdQ@mail.gmail.com>
References: <1461243525-13603-1-git-send-email-ashoks@broadcom.com>
 <1461243525-13603-8-git-send-email-ashoks@broadcom.com> <20160421135450.GO6879@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160421135450.GO6879@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 21, 2016 at 7:24 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Thu, Apr 21, 2016 at 05:58:45AM -0700, Ashok Kumar wrote:
>> +static int armv8_vulcan_pmu_init(struct arm_pmu *cpu_pmu)
>> +{
>> +     armv8_pmu_init(cpu_pmu);
>> +     cpu_pmu->name                   = "armv8_brcm_vulcan";
>
> Are we happy with "brcm" being the exposed userspace name? It might be
> better to have this as "armv8_broadcom_vulcan".

Broadcom uses "brcm" as the vendor prefix in device trees, and the
cpu's compatible string is "brcm,vulcan", so this should be ok.

It looks like the A53 and A57 entries have established a convention of
calling the PMU  "armv8_<cpuname>". Otherwise, something very close
to the PMU's OF compatible string would have been better here.

> I'll leave that to you and Will. Either way:
>
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

If needed:

Acked-by: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

for the Broadcom Vulcan related changes in the whole series.

JC.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
