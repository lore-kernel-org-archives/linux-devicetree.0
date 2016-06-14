From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] usb: phy: mxs: Add DT bindings to configure TX
 settings
Date: Tue, 14 Jun 2016 10:06:57 +0800
Message-ID: <20160614020657.GA25052@shlinux2>
References: <1458577947-12614-1-git-send-email-jaret.cantu@timesys.com>
 <20160323043638.GA18462@peterchendt>
 <56F2D43D.1040404@timesys.com>
 <56F2DDB7.7070700@timesys.com>
 <20160324022117.GA5301@peterchendt>
 <57588DA8.4050000@timesys.com>
 <CAL411-of2Phqx18LBaGt6FMg5DxaJesRYvrRzsfSNyJRopsUZQ@mail.gmail.com>
 <CAENNV6+978syhexzQber58xuai=grC2_TsVF3GmHCAp_Zj=HZQ@mail.gmail.com>
 <20160612032538.GB22054@shlinux2>
 <575F1A57.6030807@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <575F1A57.6030807-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Cc: Justin Waters <justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2016 at 04:40:55PM -0400, Jaret Cantu wrote:
> >
> >According to your previous information, the single formula can't be used
> >to get D_CAL value, do you have any good ways except for using a table?
> 
> That is not exactly what I said:
> 
> "I can't find any formula which would hit all of those same
> percentages **without rounding up.**"
> 

Sorry, my careless.

> I did find a formula that hits all of the percentages with rounding
> up, and I listed this formula (in shell form) previously. The
> rounding (+ (119-80)/2) just makes it look a little more awkward
> than I would like:
> 
> $ for d in 119 116 114 112 109 106 103 100 97 95 93 90 88 86 83 79;
> do echo "$d="$(( ( (119-$d) * 0xf + (119-80)/2 ) / (119-80) ));
> d=$((d+1)); done
> 119=0
> 116=1
> 114=2
> 112=3
> 109=4
> 106=5
> 103=6
> 100=7
> 97=8
> 95=9
> 93=10
> 90=11
> 88=12
> 86=13
> 83=14
> 79=15
> 
> These current percentage/register value pairs match the D_CAL table.
> 
> 
> > Sending the patch for new algorithm to speed up this issue please.
> >
> There were also some Documentation changes from between when I
> created this patch and the current HOL for which I had to modify the
> patch.

I will review and test your v4 patch, thanks.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
