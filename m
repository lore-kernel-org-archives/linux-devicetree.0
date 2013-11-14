From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] input: tc3589x-keypad: support probing from
 device tree
Date: Thu, 14 Nov 2013 11:12:45 +0000
Message-ID: <20131114111245.GF16396@e106331-lin.cambridge.arm.com>
References: <1384265618-10590-1-git-send-email-linus.walleij@linaro.org>
 <20131112153057.GA9683@earth.universe>
 <CACRpkdb_bryGJo7CKGP5tj3RFGv=Gh+Q5m9ucVKqJ068tjPC2g@mail.gmail.com>
 <20131112200514.GA15413@earth.universe>
 <CACRpkdaAaLjm_b+OLj3tobxBN8YGUcTPnXJ=qtBqd02=FTxhjQ@mail.gmail.com>
 <20131112204013.GA17674@earth.universe>
 <20131113142406.GH21713@e106331-lin.cambridge.arm.com>
 <20131113232923.GB13669@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131113232923.GB13669-SfvFxonMDyemK9LvCR3Hrw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 13, 2013 at 11:29:24PM +0000, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Nov 13, 2013 at 02:24:06PM +0000, Mark Rutland wrote:
> > > Current suggestions (taken from kernel) are:
> > > 
> > > * <<vendor>>,no-autorepeat
> > > * keypad,autorepeat
> > > * linux,keypad-no-autorepeat
> > > * linux,input-no-autorepeat
> > > * linux,no-autorepeat
> > > * autorepeat
> > > 
> > > I do not really care, which one is chosen, except for two things:
> > > 
> > > * <<vendor>> seems wrong. This is not vendor specific.
> > > * I would prefer "input-" over "keypad-", since then the same name
> > >   can be used for single keys, buttons, etc.
> > 
> > Both of those sound valid to me, but I think it may make sense to keep
> > the "linux," prefix. As I understand it this is really telling the Linux
> > input subsystem to react to a device acting in a certain way, rather
> > than describing or configuring the device in a certain way.
> 
> That leaves the following two options:
> 
> * linux,input-no-autorepeat
> * linux,no-autorepeat
> 
> Any suggestions for those?

I'd go for "linux,input-no-autorepeat", it leaves less ambiguity as to
its purpose.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
