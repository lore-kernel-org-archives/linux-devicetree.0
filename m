From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 08/10] lib/vsprintf: OF nodes are first and foremost,
 struct device_nodes
Date: Fri, 30 Aug 2019 15:57:49 +0300
Message-ID: <20190830125749.GI2680@smile.fi.intel.com>
References: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
 <20190829101043.24963-9-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190829101043.24963-9-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 01:10:41PM +0300, Sakari Ailus wrote:
> Factor out static kobject_string() function that simply calls
> device_node_string(), and thus remove references to kobjects (as these are
> struct device_node).

Not sure. This removes "(%pO?)" error string.

-- 
With Best Regards,
Andy Shevchenko
