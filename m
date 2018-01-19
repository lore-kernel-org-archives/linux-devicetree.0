From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: media: Add Allwinner V3s Camera
 Sensor Interface (CSI)
Date: Fri, 19 Jan 2018 14:16:09 -0800
Message-ID: <2134527e-cb44-1c4d-0ac9-8bbfc71b8ce8@infradead.org>
References: <1515639823-35782-1-git-send-email-yong.deng@magewell.com>
 <20180119211409.ubysuyvhkmfotbdg@rob-hp-laptop>
 <2315959.AJds7mCBWN@ice-x220i>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2315959.AJds7mCBWN@ice-x220i>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Maxime Ripard <maxime.ri>
List-Id: devicetree@vger.kernel.org

On 01/19/2018 01:17 PM, Icenowy Zheng wrote:
> 在 2018年1月20日星期六 CST 上午5:14:09，Rob Herring 写道：
>> On Thu, Jan 11, 2018 at 11:03:43AM +0800, Yong Deng wrote:
>>> Add binding documentation for Allwinner V3s CSI.
>>>
>>> Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
>>> ---
>>>
>>>  .../devicetree/bindings/media/sun6i-csi.txt        | 59
>>>  ++++++++++++++++++++++ 1 file changed, 59 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/sun6i-csi.txt
>>
>> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> I think other subsystem's maintainer may expect a Acked-by from you here.
> 
> Why do you use Reviewed-by here instead?

The Reviewed-by: tag is a stronger ACK than the Acked-by: tag, so this
should be sufficient for other subsystem maintainers.

Please see Documentation/process/submitting-patches.rst, section 13.


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
