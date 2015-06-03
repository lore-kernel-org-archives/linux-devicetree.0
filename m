From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH] ARM: dts: sun8i: Add dts file for the
 GA10H-A33 tablet
Date: Tue, 2 Jun 2015 20:40:27 -0400
Message-ID: <CAKON4OzPv2Dbr8tFQ22sj4j+S0nyizdwbsYuvZJsVXDri=qc3Q@mail.gmail.com>
References: <1433274598-17366-1-git-send-email-hdegoede@redhat.com>
	<CAKON4OxsJO28aDMCvFzx_Z9n=Hyq6uBYo3hWR+04YDwjJVcTnA@mail.gmail.com>
	<CAGRGNgVTuik13PG41tebjfPkGfyDVZw54hGgMH79bpeT1mCOiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGRGNgVTuik13PG41tebjfPkGfyDVZw54hGgMH79bpeT1mCOiw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, ARM Linux Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 2, 2015 at 8:35 PM, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Jon,
>
> On Wed, Jun 3, 2015 at 6:20 AM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Resend with plain text for image links....
>>
>> I have one of these GA10H-A33 and tore it apart. They used an uncommon
>> wifi/BT chip - RDA5990P. Took mine apart since the wifi didn't work worth
>> two cents.
>> http://www.rdaic.com/sites/default/files/public/RDA5990P_datasheet_V1.4.pdf
>>
>> Is that unpopulated pad next to the RSA5990P an option to use an Ampak
>> module? I am looking for a A33 PCBA where I can mount a 5Ghz wi-fi module.
>
> Potential driver:
> https://github.com/linuxium/3188-SRC-ORIG/tree/master/kernel/drivers/net/wireless/rda5990
>
> (Code implies GPL but is missing copyright / license notices, might be
> for an older part.)
>
> On an unrelated note, is MediaTek buying up every last small
> manufacturer of WiFi parts?

RDA was bought by Spreadtrum


>
> Thanks,
>
> --
> Julian Calaby
>
> Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Profile: http://www.google.com/profiles/julian.calaby/



-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
