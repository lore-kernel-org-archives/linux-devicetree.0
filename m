From: Mylene JOSSERAND <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/4] Sunxi: Add SMP support on A83T
Date: Fri, 29 Dec 2017 12:04:24 +0100
Message-ID: <20171229120424.01adcc37@dell-desktop.home>
References: <20171211075001.6100-1-mylene.josserand@free-electrons.com>
        <20171211193534.GA3967@Red>
        <20171212082425.iv37nrpotbb33vh6@flea.lan>
        <20171215061046.GA9845@Red>
        <20171227160729.4509bec5@dell-desktop.home>
        <20171228203125.GB18393@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171228203125.GB18393@Red>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Corentin,

Le Thu, 28 Dec 2017 21:31:25 +0100,
Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a écrit :

[...]

> Hello
> 
> With the .config that you give me in private, everything seems to work.
> But with mine, the stacktrace still happen.
> After some research, this is due to the following code:
> cpumask_set_cpu(get_cpu(), &cci_pmu->cpus);
> which disable preemption (via get_cpu())
> 
> So it is unrelated with your patch, I will send a bug report tomorow.

Okay, great to know that it is not related to my patches.

> 
> Furthermore, you can add:
> Tested-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks, I have just sent a V2. I did not add your tested-by because
I have done some modifications. Could you test this new series and give
me your tested-by again? It would be great!

Thank you in advance,

Best regards,

Mylène

-- 
Mylène Josserand, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
