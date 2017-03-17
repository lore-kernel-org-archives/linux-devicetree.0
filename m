From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v4 1/3] mfd: wm831x: Add basic device tree binding
Date: Fri, 17 Mar 2017 09:44:57 +0000
Message-ID: <20170317094457.GN6986@localhost.localdomain>
References: <1489592384-11510-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170316140019.eoe757vox5wrlkmu@dell>
 <20170316143144.GL6986@localhost.localdomain>
 <20170317091502.kzcrhj7vlku5mtq7@dell>
 <20170317092520.GM6986@localhost.localdomain>
 <20170317093720.ggraoffx6d6rggtw@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170317093720.ggraoffx6d6rggtw@dell>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 17, 2017 at 09:37:20AM +0000, Lee Jones wrote:
> On Fri, 17 Mar 2017, Charles Keepax wrote:
> 
> > On Fri, Mar 17, 2017 at 09:15:02AM +0000, Lee Jones wrote:
> > > On Thu, 16 Mar 2017, Charles Keepax wrote:
> > > 
> > > > On Thu, Mar 16, 2017 at 02:00:19PM +0000, Lee Jones wrote:
> > > > > On Wed, 15 Mar 2017, Charles Keepax wrote:
> > > > > > +	if (i2c->dev.of_node) {
> > > > > > +		const struct of_device_id *id = of_match_device(wm831x_of_match,
> > > > > > +								&i2c->dev);
> > > > > 
> > > > > Not keen on this.  Please declare the variable up with the others.
> > > > > 
> > > > 
> > > > They are never going to be used anywhere else in the function.
> > > > Again I can if you feel strongly but isn't it really better to
> > > > limit the scope of the variables if they are only being used
> > > > locally.
> > > 
> > > I understand the motivation, but if we did that all the time, the code
> > > would look pretty dire IMHO.
> > > 
> > 
> > Ok I do another spin.
> > 
> > > > > > +		unsigned long of_type = (unsigned long)id->data;
> > > > > 
> > > > > And this one.
> > > > > 
> > > > > > +		type = (enum wm831x_parent)of_type;
> > > > > 
> > > > > Looks like you don't even need of_type.
> > > > > 
> > > > > Just cast id->data straight into wm81x_parent.
> > > > 
> > > > Pretty sure you will get a warning on 64-bit systems if I do
> > > > that.
> > > 
> > > What makes you think that?
> > > 
> > 
> > commit 942786e6e647cef94cf96dcd836d343be55fc452
> > Author: Lee Jones <lee.jones@linaro.org>
> > mfd: arizona: Rid data size incompatibility warn when building for 64bit
> > 
> > I am fairly sure an enum would get treated the same as an int by
> > the compiler. I will try it and see.
> 
> I already prototyped it.  No warnings seen.
> 

Cool thanks, the weird corners of C never cease to amaze me I
will update the patch and resend.

Thanks,
Charles
