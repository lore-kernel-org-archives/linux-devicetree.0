From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: Add nutsboard to vendor
 prefix.
Date: Sat, 9 Sep 2017 12:05:38 +0200
Message-ID: <15d92b9d-bc50-df11-a434-e4d04a8e191c@suse.de>
References: <1504949591-14022-1-git-send-email-onlywig@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504949591-14022-1-git-send-email-onlywig@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wig C <onlywig@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, treding@nvidia.com, jic23@kernel.org, marek.vasut@gmail.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi YuanCheng,

Usually such a vendor prefix patch is part of a series, with later
patches making use of the prefix for some compatible string in a binding
document and in some Device Tree. What will this prefix be used for?

Are you affiliated with the company? If not, you should consider CC'ing
nutsboard@gmail.com to allow them to comment.

Am 09.09.2017 um 11:33 schrieb Wig C:
> From: YuanCheng Cheng <onlywig@gmail.com>
> 

Please add a sentence about the company here.

> Signed-off-by: YuanCheng Cheng <onlywig@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index daf465be..7746dbc 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -230,6 +230,7 @@ nintendo	Nintendo
>  nlt	NLT Technologies, Ltd.
>  nokia	Nokia
>  nordic	Nordic Semiconductor
> +nutsboard	NutsBoard

I don't spot any more specific company name on nutsboard.org
(LLC/Inc/Corp/...), so the entry looks okay.

>  nuvoton	Nuvoton Technology Corporation
>  nvd	New Vision Display
>  nvidia	NVIDIA

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
