From: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/4] plugin: Transparently support old style syntax
Date: Fri, 6 May 2016 10:16:39 +0100
Message-ID: <CAPhXvM7D-Uv9nzmiiz8kw6w18nZQ-h_R4UEEPzj+_HPt3t=+BA@mail.gmail.com>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1462477724-8092-4-git-send-email-pantelis.antoniou@konsulko.com>
	<CAL_JsqJkJyMi4_RoxLAiVD3GXst8CX_8ekounavztXZKxdMKtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJkJyMi4_RoxLAiVD3GXst8CX_8ekounavztXZKxdMKtg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> In the wild where?
>
> IMO, too bad. That's the danger of deploying prototype code. Perhaps a
> tool to convert them would be better.


At Raspberry Pi we've been making good use of overlays for over a year now.
They have been an invaluable tool, allowing us to reduce the need for
downstream code while retaining and extending the flexibility our users
need. Without the circulating patches I would have pressed ahead with a
homegrown equivalent, which would have made switching to overlays much more
painful.

I hope to see Pantelis's overlay configfs code in a kernel release soon,
but until then we'll continue to apply the patches downstream.

Phil
