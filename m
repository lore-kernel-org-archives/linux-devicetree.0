From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Thu, 17 Mar 2011 22:54:01 -0600
Message-ID: <20110318045401.GA18545@angua.secretlab.ca>
References: <20110311165642.GA9996@kroah.com>
	<20110317214042.GQ31411@opensource.wolfsonmicro.com>
	<20110317214736.GA29014@kroah.com>
	<201103172333.01474.arnd@arndb.de>
	<20110317225328.GB31581@kroah.com> <4D8296D1.9060106@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D8296D1.9060106-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 17, 2011 at 11:18:41PM +0000, Andy Green wrote:
> On 03/17/2011 10:53 PM, Somebody in the thread at some point said:
> 
> >>Not tested!
> >>
> >>Signed-off-by: Arnd Bergmann<arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> ><snip>
> >
> >Very nice.
> >
> >Andy and Mark, would this patch work for you?
> 
> You do realize this untested patch depends on 13 year old vapour
> definition of general usb device tagging in Device Tree that does
> not exist yet?

IIRC, not vapour.  I believe this binding is currently used by Open
Firmware on existing PowerPC, SPARC and x86 machines.  Linux doesn't
use the binding because up to this point Linux hasn't cared about how
firmware initialized the usb bus.  It just reinitializes everything
anyway.

g.
