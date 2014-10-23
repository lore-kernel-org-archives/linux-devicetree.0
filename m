From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [BISECTED] arm: mvebu: Kernel hang after ae9304c9d311 if OF_SELFTEST=y
Date: Thu, 23 Oct 2014 13:49:50 +0200
Message-ID: <5448EB5E.3010405@free-electrons.com>
References: <87mw8nt5io.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87mw8nt5io.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnaud,

On 23/10/2014 13:00, Arnaud Ebalard wrote:
> Hi,
> 
> Trying to boot a 3.17.1 (same thing w/ current tip of Linus tree or
> 3.17.1) on two Marvell Armada 370 based platforms (NETGEAR ReadyNAS
> 102 and Synology DS213j) ends up w/ the following:
> 
>    Starting kernel ...
>    
>    Uncompressing Linux... done, booting the kernel.
>    
>    Error: unrecognized/unsupported machine ID (r1 = 0x00000bde).
>    
>    Available machine support:
>    
>    ID (hex)        NAME
>    ffffffff        Generic DT based system
>    ffffffff        Marvell Armada 380/385 (Device Tree)
>    ffffffff        Marvell Armada 375 (Device Tree)
>    ffffffff        Marvell Armada 370/XP (Device Tree)
>    
>    Please check your kernel config and/or bootloader.
> 
> I bisected it up to ae9304c9d31117 ("Adding selftest testdata
> dynamically into live tree"). For a while, my kernels are compiled w/
> OF_SELFTEST and it works w/o issue. After that commit, boot hangs as

It would be interesting to have a feedback of a kernel with an appended dtb
and OF_SELFTEST enabled to a different platform (ie non mvebu). Then we
will know if it something related to mvebu or to the device tree support.

I will try to see if I can do this.

> presented above. Disabling the option solves the issue on 3.17 and
> also for current tip of Linus tree. Reverting the commit on those
> kernel is not straightforward.
> 
> A config is attached.
> 
> Cheers,
> 
> a+
> 
> ps: my platforms all boot a kernel w/ an appended dtb.
> 


Thanks for you report,

Gregory


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
