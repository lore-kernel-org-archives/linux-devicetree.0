From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Submit of a driver for Pi433 - a radio module for Raspberry Pi
Date: Wed, 12 Jul 2017 09:43:05 +0200
Message-ID: <20170712074305.GA20198@kroah.com>
References: <281067739.16216.1499788929736@ox.hosteurope.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <281067739.16216.1499788929736@ox.hosteurope.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcus Wolf <linux@wolf-entwicklungen.de>
Cc: grant.likely@linaro.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 11, 2017 at 06:02:09PM +0200, Marcus Wolf wrote:
> Hi folks,
> 
> I developed a radio shield for the 433MHz ISM band [0] for the Raspberry Pi.
> This shield is called Pi433 [1]. It can be used to communicate between two
> Raspberries or to control third party equipment e. g. cheap radio sockets [2].
> The base of this radio shield is a radio module from HopeRf - a rfm69cw-433s2.
>  
> In the beginning, I conrolled the rf69 chip by direct access via SPI, but I
> figured out, that several tasks were hard to handle. Especially the following
> points were annoying:
> * Just one process could open the SPI interface so just one process was
>   able to access the module
> * A simultaneous send and receive was very hard to implement
> 
> Therefore I started to implement a driver.
> The drivers features:
> * simple access/nice abstraction of spi registers via open, close,
>   read, write and ioctl
> * multiple applications can open
> * tx requests are queued, so every app can send a tx request at any time
> * first app asking for rx will block other apps, also asking for rx until one
> rx
>   cycle is complete
> * rx cycle means listening on the air until something appears
> * if an app wants to tx during the driver is waiting in rx cycle, rx will be
>   shortly interrupted to do the tx task
> * for each tx task a seperate configuration of the rf chip (bitrate,
> modulation, ...)
>   can be chosen
> * wrtten in modular architecture, allowing to extend for other products with
>   rf69 chip (e.g. rfm69hcw, ...) or even to support other HopeRf chips with
> similar
>   interface (e. g. rfm12, rfm95, ...)
>  
> In principle the driver was intended to be used by my project (Smarthome-Pi),
> only.
> But while having all this nice features, I was asked, whether I could offer the
> driver to the community. I never did that before, so I started reading about
> submitting drivers and figured out, that there is a lot of work to do, to meet
> all
> concepts and ideas of complying to kernel code. I spend some days and modified
> a lot, but still, a lot of things aren't perfect.
> Already known tasks are:
> 
> * coding style does not fully comply with the kernel style guide.
> * still TODOs, annotated in the code
> * currently the code introduces new IOCTLs. I'm afraid this is a bad idea.
>   Replace this with another interface, hints are welcome!
>  
> I tested the patch on Raspbian with Kernel v4.12 and applied the patch on
> mainline Linux v4.12
>  
> Is it posibble to integrate into the staging area to ease further development?

Sure, I'm always glad to take new drivers, but can you submit it as just
a single patch, and keep it self-contained (i.e. nothing outside of
drivers/staging/YOUR_DRIVER/)?

thanks,

greg k-h
