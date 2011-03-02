From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM:boot:device tree: Allow the device tree binary
	to be appended to zImage
Date: Tue, 1 Mar 2011 21:37:51 -0500 (EST)
Message-ID: <alpine.LFD.2.00.1103012124320.9350@xanadu.home>
References: <20110228233153.24836.24176.stgit@riker>
	<20110228233327.24836.94530.stgit@riker>
	<alpine.LFD.2.00.1103010019160.10356@xanadu.home>
	<4D6DA062.8010904@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D6DA062.8010904-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 1 Mar 2011, John Bonesio wrote:

> I have looked through, and I'm reworking the patch set. I have just one
> comment below.
> 
> - John
> 
> On 02/28/2011 10:39 PM, Nicolas Pitre wrote:
> > On Mon, 28 Feb 2011, John Bonesio wrote:
> > 

[...]

> >> +
> >> +		/* bump our bss registers too */
> >> +		add	r2, r2, r5
> >> +		add	r3, r3, r5
> >> +
> >> +		/* bump the stack pinter, if at or above _edata */
> >> +		cmp	sp, r6
> >> +		addcs	sp, sp, r5
> > 
> > This will always be true as this is within #ifndef CONFIG_ZBOOT_ROM.
> 
> Right now sp will always be above r6. I thought it might be prudent to
> add the test in case the linker script changed and the stack was placed
> elsewhere. It might save someone a headache later.

That's what comments are for.  And if someone modifies the linker script 
without understanding the affected code then that someone deserves the 
pain.


Nicolas
