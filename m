From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
Date: Fri, 5 May 2017 09:35:48 +0800
Message-ID: <dff34fc5-bd04-4053-af4e-da12d3a824ef@ozlabs.org>
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
 <eb310c6a-0b41-aecd-2ae5-025a8f64b152@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eb310c6a-0b41-aecd-2ae5-025a8f64b152-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Eddie,

> I have no problem with this as an example, but it isn't exactly how the
> tree will look under the p8/p9 fsi-attached i2c master. We will instead
> need a list of ports on the master. Then you could put actual devices
> (eeproms, etc) under the ports if desired.

Yes, this was intended as a fairly simple example. That's a good point
though, and I'll change the compatible string there so that I'm not
implying that it's representing the actual FSI I2c device that we're
working on.

Thanks for the review.

Cheers,


Jeremy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
