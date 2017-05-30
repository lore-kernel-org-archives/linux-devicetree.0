From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND PATCH v5] ARM: dts: da850: Add the CPPI 4.1 DMA to the
 USB OTG controller
Date: Tue, 30 May 2017 16:11:48 +0530
Message-ID: <a3ba4ad5-b5ef-b971-69af-02c88e5c78c3@ti.com>
References: <20170519133336.5160-1-abailon@baylibre.com>
 <85b6292e-ede9-36a8-8a87-063ba7fb1d12@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <85b6292e-ede9-36a8-8a87-063ba7fb1d12-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 25 May 2017 02:41 PM, Sekhar Nori wrote:
> On Friday 19 May 2017 07:03 PM, Alexandre Bailon wrote:
>> This adds the CPPI 4.1 DMA controller to the USB OTG controller.
>>
>> Changes since v2:
>> - Fixed the the property reg-names (had glue register defined)
>> - Removed few useless property
>>
>> Signed-off-by: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> 
> Looks good to me. Will wait some more time for other feedback before
> applying.

Applied to v4.13/dt

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
