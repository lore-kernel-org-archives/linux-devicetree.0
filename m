From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: No support of platform device instance id?
Date: Wed, 16 Mar 2011 21:58:01 +0800
Message-ID: <20110316135800.GB11658@S2100-06.ap.freescale.net>
References: <20110312070057.GB9650@S2100-06.ap.freescale.net>
	<20110312094620.GM9347@angua.secretlab.ca>
	<20110312145532.GA10194@S2100-06.ap.freescale.net>
	<20110314211019.GH16096@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110314211019.GH16096-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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

On Mon, Mar 14, 2011 at 03:10:19PM -0600, Grant Likely wrote:
> 
[...]
> Several weeks back I posted a patch for of_platform_bus_snoop() which
> matches platform_device registrations to nodes in the device tree
> instead of allocating and registering a new device.  I've spent some
> more time on that patch in the last couple of weeks to the point that
> I'm happy with the model and I'm almost ready to push it out to my
> devicetree/test branch.  John Bonesio is currently refactoring and

I have seen it on devicetree/test branch.

> cleaning it up for me so that it can get posted.  You can see the
> current state in my devicetree/preregister branch, with tegra modified
> to use it.
> 
> The model is:
> 
> 1) Platform code calls of_platform_device_preregister() to tell the DT
>    code about the nodes it /intends/ to register as devices.
> 2) Platform code can register as many or as few platform_devices as it
>    likes.  If any of these devices match one of the nodes passed by
>    of_platform_device_preregister(), then the DT code will set the
>    of_node pointer before it gets bound to a device.
> 3) Platform code calls of_platform_device_probe() which will
>    register platform_devices for any nodes which *did not* get
>    assigned to a device in step 2.
> 
> I implemented this as a way to allow dt and non-dt use-cases to share
> the same SoC setup code so that anything on-chip would get registered
> in the same way, but would also get the benefit of being linked to its
> device tree node.  For example, to obtain the list of i2c devices or
> gpio connections from the tree.  It also helps solve the problem of
> matching nodes to clks which are currently matched by name.  I think
> it would also solve your use case, at least in the short term.
> 
I'm seeing this approach benefits the smooth moving of dt on ARM, but
will this be the ultimate shape of dt support on ARM?

-- 
Regards,
Shawn
