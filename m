From: Peter Chen <Peter.Chen@freescale.com>
Subject: RE: [PATCH 1/2] usb: chipidea: fix mistake in device tree binding
 of nspire-usb to use vendor name 'lsi' instead of SoC name 'zevio'
Date: Fri, 6 Dec 2013 02:27:17 +0000
Message-ID: <F281D0F91ED19E4D8E63A7504E8A649804145971@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1386148808-15065-1-git-send-email-dt.tangr@gmail.com>
 <20131204134433.GD1573@shlinux1.ap.freescale.net>
 <38AC4BA3-DE10-47A6-B3EF-26872A88AABD@gmail.com>
 <20131205084909.GA25943@shlinux1.ap.freescale.net>
 <FAB4D64E-5DAD-4252-8B24-F076071D0279@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <FAB4D64E-5DAD-4252-8B24-F076071D0279@gmail.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Daniel Tang <dt.tangr@gmail.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

 
> 
> Hi,
> 
> On 05/12/2013, at 7:49 PM, Peter Chen <Peter.Chen@freescale.com> wrote:
> 
> > On Thu, Dec 05, 2013 at 04:44:13PM +1100, Daniel Tang wrote:
> >> Hi,
> >>
> >> On 05/12/2013, at 12:44 AM, Peter Chen <Peter.Chen@freescale.com>
> wrote:
> >>
> >>>
> >>> lsi is vendor name, what are zevio and nspire?
> >>> Usually, the compatible string should be "vendor_name,soc_name-
> module_name"
> >>>
> >>
> >> Because this port uses documentation from reverse engineering, it's
> difficult to work out what is SoC specific and what is device specific.
> The SoC is Zevio but the driver is written for the TI-Nspire.
> >>
> >
> > Please wrap the line to 80 characters.
> >
> > The driver is written for the TI-Nspire, and you port this driver for
> > SoC Zevio platform?
> 
> The TI-Nspire runs on the Zevio SoC.
> 
> > Since you use chipidea ip, we don't care the usb
> > module name at your platform, we only care the soc name which you are
> > running, it can detect the SoC platform at runtime.
> >
> 
> Yep, that's why the latest patch I sent in renames the device tree
> binding to "lsi,zevio-usb" since zevio is the name of the SoC that the
> TI-Nspire uses.
> 
> > At your dts patch, it still uses nspire-usb.
> > http://marc.info/?l=linux-usb&m=138614886720024&w=2
> 
> I'll send a new one in right now.

OK, in order to avoid changing name again, I will queue your patch at my pending
chipidea tree until your dts has applied by arch or dts maintainer, notify me
when they are ready.

Peter



