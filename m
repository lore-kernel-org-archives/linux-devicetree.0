From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Mon, 08 Apr 2013 21:16:00 -0600
Message-ID: <516387F0.7080602@wwwdotorg.org>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
 <20130408171637.98b5ad1f867bcbda883af68b@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130408171637.98b5ad1f867bcbda883af68b-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
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
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Clark <robclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/08/2013 06:16 PM, Andrew Morton wrote:
> On Wed,  3 Apr 2013 20:39:43 -0600 Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> 
>> A simple frame-buffer describes a raw memory region that may be rendered
>> to, with the assumption that the display hardware has already been set
>> up to scan out from that buffer.
>>
>> This is useful in cases where a bootloader exists and has set up the
>> display hardware, but a Linux driver doesn't yet exist for the display
>> hardware.
>>
>> ...
>>
>> +config FB_SIMPLE
>> +	bool "Simple framebuffer support"
>> +	depends on (FB = y) && OF
> 
> It's sad that this simple little thing requires Open Firmware.  Could
> it be generalised in some way so that the small amount of setup info
> could be provided by other means (eg, module_param) or does the
> dependency go deeper than that?

I wouldn't be at all surprised if others want to feed it platform data
rather than parameterizing it through device tree. All my platforms use
DT though, so I didn't want to add that support without any user; it'd
just be dead code for now. But, if someone wants that, I can certainly
code it up or test/review after the change etc.
