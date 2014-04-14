From: Insop Song <insop.song-X7+3OicCfH32eFz/2MeuCQ@public.gmane.org>
Subject: Re: [PATCH] Configure FSL eSPI CSBEF, CSAFT, and whether to send all
 received data to user
Date: Mon, 14 Apr 2014 16:59:11 -0700
Message-ID: <20140414235911.GA16287@neon.local.cohere.net>
References: <1397328516-13260-1-git-send-email-Jane.Wan@gainspeed.com>
 <20140414205151.GH25182@sirena.org.uk>
 <20140414213853.GF14129@neon.local.cohere.net>
 <20140414234949.GH12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140414234949.GH12304-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jane Wan <Jane.Wan-X7+3OicCfH32eFz/2MeuCQ@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, kenth.eriksson-SNLAxHN9vbdl57MIdRCFDg@public.gmane.org, thomas.de.schampheleire-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, b48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org, spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 15, 2014 at 12:49:49AM +0100, Mark Brown wrote:
> On Mon, Apr 14, 2014 at 02:38:53PM -0700, Insop Song wrote:
> > On Mon, Apr 14, 2014 at 09:51:51PM +0100, Mark Brown wrote:
> 
> > > Please also be sure to CC the mailing list on patches, the sourceforge
> > > list has been unused for quite some time now.
> 
> > We use scripts/get_maintainer.pl to get the mailing addresses.
> > We will double check the mailing list from MAINTAINER file.
> 
> This will be part of not using a current kernel - if you're using a v3.8
> kernel to check then that's over a year out of date.

Mark,

If you were asking that the issue is due to the fact that the kernel we are using is
out of date, then here is our response.

Though, we didn't generate the patch with the latest kernel, we HAVE checked the
latest kernel and the *bugginess* of the freescale espi driver was the same as
the kernel that we are using.

Using the other thread, we will response to your other concerns.

Regards,

Insop
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
