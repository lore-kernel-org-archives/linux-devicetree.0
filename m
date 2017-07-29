From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] staging: pi433: fix problem with division in
 rf69_set_deviation
Date: Sat, 29 Jul 2017 15:21:27 -0700
Message-ID: <20170729222127.GB16460@kroah.com>
References: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
 <201707172156.DCyTyWc2%fengguang.wu@intel.com>
 <652336354.3806.1500549785404@ox.hosteurope.de>
 <20170720113705.d65hxm3jbki2ynqd@mwanda>
 <CAMuHMdVgw=V6f8wzcXvS3gk8GK0bOpdgs_jxL6Y_X9idJD_x3Q@mail.gmail.com>
 <255867683.7064.1500566196444@ox.hosteurope.de>
 <20170729000118.GA28861@kroah.com>
 <1812078351.11080.1501318275697@ox.hosteurope.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1812078351.11080.1501318275697@ox.hosteurope.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Cc: driverdevel <devel@driverdev.osuosl.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, "kbuild-all@01.org" <kbuild-all@01.org>, Grant Likely <grant.likely@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 29, 2017 at 10:51:15AM +0200, Marcus Wolf wrote:
> Hi Greg,
>  
> already had a discussion concerning that patch with Dan yesterday.
> I really don't know what's going on there. I detached the patch once more from
> my outbox and had a very close look in an editor and looked at it with a
> difftool. In my outbox the patch is fine. I really don't knwo why it reaches you
> crapped.
>  
> Since there are contsant problems with my patches, I will stop sending patches
> for a while. As soon as I can find time to deeply confess with the tooling, I
> will start over with trying.

Just use 'git send-email' for patches if you are having problems with
your email client.  And get a better email client the kernel
Documentation has a whole file just about that topic and how to do it
correctly.

> Concerning this patch: You can use Arnds Patch from yesterday instead:
> [PATCH] staging: pi433: use div_u64 for 64-bit division
> It's a bit different to my patch, but according to yesterdays discussion, it
> should also fix the problem.

I already took it into my tree.

thanks,

greg k-h
