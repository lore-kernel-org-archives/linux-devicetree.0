From: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] MIPS: Add device tree support to MIPS
Date: Wed, 18 Aug 2010 15:39:26 +0100
Message-ID: <20100818143926.GB2849@linux-mips.org>
References: <AANLkTi=74zoQziQTmAGo-cNtF9FAT77h+KZagsNEFjEf@mail.gmail.com>
	<7A9214B0DEB2074FBCA688B30B04400D013FA46D@XMB-RCD-208.cisco.com>
	<20100816204211.GA17571@angua.secretlab.ca>
	<20100817134039.fc1108c7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100817134039.fc1108c7.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "David VomLehn (dvomlehn)" <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 17, 2010 at 01:40:39PM +1000, Stephen Rothwell wrote:

> On Mon, 16 Aug 2010 14:42:11 -0600 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> >
> > I'll also make sure to start build testing on MIPS.  Ralf, any suggestions on defconfigs I should use?
> 
> Linux-next does defconfig, allnoconfig, allmodconfig (which has failed
> for a long time) and ip32_defconfig for mips and mipsel.  I am not sure
> if all these are still relevant.
>
> (http://kisskb.ellerman.id.au/kisskb/branch/9/)

Kconfig will pick the default machine which is an IP22 for allyesconfig
and allmodconfig.  The makefile will then pick the right flags for the
compiler based on machine, processor and endian selection.  so it'll
happily build a big endian kernel with a little endian compiler.  All
that's really different between those compilers are the defaults.  Building
more different defconfigs is a better investments of CPU cycles.

An issue with very large functionss for which I've posted a patch earlier
today used to break makeallconfig / makeallmodconfig on MIPS.  I'll sort
those out but right now I just don't have the CPU cycles to regularly
build such monster kernel configs.

A suggested set of kernel defconfigs to test:

bigsur_defconfig
cavium-octeon_defconfig
ip22_defconfig
ip27_defconfig
ip32_defconfig
malta_defconfig
allmodconfig

These cover a huge variety of features, UP, SMP & weirdo SMP, flatmem & NUMA,
32-bit, 64-bit, little and big endian.

  Ralf
