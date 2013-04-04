From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] video: implement a dumb framebuffer driver
Date: Wed, 03 Apr 2013 20:25:06 -0600
Message-ID: <515CE482.4030707@wwwdotorg.org>
References: <1364969830-6481-1-git-send-email-swarren@wwwdotorg.org>
 <20130403064653.GA6263@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130403064653.GA6263-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
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
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Clark <robclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/03/2013 12:46 AM, Olof Johansson wrote:
> On Wed, Apr 03, 2013 at 12:17:10AM -0600, Stephen Warren wrote:
>> A dumb frame-buffer describes a raw memory region that may be rendered
>> to, with the assumption that the display hardware has already been set
>> up to scan out from that buffer.
>>
>> This is useful in cases where a bootloader exists and has set up the
>> display hardware, but a Linux driver doesn't yet exist for the display
>> hardware.
...
>> diff --git a/Documentation/devicetree/bindings/video/dumb-framebuffer.txt b/Documentation/devicetree/bindings/video/dumb-framebuffer.txt
...
>> +Required properties:
...
>> +- format: The format of the framebuffer surface. Valid values are:
>> +  r5g6b5: A 16bpp format.
> 
> Hm, I'm used to this being written as "rgb565", which is also the format
> string that the fsl-imx-drm binding seems to use.
> 
> I guess actual depth can easily be derived from format.

I'd prefer the bit-widths be interleaved with the component names; doing
so is a little more precise if you end up with 2-digit component widths,
e.g. 10-bit r/g/b plus 2-bit alpha, where the multi-digit numbers would
run together otherwise and hence aren't easily algorithmically parsable.
I believe this interleaved style is more common in the graphics world
too. The IMX binding doesn't seem like a good example; the other option
besides "rgb565" is "rgb24", which could be one one many different formats.

I'll address the dumb/simple naming issue and repost.
