From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] ARM: psci: keystone: remove keystone_smp_ops code if
 psci is supported
Date: Wed, 1 Jul 2015 15:12:12 +0100
Message-ID: <20150701141211.GK7557@n2100.arm.linux.org.uk>
References: <1435752784-30639-1-git-send-email-vitalya@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1435752784-30639-1-git-send-email-vitalya-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vitaly Andrianov <vitalya-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 01, 2015 at 08:13:03AM -0400, Vitaly Andrianov wrote:
> If we enable psci support we don't need keystone_smp_ops anymore.
> 
> Signed-off-by: Vitaly Andrianov <vitalya-l0cyMroinI0@public.gmane.org>

However, this is not necessary.  If you look at arch/arm/kernel/setup.c,
it contains this:

        psci_init();
#ifdef CONFIG_SMP
        if (is_smp()) {
                if (!mdesc->smp_init || !mdesc->smp_init()) {
                        if (psci_smp_available())
                                smp_set_ops(&psci_smp_ops);
                        else if (mdesc->smp)
                                smp_set_ops(mdesc->smp);
                }
                smp_init_cpus();
                smp_build_mpidr_hash();
        }
#endif

So, the platforms' SMP ops won't be used even if they're provided
when PSCI is available.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
