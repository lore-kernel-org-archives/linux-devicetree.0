From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Wed, 08 May 2013 15:58:30 -0500
Message-ID: <1368046710.18069.217@driftwood>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
 <201304300004.20320.arnd@arndb.de> <5182AF83.4080705@wwwdotorg.org>
 <1956593.M6NmITdEKh@avalon>
 <20130507143338.79b3d893fcdc3bd79fbe9a57@linux-foundation.org>
 <5189BA36.9000105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="Flowed"; DelSp="Yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5189BA36.9000105-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> (from swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org on
 Tue May  7 21:36:38 2013)
Content-Disposition: inline
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Clark <robclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/07/2013 09:36:38 PM, Stephen Warren wrote:
> On 05/07/2013 03:33 PM, Andrew Morton wrote:
...
> Subject: drivers/video: implement a simple framebuffer driver
> 
> A simple frame-buffer describes a raw memory region that may be  
> rendered
> to, with the assumption that the display hardware has already been set
> up to scan out from that buffer.
> 
> This is useful in cases where a bootloader exists and has set up the
> display hardware, but a Linux driver doesn't yet exist for the display
> hardware.
> 
> Examples use-cases include:

Virtual environments such as QEMU.

Rob
