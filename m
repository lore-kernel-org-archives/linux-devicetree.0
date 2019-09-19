From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v7 00/13] Device property improvements, add %pfw format
 specifier
Date: Thu, 19 Sep 2019 11:29:34 +0300
Message-ID: <20190919082934.GT5781@paasikivi.fi.intel.com>
References: <20190918133419.7969-1-sakari.ailus@linux.intel.com>
 <CAJZ5v0iHv=-t3qA3VBfC6ryPOmC8QW9pxwFvEw6SQQZ3CwsScw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iHv=-t3qA3VBfC6ryPOmC8QW9pxwFvEw6SQQZ3CwsScw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2019 at 10:00:08AM +0200, Rafael J. Wysocki wrote:
> On Wed, Sep 18, 2019 at 3:34 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
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
> >
> > Note: the set now depends on 2d44d165e939 ("scsi: lpfc: Convert existing
> > %pf users to %ps") that is expected from the linux-scsi tree. It is
> 
> OK, so I will be expecting a refresh of the series when the above
> commit appears in the mainline.

Works for me. I'll send v8 then, with Depends-on removed.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
