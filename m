From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] powerpc/mpc85xx: Add MDIO bus muxing support to the
 board device tree(s)
Date: Wed, 04 Mar 2015 16:54:43 +1100
Message-ID: <1425448483.9084.14.camel@ellerman.id.au>
References: <1425310332-21744-1-git-send-email-Emilian.Medve@Freescale.com>
	 <54F484DE.30204@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F484DE.30204-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shruti Kanetkar <Kanetkar.Shruti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Igal Liberman <Igal.Liberman-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, afleming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-03-02 at 09:42 -0600, Emil Medve wrote:
> On 03/02/2015 09:32 AM, Emil Medve wrote:
> > From: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > 
> > Describe the PHY topology for all configurations supported by each board
> > 
> > Based on prior work by Andy Fleming <afleming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > Change-Id: I4fbcc5df9ee7c4f784afae9dab5d1e78cdc24f0f
> 
> Bah, I'll remove this...

Something like:

$ cat .git/hooks/commit-msg
#!/bin/sh

grep "Change-Id:" $1 > /dev/null

if [ $? -eq 0 ]; then
	echo "***: Error commit message includes Change-Id" >&2
	exit 1
fi
	

Ought to do it.

cheers


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
