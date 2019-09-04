From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5 00/11] Device property improvements, add %pfw format
 specifier
Date: Wed, 4 Sep 2019 19:04:16 +0300
Message-ID: <20190904160416.GV5475@paasikivi.fi.intel.com>
References: <20190902135732.23455-1-sakari.ailus@linux.intel.com>
 <be9cd5d933486de9cf88a1550c2020c56348670d.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <be9cd5d933486de9cf88a1550c2020c56348670d.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi Joe,

On Tue, Sep 03, 2019 at 02:38:48AM -0700, Joe Perches wrote:
> On Mon, 2019-09-02 at 16:57 +0300, Sakari Ailus wrote:
> > Hi all,
> > 
> > This set adds functionality into the device property API (counting a
> > node's parents as well as obtaining its name) in order to support printing
> > fwnode names using a new conversion specifier "%pfw". The names that are
> > produced are equivalent to its OF counterpart "%pOF" on OF systems for the
> > two supported modifiers ("f" and "P").
> > 
> > Printing a node's name is something that's been available on OF for a long
> > time and if something is converted to device property API (such as the
> > V4L2 fwnode framework) it always got removed of a nice feature that was
> > sometimes essential in debugging. With this set, that no longer is the
> > case.
> 
> Doesn't this still have dependencies on removing all
> existing %p[fF] uses?
> 
> In Linus' tree:
> 
> tools/lib/traceevent/Documentation/libtraceevent-func_apis.txt:or events have "%pF" or "%pS" parameter in its format string. It is common to
> tools/lib/traceevent/event-parse.c:             if (asprintf(&format, "%%pf: (NO FORMAT FOUND at %llx)\n", addr) < 0)
> tools/lib/traceevent/event-parse.c:     if (asprintf(&format, "%s: %s", "%pf", printk->printk) < 0)
> 
> And these in -next:
> 
> drivers/scsi/lpfc/lpfc_hbadisc.c:                                        "3185 FIND node filter %pf DID "
> drivers/scsi/lpfc/lpfc_hbadisc.c:                        "3186 FIND node filter %pf NOT FOUND.\n", filter);
> drivers/scsi/lpfc/lpfc_sli.c:                           "(%d):0307 Mailbox cmd x%x (x%x/x%x) Cmpl %pf "

Thanks for bringing these up.

I'll submit patches to address both.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
