Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB43C43331
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 07:04:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B2DF20719
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 07:04:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="QXXK4666"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgCZHEC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 03:04:02 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40614 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgCZHEC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 03:04:02 -0400
Received: by mail-wr1-f66.google.com with SMTP id u10so6372508wro.7
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 00:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OnfX0OE0ma/Av42U9uoiSTKulXAJE+HJ9d0B8OOmxos=;
        b=QXXK46669W6vE9wVHhEA66Ox9m5ddadnJ2mSRmkcSCFaPr98OUaojd6Y5FUjv4ZSs+
         GzhWBIx0gwve6woafwhvjawtw7n9AFML7j3z6JbtbtPBE8Xn6M+nrMN+u7IQviIgm99v
         ZeNkgwCkf/0ukl7C7JWAB2CMHSogz5wFn7Ugpva/56qL+KUD9HIKLxHNJKoT6McMhT0W
         euVVaCDann0vTlj7NN6j9HiADFzmrsAlCBPxCHHrBKQs/SJYyKmKGb5Xr/DLwLip+CR2
         gp/nUZFjNs3EZoBbmy4hBuF5em/QCjxSbjM3BgYHpW9+lTGJtKv1hZc4vS+77Q+c4ysy
         MFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OnfX0OE0ma/Av42U9uoiSTKulXAJE+HJ9d0B8OOmxos=;
        b=t4XLrIC5HCRMQ3R5ZIdLx7u1KeKFSgncwEy2N9ymT4biWwADK70Gzm6oOabC7LUgN5
         CULM1OiUWGMVFZtpz7scf7LhG8j+13CwIY286QO6bYNUliF7LJlQJMHj15wGBZjZg21K
         JNvNA4WupHrSHxZSaydojmRtWJS2jLWOKWffE3+GyObrVnjHJl+BI3FXFLpFCGbDeJX6
         eMWIPSjDjVxMRENYmkgiftVGwyGOSXBPCZD2fxSYlyuvhaHbobS8o1LrDZI7jlcEzkiM
         j6E6dZawYuE/BLjAlSsc9C7vHprG/mWMZ2ZOGbDmPwA6pXVh5BAFiNc3j/MVjJdMGlTw
         cs0A==
X-Gm-Message-State: ANhLgQ18ITRWYSbB24E/AYcM0oc8TUvs8wWoGNh9vgPPBIfOJLc8b80M
        e+pkL1bq3+zBvIQGIugf1kEUM7QkD4Rs1XgdBltNrQ==
X-Google-Smtp-Source: ADFU+vvmAe5q2S2uktbITom5JQ9VBVLvh1KAt20YhWxpacdHL4eK/daDkLZcSd9w2y56WpFTbk1b6CJ9SZ717v2JK/0=
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr7627562wrp.230.1585206239889;
 Thu, 26 Mar 2020 00:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200322110028.18279-1-alex@ghiti.fr> <20200322110028.18279-7-alex@ghiti.fr>
In-Reply-To: <20200322110028.18279-7-alex@ghiti.fr>
From:   Anup Patel <anup@brainfault.org>
Date:   Thu, 26 Mar 2020 12:33:48 +0530
Message-ID: <CAAhSdy317iJy4u2cXpN7pYzAZazSGKasm86JYBVz9MMn3uZA4g@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] dt-bindings: riscv: Remove "riscv,svXX" property
 from device-tree
To:     Alexandre Ghiti <alex@ghiti.fr>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Zong Li <zong.li@sifive.com>, Christoph Hellwig <hch@lst.de>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

+Device tree mailing list

On Sun, Mar 22, 2020 at 4:36 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> This property can not be used before virtual memory is set up
> and then the  distinction between sv39 and sv48 is done at runtime
> using SATP csr property: this property is now useless, so remove it.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 04819ad379c2..12baabbac213 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -39,19 +39,6 @@ properties:
>        Identifies that the hart uses the RISC-V instruction set
>        and identifies the type of the hart.
>
> -  mmu-type:
> -    allOf:
> -      - $ref: "/schemas/types.yaml#/definitions/string"
> -      - enum:
> -          - riscv,sv32
> -          - riscv,sv39
> -          - riscv,sv48
> -    description:
> -      Identifies the MMU address translation mode used on this
> -      hart.  These values originate from the RISC-V Privileged
> -      Specification document, available from
> -      https://riscv.org/specifications/
> -
>    riscv,isa:
>      allOf:
>        - $ref: "/schemas/types.yaml#/definitions/string"
> --
> 2.20.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
