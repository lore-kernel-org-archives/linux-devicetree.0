From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Mon, 20 May 2013 09:25:46 -0600
Message-ID: <519A407A.4040006@wwwdotorg.org>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
 <CAAVeFuJ5q4Y0QtvJX2iVmq_O2ofs1B9=MB_aA8VdcEBdM4zf2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAAVeFuJ5q4Y0QtvJX2iVmq_O2ofs1B9=MB_aA8VdcEBdM4zf2Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Clark <robclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/18/2013 04:29 AM, Alexandre Courbot wrote:
> On Thu, Apr 4, 2013 at 11:39 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> +struct simplefb_format {
>> +       const char *name;
>> +       u32 bits_per_pixel;
>> +       struct fb_bitfield red;
>> +       struct fb_bitfield green;
>> +       struct fb_bitfield blue;
>> +       struct fb_bitfield transp;
>> +};
>> +
>> +struct simplefb_format simplefb_formats[] = {
>> +       { "r5g6b5", 16, {11, 5}, {5, 6}, {0, 5}, {0, 0} },
>> +};
> 
> I have been adding a few extra formats to this list, and I wonder if
> this could not simply be turned into a function that would directly
> convert the name string into the corresponding right format. The
> mapping between name and format seems to be a 1:1 and this would
> probably avoid errors in the future. I'm especially thinking about
> color order here - I started adding a mode that reads
> 
>     { "r8g8b8a8", 32, {0, 8}, {8, 8}, {16, 8}, {24, 8} },
> 
> while it should probably be called "a8b8g8r8" as the order of colors
> is not the same as your r5g6b5.
> 
> I can submit a patch if there is no issue with that idea.

I chose r5g6b5 rather than rgb565 specifically to make that format
trivially name machine-parsable. So, I'm not opposed to converting that
table to code. I'm not 100% sure if it's worth it or necessary by the
time we get to just 2 formats in the array, but I don't see any big
disadvantage, so why not. The DT binding documentation might want
enhancing with a more general description of how formats should be
represented if this is implemented.
