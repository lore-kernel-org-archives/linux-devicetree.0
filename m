From: Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] add devicetree bindings for rtc-m48t86
Date: Tue, 02 Apr 2013 08:44:10 +1100
Message-ID: <5159FFAA.5030205@gmail.com>
References: <1364766971-5914-1-git-send-email-alex@digriz.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1364766971-5914-1-git-send-email-alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org>
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
To: Alexander Clouter <alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/04/13 08:56, Alexander Clouter wrote:
> Currently there are two users of rtc-m48t86 (mach-ep93xx/ts72xx.c and
> mach-orion5x/ts78xx-setup.c) and both just use {read,write}b against
> a memory mapped region.  As I am devicetree'ing the TS-7800, this
> driver needs converting and thats what this patchset does.
> 
> The patch does the following:
>  * remove platform specific ops hooks, moving ioremap'ing and
> 	everything into the driver
>  * utilises named resources to indicate index/data ranges
>  * moves the RTC detection routine from ts78xx-setup.c into rtc-m48t86.c
>  * and, of course, enable devicetree hooks and include documentation
> 
> Awkward step, the first patch breaks both boards, the two following
> patches fix them.  Happy to re-work this if folks give me a pointer
> on how to do this in an acceptable way.

Sorry, that's no good. It breaks things like git bisect.

> 
> My vote is to break fast, fix fast, spend the time writing other code :)

The patch series will need to be reworked so that there is no
build/runtime breakage between any of the patches. I'll have a read
through and see if I can suggest something.

~Ryan


> Signed-off-by: Alexander Clouter <alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org>
> 
> Alexander Clouter (3):
>   rtc: rtc-m48t86: add devicetree bindings
>   arm: orion5x: fixup ts78xx to be able to use the rtc-m48t86 again.
>   arm: ep93xx: fixup ts72xx to be able to use the rtc-m48t86 again.
> 
>  .../devicetree/bindings/rtc/rtc-m48t86.txt         |   17 ++
>  arch/arm/mach-ep93xx/ts72xx.c                      |   29 +--
>  arch/arm/mach-orion5x/ts78xx-setup.c               |   79 ++----
>  drivers/rtc/rtc-m48t86.c                           |  254 +++++++++++++++-----
>  include/linux/m48t86.h                             |   16 --
>  5 files changed, 239 insertions(+), 156 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-m48t86.txt
>  delete mode 100644 include/linux/m48t86.h
> 
