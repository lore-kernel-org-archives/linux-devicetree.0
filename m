From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 2/4] mfd: lubbock_cplds: add lubbock IO board
Date: Wed, 25 Mar 2015 15:07:25 +0100
Message-ID: <20150325140725.GA11499@kroah.com>
References: <20150216130549.GF14545@x1>
 <1170550770.470129293.1424093248596.JavaMail.root@zimbra1-e1.priv.proxad.net>
 <20150216162712.GR14545@x1>
 <87fva5a4i2.fsf@free.fr>
 <20150217074310.GT14545@x1>
 <alpine.LFD.2.11.1502171221300.22104@knanqh.ubzr>
 <20150218080719.GB5781@x1>
 <87a9088tam.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87a9088tam.fsf@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 20, 2015 at 05:02:57PM +0100, Robert Jarzmik wrote:
> Lee Jones <lee.jones@linaro.org> writes:
> >> > Arnd, Greg,
> >> > 
> >> >   Perhaps you have some ideas WRT programmables (PLDs/CPLDs/FPGAs)?
> 
> Hi Arnd and Greg,
> 
> I have this driver I'm upstreaming, which comes out of
> arch/arm/mach-pxa/lubbock.c. As for the reason it is extracted, see submitted
> commit [1] for reference.
> 
> The main question is : where does it belong in the kernel ?
> 
> The driver is :
>  - for the CPLDs on the Lubbock development platform, which is more or less an
>    old motherboard for Intel Xscale pxa255 SoC (see [2] for more details)
>  - these CPLDs control :
>    - interrupt muxing towards the SoC
>    - several leds
>    - switches read back
>    For the whole patch, see [4]
> 
> Lee's position is that it doesn't belong to drivers/mfd, see [3].
> 
> So where should I submit it ? And more generally, where should CPLDs drivers be
> pushed in the kernel tree ?
> 
> If there is no solution, I'll fallback through arch/arm/plat-pxa, not very nice,
> but it has to land somewhere, I don't want lubbock to remain broken.

drivers/platform/arm ?
