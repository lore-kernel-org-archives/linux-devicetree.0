From: Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 5/5] arm: exynos: Add MCPM call-back functions
Date: Mon, 5 May 2014 21:56:38 +0530
Message-ID: <CAM4voakV70=7S+nWoXDGg15JU5ig_Gkp8_o-rhZ0cBX4G4wnxQ@mail.gmail.com>
References: <1398528348-21214-6-git-send-email-a.kesavan@samsung.com>
	<1399044359-15784-1-git-send-email-a.kesavan@samsung.com>
	<alpine.LFD.2.11.1405021347500.980@knanqh.ubzr>
	<CAL1qeaHrP+i4EhOQKkSX7xFNyiyBiBfpsV3B0EHCFcrNzc6KLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaHrP+i4EhOQKkSX7xFNyiyBiBfpsV3B0EHCFcrNzc6KLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thomas P Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Fri, May 2, 2014 at 11:53 PM, Andrew Bresticker
<abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>> +     /*
>>> +      * TODO: Turn off the clusters when all cores in the cluster
>>> +      * are down to achieve significant power savings.
>>> +      */
>>
>> This comment should actually be located right after the
>> "if (exynos_cluster_unused(cluster))" above.  That is where the cluster
>> control should be applied, assuming it'll be effective only when WFI is
>> executed.
>
> Correct me if I'm wrong Samsung folks, but I thought it was not
> possible to apply cluster power control from a CPU within the cluster
> being powered down, i.e. a CPU in the other cluster must be the one to
> apply the cluster power control to power down the outbound cluster.
I was under the same impression until quite recently. However, based
on inputs from the hardware team, there are bits available (in the
*COMMON_OPTION register) that ensure "ARM_CORE0~3 are turned off
earlier and then ARM_COMMON_L2 is turned off finally". This allows us
to turn off the cluster from a cpu of the same cluster. We have used
these bits in our cluster power down cpuidle state implementation as
well.


Regards,
Abhilash
>
> -Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
