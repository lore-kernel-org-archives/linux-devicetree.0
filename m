From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: maxbotix,i2cxl: Add MaxBotix i2c
 ultrasonic rangers
Date: Tue, 12 Mar 2019 11:39:30 -0500
Message-ID: <20190312163930.GA30288@bogus>
References: <20190301134225.susjgtck4iktkbeg@arbad>
 <20190302182639.48e73885@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190302182639.48e73885@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andreas Klinger <ak@it-klinger.de>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mark.rutland@arm.com, afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, gregkh@linuxfoundation.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, songqiang1304521@gmail.com, treding@nvidia.com, techsupport@maxbotix.com
List-Id: devicetree@vger.kernel.org

On Sat, Mar 02, 2019 at 06:26:39PM +0000, Jonathan Cameron wrote:
> On Fri, 1 Mar 2019 14:42:27 +0100
> Andreas Klinger <ak@it-klinger.de> wrote:
> 
> > Add doc for dt binding maxbotix,i2cxl. This binding is for MaxBotix
> > I2CXL-MaxSonar ultrasonic rangers which share a common i2c interface.
> 
> I'm a bit confused on the naming. Certainly the binding should have
> separate entries for each supported part, rather than a group one
> for their i2cxl naming.  Having said that they do have a wide
> range of parts with only the one datasheet.
> 
> Rob, what do you think?  Go with this i2cxl naming
> or list the individual supported parts?

Looks like the difference is mainly just the range. Is that something 
s/w needs to know about?

> 
> mb1202, mb1212, mb1222, mb1232, mb1242, mb7040, 
> mb7137?

OTOH, that's not really too many.

Rob
