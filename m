From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drivers/watchdog: ASPEED reference dev tree
 properties for config
Date: Wed, 28 Jun 2017 10:52:16 -0700
Message-ID: <20170628175216.GA13730@roeck-us.net>
References: <20170627211734.60477-1-cbostic@linux.vnet.ibm.com>
 <20170627211734.60477-3-cbostic@linux.vnet.ibm.com>
 <606a2e11-2d43-5204-0bb6-9c4415ee03df@roeck-us.net>
 <de0dc054-0813-fab1-d7ac-2f1d7ba61fd8@linux.vnet.ibm.com>
 <20170628145452.GA30968@roeck-us.net>
 <38e57720-9728-9377-2a16-adc8ce430ca0@linux.vnet.ibm.com>
 <20170628150846.GE30968@roeck-us.net>
 <b6c53add-c165-3678-dfed-cb6f1798accc@linux.vnet.ibm.com>
 <20170628160649.GB8915@roeck-us.net>
 <a3f76a4e-6c44-9844-9840-f6b5b05255ed@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a3f76a4e-6c44-9844-9840-f6b5b05255ed-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 28, 2017 at 11:09:15AM -0500, Christopher Bostic wrote:
> 
> >>
> >>Why would there even be a need configure for no system reset?  The external
> >>mode 'wdt ext: External signal enable after timeout' can be sent off chip
> >>even if system reset is disabled.  The watchdog is doing something in this
> >>case and would require wdt instantiation.
> >>
> >Wouldn't that be "aspeed,external-signal" ?
> Yes that optional parameter would need to be specified in that situation, as
> well as 'aspeed,no-system-reset'.
> 

Ok, makes sense (after looking into the datasheet). The missing detail
is that there is a separate configuration bit for "Reset system after
timeout", which is set in addition to reset_{sys,soc,arm}.

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
