From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC/PATCH] drivers/of/platform: Add powerpc 4xx embedded busses
 to default list
Date: Fri, 1 Sep 2017 10:24:20 -0500
Message-ID: <CAL_JsqLYMeV6XsBOtZKJHFbC2+_cG+gF7L+LurH5keTtzp2wVQ@mail.gmail.com>
References: <1504237861.4974.59.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504237861.4974.59.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 31, 2017 at 10:51 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> This allow to (slowly) migrate those embedded platforms
> to of_platform_default_populate()
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>
> I'm here to collect acks (or comments :-) I'd like this to go via
> the powerpc tree along with the patches converting some of the
> platforms. I'll be adding more bus types if/when I start tackling
> other powerpc embedded families but for now I'm dealing with 4xx.

Glad to see it.

Acked-by: Rob Herring <robh@kernel.org>

Rob
