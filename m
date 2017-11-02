From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 3/7] MIPS: Octeon: Add a global resource manager.
Date: Thu, 2 Nov 2017 13:23:27 +0100
Message-ID: <20171102122327.GE4772@lunn.ch>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-4-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171102003606.19913-4-david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> +static void res_mgr_lock(void)
> +{
> +	unsigned int tmp;
> +	u64 lock = (u64)&res_mgr_info->rlock;
> +
> +	__asm__ __volatile__(
> +		".set noreorder\n"
> +		"1: ll   %[tmp], 0(%[addr])\n"
> +		"   bnez %[tmp], 1b\n"
> +		"   li   %[tmp], 1\n"
> +		"   sc   %[tmp], 0(%[addr])\n"
> +		"   beqz %[tmp], 1b\n"
> +		"   nop\n"
> +		".set reorder\n" :
> +		[tmp] "=&r"(tmp) :
> +		[addr] "r"(lock) :
> +		"memory");
> +}
> +
> +static void res_mgr_unlock(void)
> +{
> +	u64 lock = (u64)&res_mgr_info->rlock;
> +
> +	/* Wait until all resource operations finish before unlocking. */
> +	mb();
> +	__asm__ __volatile__(
> +		"sw $0, 0(%[addr])\n" : :
> +		[addr] "r"(lock) :
> +		"memory");
> +
> +	/* Force a write buffer flush. */
> +	mb();
> +}

It would be good to add some justification for using your own locks,
rather than standard linux locks.

Is there anything specific to your hardware in this resource manager?
I'm just wondering if this should be generic, put somewhere in lib. Or
maybe there is already something generic, and you should be using it,
not re-inventing the wheel again.

      Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
