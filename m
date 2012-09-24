From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] of: Add videomode helper
Date: Mon, 24 Sep 2012 10:18:39 -0500
Message-ID: <506079CF.40902@gmail.com>
References: <1348042843-24673-1-git-send-email-s.trumtrar@pengutronix.de>
 <50606334.7030902@gmail.com> <20120924141233.GN1322@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120924141233.GN1322-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/24/2012 09:12 AM, Sascha Hauer wrote:
> Hi Rob,
> 
> On Mon, Sep 24, 2012 at 08:42:12AM -0500, Rob Herring wrote:
>> On 09/19/2012 03:20 AM, Steffen Trumtrar wrote:
>>> This patch adds a helper function for parsing videomodes from the devicetree.
>>> The videomode can be either converted to a struct drm_display_mode or a
>>> struct fb_videomode.
>>>
>>> +
>>> +Required properties:
>>> + - hactive, vactive: Display resolution
>>> + - hfront-porch, hback-porch, hsync-len: Horizontal Display timing parameters
>>> +   in pixels
>>> +   vfront-porch, vback-porch, vsync-len: Vertical display timing parameters in
>>> +   lines
>>> + - clock: displayclock in Hz
>>
>> A major piece missing is the LCD controller to display interface width
>> and component ordering.
> 
> Psst. We silently skipped this for now...
> 
> I think having such a videomode helper is useful without having the
> data order part. We are aware that this should be added later, but
> I think currently it makes sense to concentrate on the basics.

Evolving bindings is not a good thing. We know this is needed, so we
should address it now. If Linux had a standard way to describe the
interface (it didn't a few years ago and I haven't kept up), then I
would bet it would already be part of this binding. Defining the
bindings in terms of what an OS uses or not is the wrong way around.

>>
>>> +
>>> +Optional properties:
>>> + - width-mm, height-mm: Display dimensions in mm
>>> + - hsync-active-high (bool): Hsync pulse is active high
>>> + - vsync-active-high (bool): Vsync pulse is active high
>>> + - interlaced (bool): This is an interlaced mode
>>> + - doublescan (bool): This is a doublescan mode
>>> +
>>> +There are different ways of describing a display mode. The devicetree representation
>>> +corresponds to the one commonly found in datasheets for displays.
>>> +The description of the display and its mode is split in two parts: first the display
>>> +properties like size in mm and (optionally) multiple subnodes with the supported modes.
>>> +
>>> +Example:
>>> +
>>> +	display@0 {
>>
>> It would be useful to have a compatible string here. We may not always
>> know the panel type or have a fixed panel though. We could define
>> "generic-lcd" or something for cases where the panel type is unknown.
> 
> We expect the display nodes being subnodes of a driver (which of course
> has a compatible), or maybe referred to from a driver using phandles. So
> I don't see why the display node itself should have a compatible
> property. The display information is only ever useful in the context of
> a driver.

A subnode or phandle will describe the h/w connection, but you need a
name to describe what is at each end of the connection.

Where would the model number of an lcd panel be captured then? The
timing parameters are a property of a specific panel, so both should be
described together. You may not have any use for the compatible string
now, but more information is better than less and adding it would not
hurt anything. For pretty much any other device sitting on a board, we
describe the manufacturer and type of device. LCD panels should be no
different.

Rob
