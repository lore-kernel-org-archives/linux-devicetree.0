From: Robin van der Gracht <robin@protonic.nl>
Subject: Re: [PATCH v6 0/3] auxdisplay: Introduce ht16k33 driver
Date: Thu, 19 May 2016 10:54:18 +0200
Message-ID: <20160519105418.5df3c8f7@erd979>
References: <1463574199-21077-1-git-send-email-robin@protonic.nl>
	<20160518150924.GA3871@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160518150924.GA3871@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Matt Ranostay <mranostay@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "David S . Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Guenter Roeck <linux@roeck-us.net>, Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 May 2016 08:09:24 -0700
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Wed, May 18, 2016 at 02:23:16PM +0200, Robin van der Gracht wrote:
> > This patchset adds a new driver to the auxdisplay subsystem. It
> > also adds devicetree bindings documentation and a new vendor prefix.
> > 
> > I added myself as maintainer to the MAINTAINERS file.  
> 
> First off, if you want me to apply patches, put me in the to: line,
> and say so, otherwise I don't know.

Ack

> 
> Secondly, it's the middle of the merge window, and we can't take new
> patches into our trees (go read Documentation/development_model
> please), so this will have to wait until after 4.7-rc1 is out.

Thats fine with me.

> 
> Thirdly, I need an ack for the DT-related change before I can accept
> that, hopefully you included the correct people on it.

Rob (re)acked the patches this morning. I'll try not to forget to
re-add acks when I resubmit patches.

> 
> And 4th, what is with the insane number of people on cc:?  Use
> get_maintainer.pl correctly please, and don't just hit everyone you
> can possibly think of with a cc: for no good reason.

I did use the get_maintainer script. I solely passed the patch set as
command line argument.

> 
> I'll put this in my "to-review" queue to look at after 4.7-rc1 is out.

Thanks Greg.

Robin van der Gracht
