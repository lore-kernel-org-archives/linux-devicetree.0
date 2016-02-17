From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: vf-colibri: add basic supply regulators
Date: Wed, 17 Feb 2016 13:52:07 -0800
Message-ID: <a07b405a5c73b092eaa6422b8562b56f@agner.ch>
References: <1455668317-15728-1-git-send-email-stefan@agner.ch>
 <1455668317-15728-2-git-send-email-stefan@agner.ch>
 <CAOMZO5Bb1eGSinoNkUhB_2w8mWdA+RQA0Z4geJp8B-MfGryAHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5Bb1eGSinoNkUhB_2w8mWdA+RQA0Z4geJp8B-MfGryAHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2016-02-16 16:28, Fabio Estevam wrote:
> On Tue, Feb 16, 2016 at 10:18 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
> 
>> +       reg_module_3v3: regulator-module-3v3 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "+V3.3";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               regulator-always-on;
> 
> This 'regulator-always-on' property can be removed.
> 
>> +       };
>> +
>> +       reg_module_3v3_avdd: regulator-module-3v3-avdd {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "+V3.3_AVDD_AUDIO";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               regulator-always-on;
> 
> Same here.

Hm, should I remove them also in Patch 1/3? It's a fixed regulator too,
hence I guess regulator-always-on is pointless there too...?

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
