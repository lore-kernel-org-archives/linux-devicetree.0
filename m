From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH 04/10] util_version: new helper for displaying version info
Date: Mon, 22 Apr 2013 15:44:54 -0500
Message-ID: <E1UUNba-0005oJ-Ur@jdl.com>
References: <1366078397-14889-1-git-send-email-vapier@gentoo.org>
 <201304212025.47665.vapier@gentoo.org> <E1UUIno-0004Ox-Dd@jdl.com>
 <201304221154.08100.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <201304221154.08100.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On Monday 22 April 2013 11:37:12 Jon Loeliger wrote:
> > > hmm, looks like patch #2 (utilfdt_read and handling of the len argument)
> > > was taken from the first patch series rather than the 3rd ?
> > >
> > > i'd suggest reverting it and applying instead the one from this series
> > > ... Message-Id: <1366078397-14889-3-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> >
> > Please send me the version you want applied.
> 
> attached
> Dmike

...and re-applied.  Sorry about that.

a6d55e0 utilfdt_read: pass back up the length of data read
5543b88 Revert "utilfdt_read: pass back up the length of data read"
31be4ce util_version: new helper for displaying version info
97c122e die: constify format string arg
cc2c178 utilfdt_read: pass back up the length of data read
f8cb5dd utilfdt_read_err: use xmalloc funcs
27cdc1b Added license header to dtc/libfdt/fdt.h and libfdt_env.h
cc11e52 Fix typo
b7aa300 Export fdt_stringlist_contains()
d59b807 .gitignore: Add rule for *.patch
