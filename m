From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v9 07/12] lib/vsprintf: Remove support for %pF and %pf in
 favour of %pS and %ps
Date: Tue, 8 Oct 2019 13:53:23 +0200
Message-ID: <20191008115323.qgy5gq3oipcspfsz@pathway.suse.cz>
References: <20191003123219.11237-1-sakari.ailus@linux.intel.com>
 <20191003123219.11237-8-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191003123219.11237-8-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: rafael@kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 2019-10-03 15:32:14, Sakari Ailus wrote:
> %pS and %ps are now the preferred conversion specifiers to print function
> names. The functionality is equivalent; remove the old, deprecated %pF
> and %pf support.
> 
> Depends-on: commit 2d44d165e939 ("scsi: lpfc: Convert existing %pf users to %ps")
> Depends-on: commit b295c3e39c13 ("tools lib traceevent: Convert remaining %p[fF] users to %p[sS]")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
