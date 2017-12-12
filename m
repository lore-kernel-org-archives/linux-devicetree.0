From: Mylene JOSSERAND <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/4] Sunxi: Add SMP support on A83T
Date: Tue, 12 Dec 2017 11:01:41 +0100
Message-ID: <20171212110141.19892b79@dell-desktop.home>
References: <20171211075001.6100-1-mylene.josserand@free-electrons.com>
        <20171211193534.GA3967@Red>
        <20171212104025.0bba3685@dell-desktop.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212104025.0bba3685-K8i4uRanGBt8XcdJbWeDu7NAH6kLmebB@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le Tue, 12 Dec 2017 10:40:25 +0100,
Mylene JOSSERAND <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> a écrit :

[...]

> I have done further tests.
> 
> I booted a previous kernel that I know it was working fine (kernel
> v4.13) then, I booted the kernel with this series and it worked just
> fine.
> 
> Only after a power cycle, I am able to reproduce the error, otherwise,
> it is working well. See the boot log of this two tests:
> http://code.bulix.org/7kr0e0-239697?raw

I wrote this mail too fast, I am wrong, the error I had/copied is not
the same error than Corentin is having (and I have 8 CPUS up).

-- 
Mylène Josserand, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
