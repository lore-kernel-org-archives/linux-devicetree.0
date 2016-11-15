From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 05/30] usb: dwc2: Add bindings to disable gadget DMA
 modes
Date: Mon, 14 Nov 2016 17:26:57 -0800
Message-ID: <0d324fc7-88ed-7cd1-38f6-91d4fe33eca8@synopsys.com>
References: <cover.1478748145.git.johnyoun@synopsys.com>
 <16733114b9252b8163c11cc7ca95b2b152b66e0e.1478748145.git.johnyoun@synopsys.com>
 <20161115011110.b32eljlv42mhbocr@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161115011110.b32eljlv42mhbocr@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/14/2016 5:11 PM, Rob Herring wrote:
> On Wed, Nov 09, 2016 at 07:27:50PM -0800, John Youn wrote:
>> Now that the gadget driver automatically detects DMA modes, we need to
>> provide a way to disable them. Certain platforms may still have issues
>> with DMA and require it to be disabled. It is also needed for IP
>> validation purposes.
> 
> I don't think IP validation is reason enough for these properties. If 
> there is IP that is broken and lies about it, then yes we should have 
> these.
> 
> Rob
> 

Ok. Mark said basically the same thing in a previous thread that lead
to this patch.

Until they are needed by hardware, I'll remove these bindings.

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
