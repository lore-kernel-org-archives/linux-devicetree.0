From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] documentation: Fix pinctrl documentation for
 Meson8 / Meson8b
Date: Wed, 23 Mar 2016 10:20:52 -0500
Message-ID: <20160323152052.GA20906@rob-hp-laptop>
References: <1458724440-32228-1-git-send-email-carlo@caione.org>
 <1458724440-32228-3-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458724440-32228-3-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 23, 2016 at 10:14:00AM +0100, Carlo Caione wrote:
> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> 
> Fix pin controller documentation introducing the new compatibles for
> the pinctrl drivers specific for aobus / cbus.
> 
> This is needed because we have changed the pin controller driver: we
> have now a single specialized pinctrl driver / compatible for each bus
> the controller is attached to, instead of one single driver dealing with
> all the controllers we have on different buses.

Aren't you breaking compatibility with old DTs here? If so, you need to 
be clear that you are and why you think that is okay.
 
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/pinctrl/meson,pinctrl.txt  | 38 ++++------------------
>  1 file changed, 7 insertions(+), 31 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
