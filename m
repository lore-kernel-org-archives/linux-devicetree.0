From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH anybus v2 2/5] dt-bindings: anybus-bridge: document
 devicetree binding.
Date: Thu, 1 Nov 2018 00:29:52 +0100
Message-ID: <999e50d3-924d-b960-ffb2-b1ee04c08d09@suse.de>
References: <20181031194425.32132-1-TheSven73@googlemail.com>
 <20181031194425.32132-3-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181031194425.32132-3-TheSven73@googlemail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: thesven73@gmail.com, svendev@arcx.com
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sven,

Am 31.10.18 um 20:44 schrieb thesven73@gmail.com:
> From: Sven Van Asbroeck <svendev@arcx.com>
> 
> This patch adds devicetree binding documentation for the
> Arcx anybus bridge.
> 
> Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>
> ---
>  .../bindings/misc/arcx,anybus-bridge.txt      | 34 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/arcx,anybus-bridge.txt
[...]
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 2c3fc512e746..1bf07b20a8af 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -35,6 +35,7 @@ aptina	Aptina Imaging
>  arasan	Arasan Chip Systems
>  archermind ArcherMind Technology (Nanjing) Co., Ltd.
>  arctic	Arctic Sand
> +arcx	Arcx/Archronix Inc.
>  aries	Aries Embedded GmbH
>  arm	ARM Ltd.
>  armadeus	ARMadeus Systems SARL

Please move this to a separate patch, titled "dt-bindings: Add vendor
prefix for Arcx", with the commit message describing what the company does.
Also note that subject lines usually do not end with a full stop,
similar to book titles or news headlines.
And it is usually preferable to have such a long list of people in CC
rather than in To, to make it clear whom you expect to handle it and to
facilitate replies going to you without hand-editing every other To.

I notice that arcx.com spells it ARCX Inc., in upper-case without any
mention of Archronix in the name. So if that's a previous name you may
want to write it as "ARCX Inc. (formerly Archronix Inc.)"? Look for
other examples in that file.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
