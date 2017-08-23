From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 1/3] dt: bindings: Document DT bindings for Analog
 devices as3645a
Date: Wed, 23 Aug 2017 10:33:15 +0300
Message-ID: <20170823073315.clz5u5pbontskrvm@paasikivi.fi.intel.com>
References: <20170819212410.3084-1-sakari.ailus@linux.intel.com>
 <20170819212410.3084-2-sakari.ailus@linux.intel.com>
 <20170823002810.d4qiyghf4ti4vpa2@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170823002810.d4qiyghf4ti4vpa2@rob-hp-laptop>
Sender: linux-leds-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, javier@dowhile0.org, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Aug 22, 2017 at 07:28:10PM -0500, Rob Herring wrote:
> On Sun, Aug 20, 2017 at 12:24:08AM +0300, Sakari Ailus wrote:
> > From: Sakari Ailus <sakari.ailus@iki.fi>
> 
> Commit msg?

I'll add:

Document DT bindings for analog devices as3645a flash LED controller which
also supports an indicator LED.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Shouldn't author and SoB be the same email?

I'll change that.

> 
> > ---
> >  .../devicetree/bindings/leds/ams,as3645a.txt       | 71 ++++++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/ams,as3645a.txt
> 
> Otherwise,
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks!

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
