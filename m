From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: Consolidate ChipIdea USB ci13xxx
 bindings
Date: Mon, 01 Jun 2015 10:09:47 +0300
Message-ID: <1433142587.6844.11.camel@mm-sol.com>
References: <1432917526-9688-1-git-send-email-robh@kernel.org>
	 <1432917526-9688-5-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432917526-9688-5-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Tang <dt.tangr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Fri, 2015-05-29 at 11:38 -0500, Rob Herring wrote:
> Combine the ChipIdea USB binding into a single document to reduce
> duplication and fragmentation. This marks use of the old PHY bindings as
> deprecated. Future compatible bindings should use generic PHY binding.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> Cc: Peter Chen chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Daniel Tang tangr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Pawel Moll moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../devicetree/bindings/usb/ci-hdrc-imx.txt        | 35 ----------------------
>  .../devicetree/bindings/usb/ci-hdrc-qcom.txt       | 17 -----------
>  .../devicetree/bindings/usb/ci-hdrc-usb2.txt       | 22 +++++++++++++-
>  .../devicetree/bindings/usb/ci-hdrc-zevio.txt      | 17 -----------
>  4 files changed, 21 insertions(+), 70 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
>  delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
>  delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-zevio.txt

Thanks. For Qualcomm part:

Acked-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
