From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 09:19:05 +0100
Message-ID: <201103180919.05521.arnd@arndb.de>
References: <20110311165642.GA9996@kroah.com> <4D8296D1.9060106@linaro.org>
	<20110318045401.GA18545@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110318045401.GA18545-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 18 March 2011, Grant Likely wrote:
> On Thu, Mar 17, 2011 at 11:18:41PM +0000, Andy Green wrote:
> > On 03/17/2011 10:53 PM, Somebody in the thread at some point said:
> > 
> > >>Not tested!
> > >>
> > >>Signed-off-by: Arnd Bergmann<arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >
> > ><snip>
> > >
> > >Very nice.
> > >
> > >Andy and Mark, would this patch work for you?
> > 
> > You do realize this untested patch depends on 13 year old vapour
> > definition of general usb device tagging in Device Tree that does
> > not exist yet?
> 
> IIRC, not vapour.  I believe this binding is currently used by Open
> Firmware on existing PowerPC, SPARC and x86 machines.  Linux doesn't
> use the binding because up to this point Linux hasn't cared about how
> firmware initialized the usb bus.  It just reinitializes everything
> anyway.

I'm not proposing to use the binding for the complete USB probing, that
would just duplicate the probing code that we already have. We could
howeve check some properties from the binding against what the Linux
drivers see.

Most importantly, we can assign the device_node pointer for each
hardwired USB device to the usb_device structure, that should be
really simple. The only reason why I pointed to the spec is to
make sure we don't put incompatible properties in the tree and
instead just do whatever we need according to the spec but leave
out all the optional parts.

	Arnd
