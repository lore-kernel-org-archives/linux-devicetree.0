From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/17] iio: accel: kxsd9: Add device tree bindings
Date: Sun, 21 Aug 2016 20:41:35 +0100
Message-ID: <ff3e8465-d550-6aa8-2a04-e70e4ff1c4f9@kernel.org>
References: <1471354423-19186-1-git-send-email-linus.walleij@linaro.org>
 <1471354423-19186-2-git-send-email-linus.walleij@linaro.org>
 <20160818192106.GA28115@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160818192106.GA28115@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 18/08/16 20:21, Rob Herring wrote:
> On Tue, Aug 16, 2016 at 03:33:27PM +0200, Linus Walleij wrote:
>> This accelerometer can be probed from the device tree, so it needs
>> to have proper documentation of it's device tree bindings.
>>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/iio/accel/kionix,kxsd9.txt | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.txt
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Applied to the togreg branch of iio.git - pushed out as
testing.  Thanks,

Jonathan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
