From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 2/2 v2] of/platform: Use platform_device interface
Date: Thu, 04 Jun 2015 14:25:36 +0900
Message-ID: <20150604052536.DA31EC40548@trevor.secretlab.ca>
References: <1429604702-14157-1-git-send-email-ricardo.ribalda@gmail.com>
	<1429604702-14157-2-git-send-email-ricardo.ribalda@gmail.com>
	<CAL_Jsq+ux9aCNUNVH+Vwy_j9oeV0CLbruPN4arkuCBPxvgrzhw@mail.gmail.com>
	<CAPybu_0C=iAGY9cFgxOt7YgCRG+xvKo1YBJfWent5+xord-xmg@mail.gmail.com>
	<CAL_JsqKV-+A196XaiGTGdx6tr1DStWYca5JnHR-QgBbMUyOiRA@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKV-+A196XaiGTGdx6tr1DStWYca5JnHR-QgBbMUyOiRA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Vivek Goyal <vgoyal@redhat.com>, Jakub Sitnicki <jsitnicki@gmail.com>, Mike Travis <travis@sgi.com>, Jiang Liu <jiang.liu@linux.intel.com>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 21 Apr 2015 18:01:00 -0500
, Rob Herring <robherring2@gmail.com>
 wrote:
> On Tue, Apr 21, 2015 at 4:09 PM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
> > Hello Rob
> >
> > On Tue, Apr 21, 2015 at 10:13 PM, Rob Herring <robherring2@gmail.com> wrote:
> >> On Tue, Apr 21, 2015 at 3:25 AM, Ricardo Ribalda Delgado
> >> <ricardo.ribalda@gmail.com> wrote:
> >>> of_platform_device_create_pdata() was using of_device_add() to create
> >>> the devices, but of_platform_device_destroy was using
> >>> of_platform_device_destroy().
> >>>
> >>> of_device_add(), do not call insert_resource(), which initializes the
> >>> parent field of the resource structure, needed by release_resource(),
> >>> called by of_platform_device_destroy().
> >>
> >> This is because some DTs have overlapping resources and doing this
> >> would break things. If you look at the git history, this was fixed and
> >> then reverted by Grant.
> >
> > I cannot find that commit sorry, could you give me the hash or a link
> > to the mailing list?
> >
> > ricardo@pilix:~/linux$ git shortlog drivers/of/platform.c | grep -i Revert
> >       Revert "drivers: of: add initialization code for dma reserved memory"
> 
> commit 02bbde7849e68e193cefaa1885fe0df0f03c9fcd
> Author: Grant Likely <grant.likely@secretlab.ca>
> Date:   Sun Feb 17 20:03:27 2013 +0000
> 
>     Revert "of: use platform_device_add"
> 
>     This reverts commit aac73f34542bc7ae4317928d2eabfeb21d247323. That
>     commit causes two kinds of breakage; it breaks registration of AMBA
>     devices when one of the parent nodes already contains overlapping
>     resource regions, and it breaks calls to request_region() by device
>     drivers in certain conditions where there are overlapping memory
>     regions. Both of these problems can probably be fixed, but it is better
>     to back out the commit and get a proper fix designed before trying again.
> 
>     Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> 
> >
> >
> > To give a litte context to this patch, the issue started with this
> > conversaion with Bjorn:
> > https://lkml.org/lkml/2015/4/20/435
> >
> >
> > What we have today is also wrong, it leads to a null pointer deference
> > (and therefore a whole crash).
> >
> > If we cannot use platform_device_add, then we cannot use
> > platform_device_destroy :)
> >
> > Shall I prepare a patch replacing platform_device_destroy()?
> 
> Perhaps we make inserting resource failure non-fatal so by default we
> can have resources inserted but not break the cases Grant mentioned.
> Ideally we want to not have new platforms with overlapping resources
> in the DT.

I think I tried that too and then ran in to a problem where drivers will
fail if a different device 'owns' the resource.

For example, if device-a and device-b have overlapping regions, device-a
gets registered first and claims the region. device-b tries to claim the
region, fails, but is allowed to continue anyway. When driver-b tries to
bind to device-b, and does a request_resource(), it will fail because
device-a already owns it. I don't have a good solution for that other
than to completely disable insert_resource() when using devicetree.

g.
