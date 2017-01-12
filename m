From: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 6/6] fbdev/ssd1307fb: add support to enable VBAT
Date: Thu, 12 Jan 2017 15:46:54 +0200
Message-ID: <e193efee-c1e2-cb86-68ae-4ddeb138d007@ti.com>
References: <cover.1484219137.git.jsarha@ti.com>
 <c394e52447ed45fff9672eb3e3bb6729bea87ee7.1484219137.git.jsarha@ti.com>
 <d06c3a64-7627-2553-84e5-491a5acbe0de@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d06c3a64-7627-2553-84e5-491a5acbe0de-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/12/17 14:05, Tomi Valkeinen wrote:
> On 12/01/17 13:16, Jyri Sarha wrote:
>> From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
>>
>> SSD1306 needs VBAT when it is wired in charge pump configuration. This
>> patch adds support to the driver to enable VBAT regulator at init time.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
>> Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
>> Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/display/ssd1307fb.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/ssd1307fb.txt b/Documentation/devicetree/bindings/display/ssd1307fb.txt
>> index 6617df6..209d931 100644
>> --- a/Documentation/devicetree/bindings/display/ssd1307fb.txt
>> +++ b/Documentation/devicetree/bindings/display/ssd1307fb.txt
>> @@ -16,6 +16,7 @@ Required properties:
>>  Optional properties:
>>    - reset-gpios: The GPIO used to reset the OLED display, if available. See
>>                   Documentation/devicetree/bindings/gpio/gpio.txt for details.
>> +  - vbat-supply: The supply for VBAT
>>    - solomon,segment-no-remap: Display needs normal (non-inverted) data column
>>                                to segment mapping
>>    - solomon,com-seq: Display uses sequential COM pin configuration
>>
> 
> It's rather confusing to have two patches with identical subjects and
> descs (this and 4). And there's even an unrelated patch in between this
> and the driver change...
> 

Argh. I wonder how did this even happen. Something weird must have been
going on... there is only one such patch in branch I cherry-picked these
patches from. These last patches did not give me any errors and compiled
fine, so did not look too carefully at the results. Anyway, I'll squash
this into the earlier patch with the same subject in version 2 series.

Best regards,
Jyri

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
