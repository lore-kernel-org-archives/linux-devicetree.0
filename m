From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: STi: add stid127 soc support
Date: Mon, 3 Feb 2014 09:33:49 +0100
Message-ID: <52EF546D.7070900@st.com>
References: <1391093744-19905-1-git-send-email-patrice.chotard@st.com> <201401301939.08302.arnd@arndb.de> <52EB96BB.6070800@st.com> <201401312115.33731.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201401312115.33731.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, srinivas kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, maxime.coquelin-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/31/2014 09:15 PM, Arnd Bergmann wrote:
> On Friday 31 January 2014, srinivas kandagatla wrote:
>
>>> Sorry if I missed the initial review, but can you explain
>>> why this is needed to start with?
>> On ST SoCs the default value for L2 AUX_CTRL register is 0x0, so we  set
>> the way-size explicit here.
> Unfortunately, we keep going back and forth on the L2 cache controller
> setup between "it should work automatically" and "we don't want to
> have configuration data in DT", where my personal opinion is that
> the first one is more important here.
>
> Now, there are a couple of properties that are defined in
> Documentation/devicetree/bindings/arm/l2cc.txt to let some of the
> things get set up automatically already. Can you check which bits
> are missing there, if any? Are they better described as "configuration"
> or "hardware" settings?
Hi Arnd,

Thanks for remarks. I will a have a look on it, but unfortunately not 
before 2 weeks.


Alex.

>
> 	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
