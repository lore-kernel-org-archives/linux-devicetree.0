From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Thu, 02 May 2013 12:25:07 -0600
Message-ID: <5182AF83.4080705@wwwdotorg.org>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
 <1556968.7tR6KuEIWb@flatron> <6607610.omg016OAvj@avalon>
 <201304300004.20320.arnd@arndb.de>
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
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Clark <robclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/29/2013 04:04 PM, Arnd Bergmann wrote:
> On Monday 29 April 2013, Laurent Pinchart wrote:
>> On Monday 29 April 2013 23:31:30 Tomasz Figa wrote:
>>
>>> Good point. Stephen, would it be a problem to make this a KMS driver
>>> instead? Old fbdev API could be emulated on top of it, until it goes out
>>> of use, couldn't it?
>>
>> There's already an fbdev emulation layer in KMS, for such a simple use case it 
>> will work fine.
> 
> I suggested the same to Stephen when he first brought up this driver.
> Unfortunately his attempt to create a simple KMS driver resulted in a
> significantly larger driver than the one he did for the framebuffer
> interface. This means that either Stephen did something really wrong
> in his attempt, or the KMS interface isn't as good as it should be
> if we want to move people away from frame buffer drivers.

Well, I didn't actually attempt to write the KMS driver; I simply took a
look at existing KMS drivers (and perhaps some stub KMS driver; I forget
right now) to see what it'd take, and it looked quite scary.

The other issue is that the KMS semantics appear to desire that the
driver allocate FB memory from some pool, and then point the display
scanout at the allocated memory. However, this driver's semantics are
that some other entity has allocated and reserved some memory region for
scanout, and the simple FB driver exists solely to scribble to that
memory region. Rob Clark said the thought this could be handled by
writing a custom memory allocator to support this, but it seemed a
little pointless to write a whole memory allocator when the existing FB
interface allows the driver to just set a struct member to the address
and be done with it.
