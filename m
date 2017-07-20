From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] drivers/staging/pi433: New driver
Date: Thu, 20 Jul 2017 13:31:50 +0200
Message-ID: <20170720113150.GA25299@kroah.com>
References: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
 <201707172156.DCyTyWc2%fengguang.wu@intel.com>
 <652336354.3806.1500549785404@ox.hosteurope.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <652336354.3806.1500549785404@ox.hosteurope.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kbuild-all@01.org, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 20, 2017 at 01:23:05PM +0200, Marcus Wolf wrote:
> Hi Greg,
> 
> below you can see the report with the error on m68k. It was sent to me from a
> test robot of intel.
> 
> According to my research, this problem occured, because there is no hardware
> support for floating point on the m68k (or it was configured not to use it).
> Therefore gcc uses an internal function, provided by libgcc. Obviously libgcc
> wasn't linked...
> 
> I don't know how to come arround this problem by modifying my code (except
> reducing the accuracy of the calculation by not using floating point).
> 
> Can we ignore the error or can I do something else?
> Maybe a special include just in case of m68k can help??!?
> I don't have an environment for building m68k.

It looks like a 64bit issue, try wrapping your division in that function
with a call to do_div() like you do elsewhere in that function.  That
should solve the issue.

thanks,

greg k-h
