From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v3 03/14] media: ov7670: hook s_power onto v4l2 core
Date: Sun, 13 Jan 2019 17:38:55 +0100
Message-ID: <0f9b127c407cebb390ca0a4f5d923e7aef1359c9.camel@v3.sk>
References: <20181120100318.367987-1-lkundrak@v3.sk>
         <20181120100318.367987-4-lkundrak@v3.sk>
         <20181122122146.a6wydozsg676i3w7@valkosipuli.retiisi.org.uk>
         <868bd721260bc8948835fe2a697a047ae2277cd0.camel@v3.sk>
         <20190110165903.gcedksczp5tmkl5t@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110165903.gcedksczp5tmkl5t@valkosipuli.retiisi.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>, Libin Yang <lbyang@marvell.com>, Albert Wang <twang13@marvell.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2019-01-10 at 18:59 +0200, Sakari Ailus wrote:
> Hi Lubomir,
> 
> On Wed, Nov 28, 2018 at 12:29:33PM +0100, Lubomir Rintel wrote:
> > On Thu, 2018-11-22 at 14:21 +0200, Sakari Ailus wrote:
> > > Hi Lubomir,
> > > 
> > > On Tue, Nov 20, 2018 at 11:03:08AM +0100, Lubomir Rintel wrote:
> > > > The commit 71862f63f351 ("media: ov7670: Add the ov7670_s_power function")
> > > > added a power control routing. However, it was not good enough to use as
> > > > a s_power() callback: it merely flipped on the power GPIOs without
> > > > restoring the register settings.
> > > > 
> > > > Fix this now and register an actual power callback.
> > > > 
> > > > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > > > 
> > > > ---
> > > > Changes since v2:
> > > > - Restore the controls, format and frame rate on power on
> > > > 
> > > >  drivers/media/i2c/ov7670.c | 50 +++++++++++++++++++++++++++++++++-----
> > > >  1 file changed, 44 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
> > > > index ead0c360df33..cbaab60aaaac 100644
> > > > --- a/drivers/media/i2c/ov7670.c
> > > > +++ b/drivers/media/i2c/ov7670.c
> ...
> > > > @@ -1945,7 +1983,7 @@ static int ov7670_remove(struct i2c_client *client)
> > > >  	v4l2_ctrl_handler_free(&info->hdl);
> > > >  	clk_disable_unprepare(info->clk);
> > > >  	media_entity_cleanup(&info->sd.entity);
> > > > -	ov7670_s_power(sd, 0);
> > > > +	ov7670_power_off(sd);
> > > >  	return 0;
> > > >  }
> > > >  
> > > 
> > > Could you consider instead switching to runtime PM? A few drivers such as
> > > the ov2685 driver does that already.
> > 
> > Yes, I'll take a look. Thanks for the suggestion. I didn't know such
> > thing exists, so it may take some time for me to grasp it though.
> 
> I'm be tempted to merge the ov7670 patches as they significantly improve
> the driver, even if we're at the moment missing the runtime PM conversion.
> It could be done later on as well.
> 
> Would that be ok for you?

Yes, I'm fine with it. In fact, I'm happy about it.

I'd eventually like to implement the runtime PM, but it's not going to
happen before 5.1 merge window.

Cheers
Lubo
