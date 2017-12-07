From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] arm: dts: qcom: fix missing #phy-cells for apq8064
Date: Thu, 7 Dec 2017 15:53:59 +0100
Message-ID: <CAK8P3a1VAquccZnvDKUwjToHM6qBeKzehwmTGCjb5_yPhsrPaw@mail.gmail.com>
References: <20171109225422.14280-1-robh@kernel.org> <CAK8P3a3wupYd7XiJrYsFafbmdpiw_zFVd42E8Ucm9oNXtwzWSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a3wupYd7XiJrYsFafbmdpiw_zFVd42E8Ucm9oNXtwzWSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 7, 2017 at 3:43 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thu, Nov 9, 2017 at 11:54 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> Fix dtc warnings for missing #phy-cells for apq8064:
>>
>> Warning (phys_property): Missing property '#phy-cells' in node /soc/dsi-phy@4700200 or bad phandle (referred from /soc/mdss_dsi@4700000:phys[0])
>> Warning (phys_property): Missing property '#phy-cells' in node /soc/hdmi-phy@4a00400 or bad phandle (referred from /soc/hdmi-tx@4a00000:phys[0])
>>
>> Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Applied to fixes, thanks!

This was apparently already there, I took it out again, as applying it
twice resulted in build failure :(

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
