From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v7 09/13] lib/vsprintf: Add a note on re-using %pf or %pF
Date: Wed, 18 Sep 2019 17:29:01 +0300
Message-ID: <20190918142901.GS5781@paasikivi.fi.intel.com>
References: <20190918133419.7969-1-sakari.ailus@linux.intel.com>
 <20190918133419.7969-10-sakari.ailus@linux.intel.com>
 <20190918100023.078e3b8e@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190918100023.078e3b8e@gandalf.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 10:00:23AM -0400, Steven Rostedt wrote:
> On Wed, 18 Sep 2019 16:34:15 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> 
> > Add a note warning of re-use of obsolete %pf or %pF extensions.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> 
> Suggested-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Yes, I'll add that for v8.

> 
> > ---
> >  lib/vsprintf.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index b00b57f9f911f..df59818537b52 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -2008,6 +2008,8 @@ static char *kobject_string(char *buf, char *end, void *ptr,
> >   * - 'S' For symbolic direct pointers (or function descriptors) with offset
> >   * - 's' For symbolic direct pointers (or function descriptors) without offset
> >   * - '[Ss]R' as above with __builtin_extract_return_addr() translation
> > + * - '[Ff]' Obsolete an now unsupported extension for printing direct pointers
> 
>  "Obsolete and now"?

Fixed.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
