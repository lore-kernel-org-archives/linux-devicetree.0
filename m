From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC 4/5] clk: iproc: define Broadcom NS2 iProc clock binding
Date: Wed, 14 Oct 2015 09:53:59 -0700
Message-ID: <561E88A7.2090808@broadcom.com>
References: <1444771347-11382-1-git-send-email-jonmason@broadcom.com>
 <1444771347-11382-5-git-send-email-jonmason@broadcom.com>
 <561D84B4.4000002@broadcom.com> <20151014154410.GF15160@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151014154410.GF15160-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/14/2015 8:44 AM, Jon Mason wrote:
> On Tue, Oct 13, 2015 at 03:24:52PM -0700, Ray Jui wrote:
>> Same as this patch. I thought device tree binding document should go
>> with the clock driver changes.
>>
>> Strictly speaking, device tree binding document should always go before
>> the driver changes. In the binding document the DT interface is defined,
>> then changes are implemented in the driver.
> 
> I split them off this way due to the clk maintainer not wanting to
> pull in any device tree changes.  Since the documentation is for the
> device tree enties, it makes logical sense to me that they be in the
> same device tree series.  If Stephen will pull these in with the clk
> changes, I am more than happy to have it done by him :)
> 
> Thanks,
> Jon

Yeah the clock maintainers do not pull in device tree changes like
*.dtsi and *.dts. But they do take changes including the binding
documents and clock driver changes. You can confirm with Stephen.

Thanks,

Ray
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
