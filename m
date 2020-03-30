Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CBDC2D0E9
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 10:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 769FD206DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 10:21:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="AHmRqT3i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbgC3KVR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 06:21:17 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:34094 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729302AbgC3KVR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 06:21:17 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 02UALC6x006783
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2020 19:21:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02UALC6x006783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585563673;
        bh=age6B3Q1YALNVXTjtXbWA6xegYm+dQCmImhIvDBLFFI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AHmRqT3iiWkdvGRwePu36ChTwTWyvMFo1mfBOU+QxPuIfMuovfCK4N5gtD5Eo1UPc
         O4T6pSYwtE/JBNeR2bsl3vYs5jIVRVdmopiwzhFKLoDDOzRL/pLX1F8BIH6NwtgNrn
         8Jt/87YJX8xx0MjkXjJ/xbx30yrGeAH9uZuONwKUoBL8jSnRZ/p/I6UgxEMt/zkC1D
         pwAO/e/I5ciHuJxEoOtxprJE4GBVtEZjjISTVqoYdWFiCpf2Adicd/C8AtxpCbM45l
         c4ANedeZh+hNaT0RXD4XwYRNzdVa3Im+u8JdnXEvuUnEyKsXeb7p3TdG4l97/t3hXl
         O+EiZ6xVZqm0A==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id g10so205843uae.5
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2020 03:21:12 -0700 (PDT)
X-Gm-Message-State: AGi0PubwIXZJ05C1581ozRwgAvFOQypmeXJ/IXdYBunc08SDrgig/8fp
        ePPIZRQUvq9Qo9pjKnMbA0qWimKebEl21pnpUlE=
X-Google-Smtp-Source: APiQypJXUnkK3NbFFLynQq+coARG1pdTbgPXjSysDqi6EwFK5zY3vAtWK3OAUXZ3/tyle00gwJkiE4vSM2k31pS/bVg=
X-Received: by 2002:a9f:28c5:: with SMTP id d63mr7166320uad.25.1585563671565;
 Mon, 30 Mar 2020 03:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <1584955970-8162-1-git-send-email-hayashi.kunihiko@socionext.com> <1584955970-8162-2-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1584955970-8162-2-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 30 Mar 2020 19:20:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNARyRcxR0nhPWo9mY=tahGtwY2E8A50X_Tv4VhFfM-WLGQ@mail.gmail.com>
Message-ID: <CAK7LNARyRcxR0nhPWo9mY=tahGtwY2E8A50X_Tv4VhFfM-WLGQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: dma: uniphier-xdmac: Consolidate
 register region description
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: multipart/mixed; boundary="00000000000069e9ff05a20fcfb1"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

--00000000000069e9ff05a20fcfb1
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 23, 2020 at 6:33 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> The extension register region isn't currently referred from the driver, so
> this consolidates the extension register region description into the base
> register region, and spreads the region size in example.


You should not say this in the commit log.

The DT binding is hardware description.
Whether it is used or not in the driver is not a primary reason.



I recommend you to read this:


Documentation/devicetree/bindings/writing-bindings.txt:

- DON'T refer to Linux or "device driver" in bindings. Bindings should be
  based on what the hardware has, not what an OS and driver currently support.




> Fixes: b9fb56b6ba8a ("dt-bindings: dmaengine: Add UniPhier external DMA controller bindings")
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml b/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
> index 86cfb59..830cd88 100644
> --- a/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
> @@ -23,8 +23,7 @@ properties:
>
>    reg:
>      items:
> -      - description: XDMAC base register region (offset and length)
> -      - description: XDMAC extension register region (offset and length)
> +      - description: XDMAC register region (offset and length)

Now that the reg is a single tuple,
the "items" is unneeded.



