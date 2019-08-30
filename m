From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 06/10] lib/vsprintf: Remove support for %pF and %pf in
 favour of %pS and %ps
Date: Fri, 30 Aug 2019 15:55:32 +0300
Message-ID: <20190830125532.GH2680@smile.fi.intel.com>
References: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
 <20190829101043.24963-7-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190829101043.24963-7-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 01:10:39PM +0300, Sakari Ailus wrote:
> %pS and %ps are now the preferred conversion specifiers to print function
> %names. The functionality is equivalent; remove the old, deprecated %pF
> %and %pf support.

Btw, too many % in the commit message.

-- 
With Best Regards,
Andy Shevchenko
