From: Sergey Suloev <ssuloev@orpaltech.com>
Subject: Re: [linux-sunxi] [PATCH 3/6] drm/sun4i: dsi: Add bridge support
Date: Fri, 15 Mar 2019 18:20:07 +0300
Message-ID: <d0af6e24-68c2-2a16-31e6-3e5fd008c0ca@orpaltech.com>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
 <20190315130825.9005-4-jagan@amarulasolutions.com>
 <c232d5620d6a3272a6064ce9ccdec5c86a3a7950.camel@bootlin.com>
 <20190315134555.ekpywymjx3xqmdhf@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1881596124=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190315134555.ekpywymjx3xqmdhf@flea>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Cc: devicetree@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, jagan@amarulasolutions.com, Chen-Yu Tsai <wens@csie.org>, linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============1881596124==
Content-Type: multipart/alternative;
 boundary="------------808BDAA5D27927159AF43C2B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------808BDAA5D27927159AF43C2B
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Jagan,

On 3/15/19 4:45 PM, Maxime Ripard wrote:
> On Fri, Mar 15, 2019 at 02:32:55PM +0100, Paul Kocialkowski wrote:
>> Hi,
>>
>> On Fri, 2019-03-15 at 18:38 +0530, Jagan Teki wrote:
>>> Some display panels would come up with a non-DSI output which
>>> can have an option to connect DSI interface by means of bridge
>>> convertor.
>>>
>>> This DSI to non-DSI bridge convertor would require a bridge
>>> driver that would communicate the DSI controller for bridge
>>> functionalities.
>>>
>>> So, add support for bridge functionalities in Allwinner DSI
>>> controller.
>> See a few comments below.
>>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>>   drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 65 +++++++++++++++++++-------
>>>   drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  1 +
>>>   2 files changed, 49 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>>> index 0960b96b62cc..64d74313b842 100644
>>> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>>> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>>> @@ -781,6 +781,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>>>   	if (!IS_ERR(dsi->panel))
>>>   		drm_panel_prepare(dsi->panel);
>>>   
>>> +	if (!IS_ERR(dsi->bridge))
>>> +		drm_bridge_pre_enable(dsi->bridge);
>>> +
>>>   	/*
>>>   	 * FIXME: This should be moved after the switch to HS mode.
>>>   	 *
>>> @@ -796,6 +799,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>>>   	if (!IS_ERR(dsi->panel))
>>>   		drm_panel_enable(dsi->panel);
>>>   
>>> +	if (!IS_ERR(dsi->bridge))
>>> +		drm_bridge_enable(dsi->bridge);
>>> +
>>>   	sun6i_dsi_start(dsi, DSI_START_HSC);
>>>   
>>>   	udelay(1000);
>>> @@ -812,6 +818,9 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
>>>   	if (!IS_ERR(dsi->panel)) {
>>>   		drm_panel_disable(dsi->panel);
>>>   		drm_panel_unprepare(dsi->panel);
>>> +	} else if (!IS_ERR(dsi->bridge)) {
>>> +		drm_bridge_disable(dsi->bridge);
>>> +		drm_bridge_post_disable(dsi->bridge);
>>>   	}
>>>   
>>>   	phy_power_off(dsi->dphy);
>>> @@ -973,11 +982,16 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
>>>   	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
>>>   
>>>   	dsi->device = device;
>>> -	dsi->panel = of_drm_find_panel(device->dev.of_node);
>>> -	if (IS_ERR(dsi->panel))
>>> -		return PTR_ERR(dsi->panel);
>>>   
>>> -	dev_info(host->dev, "Attached device %s\n", device->name);
>>> +	dsi->bridge = of_drm_find_bridge(device->dev.of_node);
>>> +	if (!dsi->bridge) {
>> You are using IS_ERR to check that the bridge is alive in the changes
>> above, but switch to checking that it's non-NULL at this point.
>>
>> Are both guaranteed to be interchangeable?
> They aren't. Any ERR_PTR will be !NULL
>
>>> +		dsi->panel = of_drm_find_panel(device->dev.of_node);
>>> +		if (IS_ERR(dsi->panel))
>>> +			return PTR_ERR(dsi->panel);
>>> +	}
>> You should probably use drm_of_find_panel_or_bridge instead of
>> duplicating the logic here.
> Or we can even use the drm_panel_bridge_add to simplify things.

this approach is implemented by E.Anholt in VC4 dsi driver and it looks 
nice.

>
> Maxime
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--------------808BDAA5D27927159AF43C2B
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi, Jagan,<br>
    </p>
    <div class="moz-cite-prefix">On 3/15/19 4:45 PM, Maxime Ripard
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190315134555.ekpywymjx3xqmdhf@flea">
      <pre class="moz-quote-pre" wrap="">On Fri, Mar 15, 2019 at 02:32:55PM +0100, Paul Kocialkowski wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi,

On Fri, 2019-03-15 at 18:38 +0530, Jagan Teki wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Some display panels would come up with a non-DSI output which
can have an option to connect DSI interface by means of bridge
convertor.

This DSI to non-DSI bridge convertor would require a bridge
driver that would communicate the DSI controller for bridge
functionalities.

So, add support for bridge functionalities in Allwinner DSI
controller.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
See a few comments below.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Signed-off-by: Jagan Teki <a class="moz-txt-link-rfc2396E" href="mailto:jagan@amarulasolutions.com">&lt;jagan@amarulasolutions.com&gt;</a>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 65 +++++++++++++++++++-------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  1 +
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 0960b96b62cc..64d74313b842 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -781,6 +781,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (!IS_ERR(dsi-&gt;panel))
 		drm_panel_prepare(dsi-&gt;panel);
 
+	if (!IS_ERR(dsi-&gt;bridge))
+		drm_bridge_pre_enable(dsi-&gt;bridge);
+
 	/*
 	 * FIXME: This should be moved after the switch to HS mode.
 	 *
@@ -796,6 +799,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (!IS_ERR(dsi-&gt;panel))
 		drm_panel_enable(dsi-&gt;panel);
 
+	if (!IS_ERR(dsi-&gt;bridge))
+		drm_bridge_enable(dsi-&gt;bridge);
+
 	sun6i_dsi_start(dsi, DSI_START_HSC);
 
 	udelay(1000);
@@ -812,6 +818,9 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
 	if (!IS_ERR(dsi-&gt;panel)) {
 		drm_panel_disable(dsi-&gt;panel);
 		drm_panel_unprepare(dsi-&gt;panel);
+	} else if (!IS_ERR(dsi-&gt;bridge)) {
+		drm_bridge_disable(dsi-&gt;bridge);
+		drm_bridge_post_disable(dsi-&gt;bridge);
 	}
 
 	phy_power_off(dsi-&gt;dphy);
@@ -973,11 +982,16 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
 
 	dsi-&gt;device = device;
-	dsi-&gt;panel = of_drm_find_panel(device-&gt;dev.of_node);
-	if (IS_ERR(dsi-&gt;panel))
-		return PTR_ERR(dsi-&gt;panel);
 
-	dev_info(host-&gt;dev, "Attached device %s\n", device-&gt;name);
+	dsi-&gt;bridge = of_drm_find_bridge(device-&gt;dev.of_node);
+	if (!dsi-&gt;bridge) {
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
You are using IS_ERR to check that the bridge is alive in the changes
above, but switch to checking that it's non-NULL at this point.

Are both guaranteed to be interchangeable?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
They aren't. Any ERR_PTR will be !NULL

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+		dsi-&gt;panel = of_drm_find_panel(device-&gt;dev.of_node);
+		if (IS_ERR(dsi-&gt;panel))
+			return PTR_ERR(dsi-&gt;panel);
+	}
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
You should probably use drm_of_find_panel_or_bridge instead of
duplicating the logic here.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Or we can even use the drm_panel_bridge_add to simplify things.</pre>
    </blockquote>
    <p>this approach is implemented by E.Anholt in VC4 dsi driver and it
      looks nice.<br>
    </p>
    <blockquote type="cite"
      cite="mid:20190315134555.ekpywymjx3xqmdhf@flea">
      <pre class="moz-quote-pre" wrap="">

Maxime

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
linux-arm-kernel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-arm-kernel">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a>
</pre>
    </blockquote>
  </body>
</html>

--------------808BDAA5D27927159AF43C2B--

--===============1881596124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1881596124==--
