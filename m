From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Documentation: dt: extcon: add optional
 debounce-timeout-ms attribute
Date: Wed, 25 Oct 2017 09:53:37 -0500
Message-ID: <20171025145337.kubcbkxrhbsy6o4a@rob-hp-laptop>
References: <1508383560-15567-1-git-send-email-raveendra.padasalagi@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508383560-15567-1-git-send-email-raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 19, 2017 at 08:55:59AM +0530, Raveendra Padasalagi wrote:
> Add documentation on optional dt attribute "debounce-timeout-ms"
> in extcon node to capture user specified timeout value for id
> and vbus gpio detection.
> 
> Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
> 
> Changes in v2:
>  Rename debounce-timeout-ms to input-debounce
> 
>  Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt | 3 +++
>  1 file changed, 3 insertions(+)

Sorry, but extcon bindings should be scrapped IMO and I don't want to 
see additions. "extcon" is a Linuxism and is the first clue.

What's needed is a full USB connector binding, not just some incomplete 
handling of ID and Vbus pins. There's some work happening on that[1].

Rob

[1] https://www.spinics.net/lists/linux-usb/msg161106.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
