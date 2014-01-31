From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] of: add vendor prefix for Honeywell
Date: Fri, 31 Jan 2014 10:53:01 -0800
Message-ID: <CAOesGMhFEMNFbAC4rUdccYVHM8yX9Mz+Vx73jGxBYGrSOa4Gaw@mail.gmail.com>
References: <1390685924-11877-1-git-send-email-marek@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1390685924-11877-1-git-send-email-marek@goldelico.com>
Sender: linux-doc-owner@vger.kernel.org
To: Marek Belisko <marek@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 25, 2014 at 1:38 PM, Marek Belisko <marek@goldelico.com> wrote:
> Signed-off-by: Marek Belisko <marek@goldelico.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 3f900cd..b14c617 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -40,6 +40,7 @@ gmt   Global Mixed-mode Technology, Inc.
>  gumstix        Gumstix, Inc.
>  haoyu  Haoyu Microelectronic Co. Ltd.
>  hisilicon      Hisilicon Limited.
> +honeywell      Honeywell

The norm has usually been to use the the stock ticker symbol of a
public company if it is available. In other words, I think the prefix
here should be 'hon', since Honeywell is a publicly traded company
under that ticker.


-Olof
