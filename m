From: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH 0/8] Add support for CL-SOM-iMX7 and SBC-iMX7
Date: Wed, 16 Dec 2015 16:09:02 +0200
Message-ID: <5671707E.5000908@compulab.co.il>
References: <1449472479-2521-1-git-send-email-ilya@compulab.co.il>
 <20151214024715.GD25756@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151214024715.GD25756@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On 12/14/15 04:47, Shawn Guo wrote:
> On Mon, Dec 07, 2015 at 09:14:31AM +0200, Ilya Ledvich wrote:
>> Ilya Ledvich (8):
>>   ARM: dts: imx7d: cl-som-imx7: add basic module support
>>   ARM: dts: imx7d: cl-som-imx7: add usb otg support
>>   ARM: dts: imx7d: cl-som-imx7: add eMMC support
>>   ARM: dts: imx7d: cl-som-imx7: add fec1 support
>>   ARM: dts: imx7d: cl-som-imx7: add eeprom support
>>   ARM: dts: imx7d: cl-som-imx7: add gpio extender support
>>   ARM: dts: imx7d: cl-som-imx7: add fec2 support
> 
> For the initial board support submission, it doesn't really need such
> splitting.  Please merge above patches into one.

Yeah, I know there is no need for such splitting, yet I think
if the splitting is done right - it is much simpler to review,
it provides a better bisectability (in case it will be needed in
the future), and also if for some reason one (or more) patches are
needing some time consuming rework, others (earlier ones in the series)
can be accepted meanwhile.

So, I really like to keep it this way, unless you insist.

Thanks!

-- 
Regards,
Igor.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
