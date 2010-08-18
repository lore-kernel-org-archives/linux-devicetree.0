From: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] MIPS: Add device tree support to MIPS
Date: Wed, 18 Aug 2010 16:36:25 +0100
Message-ID: <20100818153625.GA29740@linux-mips.org>
References: <AANLkTi=74zoQziQTmAGo-cNtF9FAT77h+KZagsNEFjEf@mail.gmail.com>
	<7A9214B0DEB2074FBCA688B30B04400D013FA46D@XMB-RCD-208.cisco.com>
	<20100816204211.GA17571@angua.secretlab.ca>
	<20100817134039.fc1108c7.sfr@canb.auug.org.au>
	<20100818143926.GB2849@linux-mips.org>
	<20100819011856.bfef5f65.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100819011856.bfef5f65.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
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

On Thu, Aug 19, 2010 at 01:18:56AM +1000, Stephen Rothwell wrote:

> > A suggested set of kernel defconfigs to test:
> > 
> > bigsur_defconfig
> > cavium-octeon_defconfig
> > ip22_defconfig
> > ip27_defconfig
> > ip32_defconfig
> > malta_defconfig
> > allmodconfig
> > 
> > These cover a huge variety of features, UP, SMP & weirdo SMP, flatmem & NUMA,
> > 32-bit, 64-bit, little and big endian.
> 
> OK, I will adjust the MIPS builds tomorrow.  Thanks for the suggestions.
> Just be clear, I only need to build with one compiler (presumably what
> gcc/binutils produces when I ask for a "mips" toolchain) and can drop the
> other ("mipsel"), correct?

Yes, that's entirely correct.

For the sake of others reading this I should mention that some GCC version
apparently had a bug which resulted in bad code generation for the
non-default ABI.  I don't know which versions were affected but for
just doing build tests it really doesn't matter.

  Ralf
