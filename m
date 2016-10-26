From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6] mwifiex: parse device tree node for PCIe
Date: Wed, 26 Oct 2016 13:46:48 -0700
Message-ID: <20161026204648.GD3989@dtor-ws>
References: <1477070156-109965-1-git-send-email-rajatja@google.com>
 <1477084869-15612-1-git-send-email-rajatja@google.com>
 <20161026201735.GA10192@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161026201735.GA10192@localhost>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, rajatxjain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 26, 2016 at 01:17:36PM -0700, Brian Norris wrote:
> Hi Rajat,
> 
> On Fri, Oct 21, 2016 at 02:21:09PM -0700, Rajat Jain wrote:
> > From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > 
> > This patch derives device tree node from pcie bus layer framework, and
> > fixes a minor memory leak in mwifiex_pcie_probe() (in failure path).
> > Device tree bindings file has been renamed(marvell-sd8xxx.txt ->
> > marvell-8xxx.txt) to accommodate PCIe changes.
> > 
> > Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> > v2: Included vendor and product IDs in compatible strings for PCIe
> > chipsets(Rob Herring)
> > v3: Patch is created using -M option so that it will only include diff of
> > original and renamed files(Rob Herring)
> > Resend v3: Resending the patch because I missed to include device tree mailing
> > while sending v3.
> > v4: Fix error handling, also move-on even if no device tree node is present.
> > v5: Update commit log to include memory leak, return -EINVAL instead of -1.
> 
> I've been working on reworking some bugfixes for this driver, and I
> noticed we have some problems w.r.t. memory leaks, and the "memory leak"
> fix is not actually a fix. See below.

Sorry, I just saw this... Why do we need devicetree data for
discoverable bus (PCI)? How does the driver work on systems that do not
use DT? Why do we need them to behave differently?

Thanks.

-- 
Dmitry
