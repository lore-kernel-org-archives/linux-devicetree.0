From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 10/11] lib/vsprintf: Add %pfw conversion specifier for
 printing fwnode names
Date: Wed, 4 Sep 2019 18:54:12 +0300
Message-ID: <20190904155412.GU2680@smile.fi.intel.com>
References: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
 <20190902083240.20367-11-sakari.ailus@linux.intel.com>
 <20190903130607.cf2qv3s3evobbd5g@pathway.suse.cz>
 <20190904150413.GU5475@paasikivi.fi.intel.com>
 <20190904151759.GS2680@smile.fi.intel.com>
 <f62dd153a23bfbe580aee9e50d87c0ff59f4d0ec.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f62dd153a23bfbe580aee9e50d87c0ff59f4d0ec.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Mladek <pmladek@suse.com>, rafael@kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 04, 2019 at 08:39:42AM -0700, Joe Perches wrote:
> On Wed, 2019-09-04 at 18:17 +0300, Andy Shevchenko wrote:
> > On Wed, Sep 04, 2019 at 06:04:13PM +0300, Sakari Ailus wrote:
> > > On Tue, Sep 03, 2019 at 03:06:07PM +0200, Petr Mladek wrote:

> > > Good catch. \w indeed matches a single letter; I'll change that to \w+ and
> > > change the other uses accordingly.
> > 
> > It's weird. \w stands for word matching. How can it match one letter only?
> 
> \w 	matches any single character classified as a “word” character (alphanumeric or “_”)

Thank you for explanation!

-- 
With Best Regards,
Andy Shevchenko
