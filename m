From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Tue, 30 Apr 2013 00:23:31 +0200
Message-ID: <2040099.REU8D4ds1g@avalon>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
 <6607610.omg016OAvj@avalon> <201304300004.20320.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201304300004.20320.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Clark <robclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Tuesday 30 April 2013 00:04:20 Arnd Bergmann wrote:
> On Monday 29 April 2013, Laurent Pinchart wrote:
> > On Monday 29 April 2013 23:31:30 Tomasz Figa wrote:
> > > Good point. Stephen, would it be a problem to make this a KMS driver
> > > instead? Old fbdev API could be emulated on top of it, until it goes out
> > > of use, couldn't it?
> > 
> > There's already an fbdev emulation layer in KMS, for such a simple use
> > case it will work fine.
> 
> I suggested the same to Stephen when he first brought up this driver.
> Unfortunately his attempt to create a simple KMS driver resulted in a
> significantly larger driver than the one he did for the framebuffer
> interface. This means that either Stephen did something really wrong in his
> attempt, or the KMS interface isn't as good as it should be if we want to
> move people away from frame buffer drivers.

Implementing a KMS driver requires a fair amount of code. The DRM/KMS 
subsystem provides helpers that significantly reduce the driver size. Those 
helpers have been designed around common use cases found in existing KMS 
drivers.

I'm pretty sure we will be able to add useful helpers for existing fbdev 
drivers that will make porting them to KMS pretty easy, but that first 
requires starting to port drivers to find out what common code could be 
factored out.

-- 
Regards,

Laurent Pinchart
