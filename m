From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v7 09/13] lib/vsprintf: Add a note on re-using %pf or %pF
Date: Wed, 2 Oct 2019 15:02:20 +0300
Message-ID: <20191002120220.GF972@paasikivi.fi.intel.com>
References: <20190918133419.7969-1-sakari.ailus@linux.intel.com>
 <20190918133419.7969-10-sakari.ailus@linux.intel.com>
 <20190924104549.qiayzhr7zikja7sp@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190924104549.qiayzhr7zikja7sp@pathway.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: rafael@kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2019 at 12:45:49PM +0200, Petr Mladek wrote:
> On Wed 2019-09-18 16:34:15, Sakari Ailus wrote:
> > Add a note warning of re-use of obsolete %pf or %pF extensions.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
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
> > + *	    or function descriptors. Be careful when re-using %pf or %pF!
> 
> I am not a native speaker but the sentence is hard to parse to me.
> Also I miss the word 'symbolic'. IMHO, it described that the output
> was a symbol name.
> 
> What about something like?
> 
>   * - '[Ff]' %pf and %pF were obsoleted and later removed in favor of
>   *	    %ps and %pS. Be careful when re-using these specifiers.

Yes, I'll use this in v8.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
