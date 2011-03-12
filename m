From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: No support of platform device instance id?
Date: Sat, 12 Mar 2011 22:55:33 +0800
Message-ID: <20110312145532.GA10194@S2100-06.ap.freescale.net>
References: <20110312070057.GB9650@S2100-06.ap.freescale.net>
	<20110312094620.GM9347@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110312094620.GM9347-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

Thanks for the explanation.

On Sat, Mar 12, 2011 at 02:46:20AM -0700, Grant Likely wrote:
> On Sat, Mar 12, 2011 at 03:00:57PM +0800, Shawn Guo wrote:
> > Hello all,
> > 
> > I'm looking at function of_device_alloc in drivers/of/platform.c, and
> > surprisingly found that the platform device instance id is being
> > hard-coded as -1 when calling platform_device_alloc.  Does this mean
> > that there is no support of pdev id in DT?
> 
> Correct, when generating devices from the DT, the core code has no way
> of knowing what the 'preferred' number of the device should be.  It

If we have this number in DT, the core code gets the way.

> expects that when the driver's .probe() hook is called, the driver is
> smart enough to enumerate the automatically.
> 
Considering that many drivers on ARM platform are replying on
pdev->id, we will have to make every single of such drivers become
smart.

> > If yes, can anyone please
> > help me understand why we do not have something in DT node to reflect
> > this id and get it supported?  Or this is something on TODO list?
> 
> Ideally, you shouldn't be relying on .id at all.  Fix your device
> drivers to enumerate correctly, and use explicit phandle references
> when specifying connections between devices.
> 
Again, many existing ARM drivers will need to get fixed.

> That said, I do understand the issue with needing to reference a
> specific device by name; like for specifying the console device.  In
> those cases, the correct way to figure out what number a device is
> supposed to have is to add a property to the /aliases node (see ePAPR

To me, specifying the id in DT, and letting core code get it from DT
and pass it to platform_device_alloc seems more natural and
straight-forward than creating /aliases node and then parsing it in
every single driver that need to figure out the device number.

The most important thing is that the ARM drivers relying on pdev->id
will need no changes on this point, if we have pdev->id supported in
DT core code.

I can live with the approach you tell, but I doubt that ARM community
people will have the same question, when we post the driver changes
for DT support.

> for a description of /aliases).  However, even in this case the driver
> should be looking at the device tree data, and not depend on the value
> in pdev->id.
> 
If we have pdev->id specified in DT and retrieved it by core code,
the driver is actually looking at the data from DT.

-- 
Regards,
Shawn
