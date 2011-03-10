From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 1/3] arm/dt: add basic mx51 device tree support
Date: Thu, 10 Mar 2011 13:38:44 +0100
Message-ID: <201103101338.45187.arnd@arndb.de>
References: <1299503160-9910-1-git-send-email-jason.hui@linaro.org>
	<20110307141656.GC7189@S2101-09.ap.freescale.net>
	<201103071537.49026.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <201103071537.49026.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 07 March 2011, Arnd Bergmann wrote:
> On Monday 07 March 2011, Shawn Guo wrote:
> > > diff --git a/arch/arm/mach-mx5/Makefile b/arch/arm/mach-mx5/Makefile
> > > index 0d43be9..540697e 100644
> > > --- a/arch/arm/mach-mx5/Makefile
> > > +++ b/arch/arm/mach-mx5/Makefile
> > > @@ -18,3 +18,4 @@ obj-$(CONFIG_MACH_EUKREA_CPUIMX51SD) += board-cpuimx51sd.o
> > >  obj-$(CONFIG_MACH_EUKREA_MBIMXSD51_BASEBOARD) += eukrea_mbimxsd-baseboard.o
> > >  obj-$(CONFIG_MACH_MX51_EFIKAMX) += board-mx51_efikamx.o
> > >  obj-$(CONFIG_MACH_MX50_RDP) += board-mx50_rdp.o
> > > +obj-$(CONFIG_MACH_MX51_DT) += board-dt.o
> > 
> > If board-dt.c is mx51 specific, would it be sane to name it something
> > like board-mx51-dt.c?  We have mx53 stuff in this folder as well.
> > 
> 
> Alternatively, it could be done the other way round: rename the identifiers
> in the file from mx51_ to mx5_, and make sure that they don't contain
> any mx51 specific settings but always refer to properties in the 
> device tree for the differences.

Hi Jason,

I saw that your V4 still implements neither Shawn's suggestion nor mine.

	Arnd
