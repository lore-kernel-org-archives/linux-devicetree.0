From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: add vendor prefix for Allwinner Technology
Date: Fri, 31 Jan 2014 12:20:22 -0600
Message-ID: <CAL_Jsq+arxoJ-Ghg-wAB5odcXrBoQ8y_=v=YoExUg8=AojKACw@mail.gmail.com>
References: <1391045798-7053-1-git-send-email-emilio@elopez.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1391045798-7053-1-git-send-email-emilio@elopez.com.ar>
Sender: linux-doc-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio@elopez.com.ar>
Cc: Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 29, 2014 at 7:36 PM, Emilio L=F3pez <emilio@elopez.com.ar> =
wrote:
> We have been using the "allwinner" prefix for everything so far; let'=
s
> document it here.
>
> Signed-off-by: Emilio L=F3pez <emilio@elopez.com.ar>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied.

Rob

>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/=
Documentation/devicetree/bindings/vendor-prefixes.txt
> index edbb8d8..5a2904b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -7,6 +7,7 @@ ad      Avionic Design GmbH
>  adi    Analog Devices, Inc.
>  aeroflexgaisler        Aeroflex Gaisler AB
>  ak     Asahi Kasei Corp.
> +allwinner      Allwinner Technology Co., Ltd.
>  altr   Altera Corp.
>  amcc   Applied Micro Circuits Corporation (APM, formally AMCC)
>  apm    Applied Micro Circuits Corporation (APM)
> --
> 1.8.5.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
