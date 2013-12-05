From: Daniel Tang <dt.tangr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: chipidea: fix mistake in device tree binding of nspire-usb to use vendor name 'lsi' instead of SoC name 'zevio'
Date: Thu, 5 Dec 2013 21:10:37 +1100
Message-ID: <FAB4D64E-5DAD-4252-8B24-F076071D0279@gmail.com>
References: <1386148808-15065-1-git-send-email-dt.tangr@gmail.com> <20131204134433.GD1573@shlinux1.ap.freescale.net> <38AC4BA3-DE10-47A6-B3EF-26872A88AABD@gmail.com> <20131205084909.GA25943@shlinux1.ap.freescale.net>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131205084909.GA25943-KgLukfWpBlCctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 05/12/2013, at 7:49 PM, Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> On Thu, Dec 05, 2013 at 04:44:13PM +1100, Daniel Tang wrote:
>> Hi,
>> 
>> On 05/12/2013, at 12:44 AM, Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> 
>>> 
>>> lsi is vendor name, what are zevio and nspire?
>>> Usually, the compatible string should be "vendor_name,soc_name-module_name"
>>> 
>> 
>> Because this port uses documentation from reverse engineering, it's difficult to work out what is SoC specific and what is device specific. The SoC is Zevio but the driver is written for the TI-Nspire.
>> 
> 
> Please wrap the line to 80 characters.
> 
> The driver is written for the TI-Nspire, and you port this driver for
> SoC Zevio platform?

The TI-Nspire runs on the Zevio SoC.

> Since you use chipidea ip, we don't care the usb
> module name at your platform, we only care the soc name which you are
> running, it can detect the SoC platform at runtime.
> 

Yep, that's why the latest patch I sent in renames the device tree 
binding to "lsi,zevio-usb" since zevio is the name of the SoC that the 
TI-Nspire uses.

> At your dts patch, it still uses nspire-usb.
> http://marc.info/?l=linux-usb&m=138614886720024&w=2

I'll send a new one in right now.

> 
> Peter

Cheers,
Daniel Tang--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
