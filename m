From: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Subject: Re: [PATCH 7/7] powerpc: Added PCI MSI support using the HSTA module
Date: Tue, 25 Feb 2014 16:54:58 +1100
Message-ID: <1541869.UgdfUgWYNB@mexican>
References: <1392964293-13687-1-git-send-email-alistair@popple.id.au> <1574137.lzDhNaVqIe@wuerfel> <1393015286.6771.110.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393015286.6771.110.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 22 Feb 2014 07:41:26 Benjamin Herrenschmidt wrote:
> On Fri, 2014-02-21 at 15:33 +0100, Arnd Bergmann wrote:

[...]

> 
> Should we (provided it's possible in HW) create two ranges instead ? One
> covering RAM and one covering MSIs ? To avoid stray DMAs whacking random
> HW registers in the chip ...
> 

The thought occurred to me but I figured if we had stray DMAs then they could 
already whack random bits of system memory which would likely break your 
system anyway so I wasn't sure how much we'd gain. I guess whacking random HW 
registers is arguably a bit worse though.

I did a bit of digging into the HW documentation and it looks like it _may_ be 
possible to create a second range that would limit access to a subset of HW 
registers, although there doesn't seem to be much flexibility. Personally I'm 
not sure it justifies the work, but I'm happy to look into it a bit more if 
you feel it's important?

- Alistair

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
