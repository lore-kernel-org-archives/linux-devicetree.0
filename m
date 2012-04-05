From: Eric Andersson <eric.andersson@unixphere.com>
Subject: Re: [PATCHv3 3/3] misc: add support for bmp18x chips to the bmp085
 driver
Date: Thu, 5 Apr 2012 08:53:49 +0200
Message-ID: <20120405065349.GA7346@skinner.xfiles.lan>
References: <1333568759-13536-1-git-send-email-eric.andersson@unixphere.com>
 <1333568759-13536-4-git-send-email-eric.andersson@unixphere.com>
 <20120404195532.GB10787@opensource.wolfsonmicro.com>
 <201204042000.34160.arnd@arndb.de>
 <20120404201116.GC10787@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120404201116.GC10787@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, alan@lxorguk.ukuu.org.uk, zhengguang.guo@bosch-sensortec.com, peter.moeller@cn.bosch.com, stefan.nilsson@unixphere.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi,

Thanks for the review guys!

On 21:11 Wed 04 Apr     , Mark Brown wrote:
> On Wed, Apr 04, 2012 at 08:00:33PM +0000, Arnd Bergmann wrote:
> > On Wednesday 04 April 2012, Mark Brown wrote:
> > > > +static const struct of_device_id bmp085_of_match[] = {
> > > > +     { .compatible = "bosch-sensortec,bmp085", },
> 
> > > Traditionally the stock ticker symbol would be used.
> 
> > I though about commenting on that as well, but since Bosch is a foundation
> > and not publically traded, that would be hard to accomplish. Is there
> > an official fallback for companies that don't have a stock ticker symbol?
> 
> Guess we should ask the DT people...  I mostly just noticed that the
> name appeared somewhat verbose - perhaps just plain "bosch" if there's
> not a better abbrevation?

If there are no further objections let's go with "bosch". I'll prepare a
new patch-set ASAP.

-- 
Best regards,
 Eric

http://www.unixphere.com
