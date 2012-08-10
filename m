From: Johannes Stezenbach <js@sig21.net>
Subject: Re: DT GPIO numbering?
Date: Fri, 10 Aug 2012 11:34:58 +0200
Message-ID: <20120810093458.GA13192@sig21.net>
References: <20120801152240.GA16388@sig21.net>
 <CACRpkdZryc95WpSXddCrLvZGDsv4x-ndX9XcVzoxaDCT53AFLw@mail.gmail.com>
 <501F296B.4070004@wwwdotorg.org>
 <CACRpkdZ8AO5SrjJvJxvpauEadQOKMNaW_Pxxzhjk5hWnVB1b+g@mail.gmail.com>
 <20120806095805.GA16607@sig21.net>
 <501FA608.1030805@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <501FA608.1030805@firmworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mitch Bradley <wmb@firmworks.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 06, 2012 at 07:10:00PM +0800, Mitch Bradley wrote:
> On 8/6/2012 5:58 PM, Johannes Stezenbach wrote:
> > On Mon, Aug 06, 2012 at 08:35:51AM +0200, Linus Walleij wrote:
> >> On Mon, Aug 6, 2012 at 4:18 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> >>
> >>> I can't comment on the sysfs-vs-dev interface location, but I don't
> >>> think it addresses Johannes' issue; finding out which GPIO IDs are
> >>> provided by which devices.
> >>>
> >>> Perhaps in each device's sysfs node, there should be some information
> >>> re: which GPIO range it provides. Right now, perhaps a text file with
> >>> the GPIO base it it.
> >>
> >> Yes that could work ...
> > 
> > The method used by the gpio-mxs.c driver (of_alias_get_id)
> > would also work.  The question is which method is preferable.
> > 
> > Ideally I would like to use DT attributes to identify my GPIOs
> > in the same way as they appear in the schematics.  E.g.
> > one device may have GPIOs called PORT_A.0 to PORT_A.7,
> > another one may be EXT.0 to EXT.15.  But a single integer ID
> > is good enough since GPIO usage is platform specific anyway.
> > However, the mapping must be static and not depend e.g. on
> > module load order like now if you use pl061 and some i2c GPIO.
> > Software must be able to rely on that e.g. GPIO ID 11
> > always refers to EXT.3.
> 
> There is precedence for a "slot-names" property that correlates specific
> hardware entities with physical labels.  It has been applied to PCI
> plug-in slots and to other devices.  See, for example,
> http://www.openfirmware.org/1275/proposals/Closed/Accepted/381-it.txt

Sorry about the slow response.  After thinking it through I decided
that a) adding ad-hoc DT bindings isn't good, and b) doing
it properly is above my head atm (I have too many other tasks to
take care of).  So I decided to use platform data to get stable
GPIO numbers and names for now.

Actually I think the kernel internal GPIO numbers shouldn't be in the
sysfs API, instead userspace should use the names.  Probably it's
best to not use /sys/class/gpio/export but instead let the board
init code export the GPIOs available to userspace with proper names.
Not sure yet...


Thanks,
Johannes
