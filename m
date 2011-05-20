From: Anton Vorontsov <cbouatmailru@gmail.com>
Subject: Re: [PATCH] olpc_battery: bind to device tree
Date: Fri, 20 May 2011 19:21:18 +0400
Message-ID: <20110520152118.GA10699@oksana.dev.rtsoft.ru>
References: <20110219150644.681D59D401D@zog.reactivated.net>
 <AANLkTi=29myerzgH6WRCSOPKpaDnGgEtQacVHvxRoQT_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=29myerzgH6WRCSOPKpaDnGgEtQacVHvxRoQT_@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Daniel Drake <dsd@laptop.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, dwmw2@infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, dilinger@queued.net, dmitry.torokhov@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Feb 23, 2011 at 01:34:30PM -0700, Grant Likely wrote:
> [cc'ing devicetree-discuss@lists.ozlabs.org.  Please cc this list for
> any dt-related patches]
> 
> On Sat, Feb 19, 2011 at 8:06 AM, Daniel Drake <dsd@laptop.org> wrote:
> > Move from being statically probed by platform presence to binding to
> > the battery node of the device tree.
> >
> > This is cleaner and allows suspend/resume (wakeup) support to be added
> > in a later patch.
> >
> > Signed-off-by: Daniel Drake <dsd@laptop.org>
> 
> Hi Daniel, comments below.

Daniel,

I just wondering what happened with this patch?..

Thanks!

-- 
Anton Vorontsov
Email: cbouatmailru@gmail.com