>    interrupts:
>      maxItems: 1
> @@ -54,7 +53,7 @@ examples:
>    - |
>      xdmac: dma-controller@5fc10000 {
>          compatible = "socionext,uniphier-xdmac";
> -        reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;
> +        reg = <0x5fc10000 0x5100>;


Checking the datasheet (LD20), this seems still wrong.

The last register is XDMAID3 : 0x5fc1520c

So, reg = <0x5fc10000 0x5300>;


I attached a patch, which I think more correct.
Please check it, and I will send it to the correct ML.



>          interrupts = <0 188 4>;
>          #dma-cells = <2>;
>          dma-channels = <16>;
> --
> 2.7.4
>

-- 
Best Regards
Masahiro Yamada

--00000000000069e9ff05a20fcfb1
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-dt-bindings-dma-uniphier-xdmac-switch-to-single-reg-.patch"
Content-Disposition: attachment; 
	filename="0001-dt-bindings-dma-uniphier-xdmac-switch-to-single-reg-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k8ebl7qt0>
X-Attachment-Id: f_k8ebl7qt0

RnJvbSA5NDY0MmIwZmM3OTc2YmU1MTRhY2M3MGEwOTVlZTNlZmVhYzNkOGUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Np
b25leHQuY29tPgpEYXRlOiBNb24sIDMwIE1hciAyMDIwIDE4OjMxOjE4ICswOTAwClN1YmplY3Q6
IFtQQVRDSF0gZHQtYmluZGluZ3M6IGRtYTogdW5pcGhpZXIteGRtYWM6IHN3aXRjaCB0byBzaW5n
bGUgcmVnIHJlZ2lvbgoKVGhlIHJlZyBpbiB0aGUgZXhhbXBsZSAiPDB4NWZjMTAwMDAgMHgxMDAw
PiwgPDB4NWZjMjAwMDAgMHg4MDA+IgppcyB3cm9uZy4gVGhlIHJlZ2lzdGVyIHJlZ2lvbiBvZiB0
aGlzIGNvbnRyb2xsZXIgaXMgbXVjaCBzbWFsbGVyLAphbmQgdGhlcmUgaXMgbm8gb3RoZXIgaGFy
ZHdhcmUgcmVnaXN0ZXIgaW50ZXJsZWF2ZWQuIFRoZXJlIGlzCm5vIGdvb2QgcmVhc29uIHRvIHNw
bGl0IGl0IGludG8gdHdvIHJlZ2lvbnMuCgpKdXN0IHVzZSBhIHNpbmdsZSwgY29udGlndW91cyBy
ZWdpc3RlciByZWdpb24uCgpXaGlsZSBJIGFtIGhlcmUsIEkgbWFkZSB0aGUgJ2RtYS1jaGFubmVs
cycgcHJvcGVydHkgbWFuZGF0b3J5IGJlY2F1c2UKb3RoZXJ3aXNlIHRoZXJlIGlzIG5vIHdheSB0
byBkZXRlcm1pbmUgdGhlIG51bWJlciBvZiB0aGUgY2hhbm5lbHMuCgpQbGVhc2Ugbm90ZSB0aGUg
b3JpZ2luYWwgYmluZGluZyB3YXMgbWVyZ2VkIHJlY2VudGx5LiBTaW5jZSB0aGVyZQppcyBubyB1
c2VyIHlldCwgdGhpcyBjaGFuZ2UgaGFzIG5vIGFjdHVhbCBpbXBhY3QuCgpGaXhlczogYjlmYjU2
YjZiYThhICgiZHQtYmluZGluZ3M6IGRtYWVuZ2luZTogQWRkIFVuaVBoaWVyIGV4dGVybmFsIERN
QSBjb250cm9sbGVyIGJpbmRpbmdzIikKU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5
YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9kbWEvc29jaW9uZXh0LHVuaXBoaWVyLXhkbWFjLnlhbWwgIHwgNyArKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvc29jaW9uZXh0LHVuaXBoaWVyLXhk
bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3NvY2lvbmV4
dCx1bmlwaGllci14ZG1hYy55YW1sCmluZGV4IDg2Y2ZiNTk5MjU2ZS4uMzcxZjE4NzczMTk4IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3NvY2lvbmV4
dCx1bmlwaGllci14ZG1hYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kbWEvc29jaW9uZXh0LHVuaXBoaWVyLXhkbWFjLnlhbWwKQEAgLTIyLDkgKzIyLDcgQEAg
cHJvcGVydGllczoKICAgICBjb25zdDogc29jaW9uZXh0LHVuaXBoaWVyLXhkbWFjCiAKICAgcmVn
OgotICAgIGl0ZW1zOgotICAgICAgLSBkZXNjcmlwdGlvbjogWERNQUMgYmFzZSByZWdpc3RlciBy
ZWdpb24gKG9mZnNldCBhbmQgbGVuZ3RoKQotICAgICAgLSBkZXNjcmlwdGlvbjogWERNQUMgZXh0
ZW5zaW9uIHJlZ2lzdGVyIHJlZ2lvbiAob2Zmc2V0IGFuZCBsZW5ndGgpCisgICAgbWF4SXRlbXM6
IDEKIAogICBpbnRlcnJ1cHRzOgogICAgIG1heEl0ZW1zOiAxCkBAIC00OSwxMiArNDcsMTMgQEAg
cmVxdWlyZWQ6CiAgIC0gcmVnCiAgIC0gaW50ZXJydXB0cwogICAtICIjZG1hLWNlbGxzIgorICAt
IGRtYS1jaGFubmVscwogCiBleGFtcGxlczoKICAgLSB8CiAgICAgeGRtYWM6IGRtYS1jb250cm9s
bGVyQDVmYzEwMDAwIHsKICAgICAgICAgY29tcGF0aWJsZSA9ICJzb2Npb25leHQsdW5pcGhpZXIt
eGRtYWMiOwotICAgICAgICByZWcgPSA8MHg1ZmMxMDAwMCAweDEwMDA+LCA8MHg1ZmMyMDAwMCAw
eDgwMD47CisgICAgICAgIHJlZyA9IDwweDVmYzEwMDAwIDB4NTMwMD47CiAgICAgICAgIGludGVy
cnVwdHMgPSA8MCAxODggND47CiAgICAgICAgICNkbWEtY2VsbHMgPSA8Mj47CiAgICAgICAgIGRt
YS1jaGFubmVscyA9IDwxNj47Ci0tIAoyLjE3LjEKCg==
--00000000000069e9ff05a20fcfb1--
