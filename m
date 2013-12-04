From: Meelis Roos <mroos-Y27EyoLml9s@public.gmane.org>
Subject: Re: [PATCH v2] OF: base: match each node compatible against all
 given matches first
Date: Wed, 4 Dec 2013 15:08:39 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1312041506010.8902@math.ut.ee>
References: <1385663785-8643-1-git-send-email-sebastian.hesselbarth@gmail.com> <1386078720-8756-1-git-send-email-sebastian.hesselbarth@gmail.com> <alpine.SOC.1.00.1312032210480.25191@math.ut.ee> <529E614B.3070307@gmail.com>
 <20131204094010.GO19943@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131204094010.GO19943-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> I added Meelis on Cc because he found a regression with my original
> proposal (107a84e61cdd "of: match by compatible property first"). That
> got later reverted in commit bc51b0c22ceb (Revert "of: match by
> compatible property first"). Here's the commit message for reference:
> 
> commit bc51b0c22ceb
> Author: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> Date:   Tue Jul 10 12:49:32 2012 -0700
> 
>     Revert "of: match by compatible property first"
> 
>     This reverts commit 107a84e61cdd3406c842a0e4be7efffd3a05dba6.
> 
>     Meelis Roos reports a regression since 3.5-rc5 that stops Sun Fire V100
>     and Sun Netra X1 sparc64 machines from booting, hanging after enabling
>     serial console.  He bisected it to commit 107a84e61cdd.
> 
>     Rob Herring explains:
>      "The problem is match combinations of compatible plus name and/or type
>       fail to match correctly.  I have a fix for this, but given how late it
>       is for 3.5 I think it is best to revert this for now.  There could be
>       other cases that rely on the current although wrong behavior.  I will
>       post an updated version for 3.6."
> 
>     Bisected-and-reported-by: Meelis Roos <mroos-Y27EyoLml9s@public.gmane.org>
>     Requested-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>     Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>     Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>     Signed-off-by: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> 
> So if Meelis still has access to the Sun Fire V100 and Sun Netra X1
> machines that regressed last time around, it'd be great to get this
> patch tested on them to verify that it indeed fixes the problem and
> doesn't regress.

OK, I had forgotten about that.

Tested successfully on the same Sun Fire V100 and Sun Netra X1, on top 
of 3.13-rc2. The sunsu console is detected fine and I see no problem for 
now.

-- 
Meelis Roos (mroos-Y27EyoLml9s@public.gmane.org)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
