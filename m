From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: dtc: Automatically pick a sensible boot_cpuid_phys
Date: Fri, 19 Feb 2010 08:37:36 -0600
Message-ID: <E1NiTz6-0000yv-PW@jdl.com>
References: <20100219045050.GJ29038@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20100219045050.GJ29038@yookeroo> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Currently, when in -Idts -Odtb or -Ifs -Odtb modes, dtc always
> defaults to using 0 as the value for the boot_cpuid_phys header field.
> That's correct quite often, but there are some systems where there is
> no CPU with hardware ID of 0, or where we don't want to use the CPU
> with hardware ID 0 at all (e.g. for AMP-style partitioning).  The only
> way to override this default currently, is with the -b command line
> option.
> 
> This patch improves dtc to instead base the default boot_cpuid_phys
> value on the reg property of the first listed subnode of /cpus.  This
> means that dtc will get boot_cpuid_phys correct by default in a
> greater proportion of cases (since the boot cpu is usually listed
> first, and this way at least the boot_cpuid_phys default will match
> some existing cpu node).  If the node doesn't exist or has an invalid
> 'reg' property (missing or not 4 bytes in length), then
> boot_cpuid_phys is set to 0.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Applied.

jdl
