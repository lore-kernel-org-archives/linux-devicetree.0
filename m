From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] mfd: arizona: Update reset pin to use GPIOD
Date: Wed, 7 Mar 2018 17:53:03 +0000
Message-ID: <20180307175303.bl5qgn6tjzka5byf@localhost.localdomain>
References: <20180220163540.6704-1-ckeepax@opensource.cirrus.com>
 <20180307132812.r5epcs26clpnh72t@dell>
 <20180307141509.e3dpxteodxeoy2k3@localhost.localdomain>
 <20180307162537.pryp3qz3lgm7a4zs@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180307162537.pryp3qz3lgm7a4zs@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Wed, Mar 07, 2018 at 04:25:37PM +0000, Lee Jones wrote:
> On Wed, 07 Mar 2018, Charles Keepax wrote:
> 
> > On Wed, Mar 07, 2018 at 01:28:12PM +0000, Lee Jones wrote:
> > > On Tue, 20 Feb 2018, Charles Keepax wrote:
> > I would guess most of the time yes, but I would rather not assume
> > that. I can redo this as if's if you prefer it that way? The if is
> > slightly less lines although I do think the switch is much
> > clearer as to intent.
> > 
> > if (ret == -EPROBE_DEFER) {
> > 	return ret;
> > } else if (ret != -ENOENT && ret != -ENOSYS {
> > 	dev_err(arizona->dev, ....);
> > }
> 
> I don't know enough about the API to see why -ENOENT and -ENOSYS do
> not deserve error messages.
> 

ENOENT means the property was not found, and ENOSYS means that
there is no GPIOLIB built into the kernel.

In hindsight really I think this did deserve a comment. Basically
what is going on here, is we are supporting both the old and the
new binding, this is the code that looks for the old binding. If
we don't find anything then we don't want to print a message now
because we will print a message when we later check for the newer
binding. However if the binding is present but somehow invalid
then we would like to print the error. The newer binding read
later won't detect if the older binding is present and corrupt.

> What do the other users of the API do?
> 

Alas this looks like one of the first users.

Thanks,
Charles
