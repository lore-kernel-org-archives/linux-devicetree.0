From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/5] mfd: arizona: Add micdet ranges and polarity device
 tree bindings
Date: Mon, 23 Sep 2013 15:41:26 -0600
Message-ID: <5240B586.20609@wwwdotorg.org>
References: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <1379961043-23762-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379961043-23762-4-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/23/2013 12:30 PM, Charles Keepax wrote:
> Add device tree bindings for the pdata that configures the microphone
> button detection and microphone detection polarity configurations.

> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt

> +  - wlf,micd-ranges : Microphone detection level and key configuration, this
> +    field can be of variable length but should always be a multiple of 2 cells
> +    long, each two cell group represents one button configuration
> +    The first cell is the maximum impedance for this button in ohms
> +    The second cell the key that should be reported to the input layer

Is there a limit on how many ranges can be specified? Are the impedance
values arbitrary, or limited to some pre-determined set of values
supported by HW?

> +  - wlf,micd-configs : Headset polarity configurations, the field can be of
> +    variable length but should always be a multiple of 3 cells long, each two

s/two/three/

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
