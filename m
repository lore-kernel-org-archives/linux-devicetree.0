From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [v8,
 1/3] Documentation: dt: net: add ath9k wireless device binding
Date: Tue, 15 Nov 2016 15:56:47 +0100
Message-ID: <cfd35a091551410cb69f2444109d3193@euamsexm01a.eu.qualcomm.com>
References: <20161016205907.19927-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161016205907.19927-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mcgrof-3uybbJdB1yH774rrrx3eTA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn-yOkvZcmFvRU@public.gmane.org, linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Add documentation how devicetree can be used to configure ath9k based
> devices.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

3 patches applied to ath-next branch of ath.git, thanks.

fc383ffdb91a Documentation: dt: net: add ath9k wireless device binding
b40ded2ad75c ath9k: add a helper to get the string representation of ath_bus_type
138b41253d9c ath9k: parse the device configuration from an OF node

-- 
https://patchwork.kernel.org/patch/9378317/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
