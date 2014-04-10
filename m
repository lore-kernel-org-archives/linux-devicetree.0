From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 1/1] of: add vendor prefix for ISEE 2007 S.L.
Date: Thu, 10 Apr 2014 10:39:24 +0200
Message-ID: <CABxcv=mgesiidJ0-rkv63Zr9+fMjt3SpTw=F2WvST5_SJZZgMg@mail.gmail.com>
References: <1382647219-6118-1-git-send-email-javier@dowhile0.org>
	<AD1CF90F-89BD-425F-A09E-A8599304C5EA@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <AD1CF90F-89BD-425F-A09E-A8599304C5EA@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Landley <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, Oct 25, 2013 at 5:19 AM, Kumar Gala <galak@codeaurora.org> wrote:
>
> On Oct 24, 2013, at 3:40 PM, Javier Martinez Canillas wrote:
>
>> This trivial patch adds ISEE 2007 S.L. to the list of
>> devicetree vendor prefixes.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
>> ---
>> Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>> 1 file changed, 1 insertion(+)
>
> Acked-by: Kumar Gala <galak@codeaurora.org>
>
> - k
>

Any reason why this patch has not been merged, it was sent months ago
and already acked by Kumar?

I know is a trivial patch but prevents checkpatch.pl to show the
following error:

WARNING: DT compatible string vendor "isee" appears un-documented --
check ./Documentation/devicetree/bindings/vendor-prefixes.txt
#17: FILE: arch/arm/boot/dts/omap3-igep0020.dts:17:
+ compatible = "isee,omap3-igep0020", "ti,omap36xx", "ti,omap3";

which is kind of annoying each time I change the IGEP dts.

Thanks a lot and best regards,
Javier
