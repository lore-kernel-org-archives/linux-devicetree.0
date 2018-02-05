From: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: ad5272: Add bindings for Analog
 Devices digital potentiometers
Date: Mon, 5 Feb 2018 03:34:38 -0500
Message-ID: <d2aea91b-c5ce-4097-e9eb-c24fa361a386@mothictech.com>
References: <1517231574-92777-1-git-send-email-preid@electromag.com.au>
 <1517231574-92777-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517231574-92777-2-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/29/2018 08:12 AM, Phil Reid wrote:
> +Optional properties:
> + - reset-gpios: GPIO specification for the RESET input. This is an
> +		active low signal to the PCA953x.

Copy/paste error?  Should maybe be "This is an active low signal to the 
AD527x."?
-- 
Brandon Martin
Mothic Technologies
317-565-1357 x7000
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
