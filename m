From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: No support of platform device instance id?
Date: Sat, 12 Mar 2011 02:46:20 -0700
Message-ID: <20110312094620.GM9347@angua.secretlab.ca>
References: <20110312070057.GB9650@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110312070057.GB9650-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 12, 2011 at 03:00:57PM +0800, Shawn Guo wrote:
> Hello all,
> 
> I'm looking at function of_device_alloc in drivers/of/platform.c, and
> surprisingly found that the platform device instance id is being
> hard-coded as -1 when calling platform_device_alloc.  Does this mean
> that there is no support of pdev id in DT?

Correct, when generating devices from the DT, the core code has no way
of knowing what the 'preferred' number of the device should be.  It
expects that when the driver's .probe() hook is called, the driver is
smart enough to enumerate the automatically.

> If yes, can anyone please
> help me understand why we do not have something in DT node to reflect
> this id and get it supported?  Or this is something on TODO list?

Ideally, you shouldn't be relying on .id at all.  Fix your device
drivers to enumerate correctly, and use explicit phandle references
when specifying connections between devices.

That said, I do understand the issue with needing to reference a
specific device by name; like for specifying the console device.  In
those cases, the correct way to figure out what number a device is
supposed to have is to add a property to the /aliases node (see ePAPR
for a description of /aliases).  However, even in this case the driver
should be looking at the device tree data, and not depend on the value
in pdev->id.

> I'm asking this because I feel we still need pdev id support in DT when
> reviewing the patch set of 'mx51 basic DT support'.
> 
> -- 
> Regards,
> Shawn
> 
> 
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
