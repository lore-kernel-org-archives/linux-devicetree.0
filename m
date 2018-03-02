Return-Path: <robherring2@gmail.com>
Date: Fri, 2 Mar 2018 12:59:00 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [v5 2/2] media: dt-bindings: Add bindings for Dongwoon DW9807
 voice coil
Message-ID: <20180302185900.cj4hpt5qqinhyvnt@rob-hp-laptop>
References: <1519402422-9595-1-git-send-email-andy.yeh@intel.com>
 <1519402422-9595-3-git-send-email-andy.yeh@intel.com>
 <CAL_JsqKd8dxF1eSkST1GyKCS_bkzALv2aGHC9TXHWfnrxx33SQ@mail.gmail.com>
 <20180228133126.cusxnid64xd5uawu@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180228133126.cusxnid64xd5uawu@paasikivi.fi.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Yeh <andy.yeh@intel.com>, linux-media@vger.kernel.org, Tomasz Figa <tfiga@google.com>, devicetree@vger.kernel.org, Alan Chiang <alanx.chiang@intel.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Feb 28, 2018 at 03:31:26PM +0200, Sakari Ailus wrote:
> Hi Rob,
> 
> Thanks for the review.
> 
> On Tue, Feb 27, 2018 at 04:10:31PM -0600, Rob Herring wrote:
> > On Fri, Feb 23, 2018 at 10:13 AM, Andy Yeh <andy.yeh@intel.com> wrote:
> > > From: Alan Chiang <alanx.chiang@intel.com>
> > >
> > > Dongwoon DW9807 is a voice coil lens driver.
> > >
> > > Also add a vendor prefix for Dongwoon for one did not exist previously.
> > 
> > Where's that?
> 
> Added by aece98a912d92444ea9da03b04269407d1308f1f . So that line isn't
> relevant indeed and should be removed.
> 
> > 
> > >
> > > Signed-off-by: Andy Yeh <andy.yeh@intel.com>
> > > ---
> > >  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807.txt | 9 +++++++++
> > 
> > DACs generally go in bindings/iio/dac/
> 
> We have quite a few lens voice coil drivers under bindings/media/i2c now. I
> don't really object to putting this one to bindings/iio/dac but then the
> rest should be moved as well.
> 
> The camera LED flash drivers are under bindings/leds so this would actually
> be analoguous to that. The lens voice coil drivers are perhaps still a bit
> more bound to the domain (camera) than the LED flash drivers.

The h/w is bound to that function or just the s/w?

> I can send a patch if you think the existing bindings should be moved; let
> me know.

I'm okay if they are separate as long as we're not going to see the 
same device show up in both places. However, "i2c" is not the best 
directory choice. It should be by function, so we can find common 
properties.

Rob
