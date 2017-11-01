From: gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v3 0/2] max3421: add devicetree support
Date: Wed, 1 Nov 2017 18:01:50 +0100
Message-ID: <20171101170150.GA11504@kroah.com>
References: <cover.1508108927.git.jules.maselbas@grenoble-inp.org>
 <cover.1508798984.git.jules.maselbas@grenoble-inp.org>
 <20171101161237.GA30588@kroah.com>
 <2145557244.443021.1509555056126.JavaMail.zimbra@grenoble-inp.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2145557244.443021.1509555056126.JavaMail.zimbra-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Cc: robh <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, julia lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, mark rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 01, 2017 at 05:50:56PM +0100, Jules Maselbas wrote:
> Yes,
> 
> The first version of this patch series was already applied (on usb-next).
> I made new versions because I forgot that there are no rebase. So this is why I sent new patch.
> 
> The newest (v3) version has been split in two patch and also applied (on usb-testing).
>  9b796ffcd16dfaf820ecc6a9dc287e6d758a556e dt-bindings: usb: max3421: Interrupt-parent is optional
>  892f6ebc53ac1a12a26c21eb26d18064461a7007 usb: host: max3421-hcd: Remove pdata test in max3421_hub_control()
> 
> I am not sure, are theses patch fix-up?

If you are happy with all of the patches I've now taken, all is good :)

If not, please send me what needs to be applied.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
