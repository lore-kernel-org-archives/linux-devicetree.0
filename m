From: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Subject: Re: [PATCH v3 0/2] max3421: add devicetree support
Date: Wed, 1 Nov 2017 17:50:56 +0100 (CET)
Message-ID: <2145557244.443021.1509555056126.JavaMail.zimbra@grenoble-inp.org>
References: <cover.1508108927.git.jules.maselbas@grenoble-inp.org> <cover.1508798984.git.jules.maselbas@grenoble-inp.org> <20171101161237.GA30588@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171101161237.GA30588-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: robh <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, julia lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, mark rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Yes,

The first version of this patch series was already applied (on usb-next).
I made new versions because I forgot that there are no rebase. So this is why I sent new patch.

The newest (v3) version has been split in two patch and also applied (on usb-testing).
 9b796ffcd16dfaf820ecc6a9dc287e6d758a556e dt-bindings: usb: max3421: Interrupt-parent is optional
 892f6ebc53ac1a12a26c21eb26d18064461a7007 usb: host: max3421-hcd: Remove pdata test in max3421_hub_control()

I am not sure, are theses patch fix-up?

Thanks,
Jules.

----- Le 1 Nov 17, à 17:12, gregkh gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org a écrit :

> On Tue, Oct 24, 2017 at 01:08:41AM +0200, Jules Maselbas wrote:
>> Hi,
>> 
>> This patchset adds devicetree support to the max3421 driver.
>> Theses modification are based on a previous (unapplied) patch
>> series by Alexander Amelkin [1].
> 
> I've already applied this series, right?  If there were any changes from
> the older patch that I applied, can you send a fix-up patch?
> 
> thanks,
> 
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
