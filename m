From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: Re: [PATCH] NFC: trf7970a: Handle extra byte in response to Type 5
 RMB commands
Date: Mon, 8 Jun 2015 20:32:13 -0700
Message-ID: <20150609033213.GA16978@animalcreek.com>
References: <1429897042-21430-1-git-send-email-mgreer@animalcreek.com>
 <20150608211821.GC5089@ribalta.mp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150608211821.GC5089-41CF7WKNp/HfYmLG0ciiYFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 08, 2015 at 11:18:21PM +0200, Samuel Ortiz wrote:
> Hi Mark,
> 
> On Fri, Apr 24, 2015 at 10:37:22AM -0700, Mark A. Greer wrote:
> > The current versions of the trf7970a has an erratum where it returns
> > an extra byte in the response to 'Read Multiple Block' (RMB) commands.
> > This command is issued to Type 5 tags (i.e., ISO/IEC 15693 tags) by
> > the neard daemon.
> > 
> > To handle this, define a new Device Tree property,
> > 't5t-rmb-extra-byte-quirk', which indicates that the associated
> > trf7970a device has this erratum.  The trf7970a device driver
> > will then ensure that the response length to RMB commands is
> > reduced by one byte (for devices with the erratum).
> > 
> > Signed-off-by: Mark A. Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
> > ---
> >  .../devicetree/bindings/net/nfc/trf7970a.txt       |  4 ++++
> >  drivers/nfc/trf7970a.c                             | 23 ++++++++++++++++++----
> >  2 files changed, 23 insertions(+), 4 deletions(-)
> Applied to nfc-next, thanks.

Cool!  Thanks Samuel.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
