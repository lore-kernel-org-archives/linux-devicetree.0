Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542DBC5DF60
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 15:44:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BBDB217F5
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572968671;
	bh=aum1YJSu+9PFRnIpqDOrB5ANLIlZ0vhV+It6iVj1aKg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=LEVOYQDCEoTx27qg3NmcRE7oJ9sRfZp18f/2cwMO5lmH3GVsQM/i63Am2g0mxGuUL
	 z2++OqOBSBk2sIvTnOrVwgr7V5rqbZ5SlMnjyw2lxeriUsDZGwmdCbL5haWhZADMD8
	 tsgyNVYClpx6QyoxB2WbeeQmtmBbr1H6MUTc22GA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389908AbfKEPoa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 10:44:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:48356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389571AbfKEPoa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 Nov 2019 10:44:30 -0500
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA83021D7C
        for <devicetree@vger.kernel.org>; Tue,  5 Nov 2019 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572968670;
        bh=aum1YJSu+9PFRnIpqDOrB5ANLIlZ0vhV+It6iVj1aKg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T5R4IXUPXZ8JzFQ1v3//2AfSDVQdRVQhQjYADNiaagM2fMA5QJLwNjCy/0OuYO7Q3
         YFIibxhakVS7paWEhMpi7330Q98iiqUwzM5AwMly876nUdUfz1kVhuBE0eoHcKEEMU
         uQl0zOg+NPdGMDQgJXNR+vfNYGnL13Nr6Q88VQnk=
Received: by mail-qv1-f43.google.com with SMTP id w11so170990qvu.13
        for <devicetree@vger.kernel.org>; Tue, 05 Nov 2019 07:44:29 -0800 (PST)
X-Gm-Message-State: APjAAAXnWbZfYzpmzsjgWHvKKzyK0T2c1WvZ93iKgR3NIJ72x182DxMV
        93fP6b01ZoKn+kjLe6tUs+/fPSZy5y1yyj9EGQ==
X-Google-Smtp-Source: APXvYqywnfJgieS/x9mcd6p6x/Ua9dIsPOFDhGy86j+MgH0EE0JhwXgHoFf9LmftkfHRGVlsfYdW8ulq/FJYJHHt/BM=
X-Received: by 2002:ad4:42b4:: with SMTP id e20mr20065711qvr.85.1572968668890;
 Tue, 05 Nov 2019 07:44:28 -0800 (PST)
MIME-Version: 1.0
References: <20191105105615.21391-1-maxime@cerno.tech>
In-Reply-To: <20191105105615.21391-1-maxime@cerno.tech>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 5 Nov 2019 09:44:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLkQ5Quz1RHe77r0-TsMtoveu6cWUVdosfoXmyWzo0vaw@mail.gmail.com>
Message-ID: <CAL_JsqLkQ5Quz1RHe77r0-TsMtoveu6cWUVdosfoXmyWzo0vaw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: sound: adau7118: Fix example warning
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Lars-Peter Clausen <lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 5, 2019 at 5:06 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The ADAU7118 has an example where the codec has an i2c address of 14, and
> the unit address set to 14 as well.
>
> However, while the address is expressed in decimal, the unit-address is
> supposed to be in hexadecimal, which ends up with two different addresses
> that trigger a DTC warning. Fix this by setting the address to 0x14.
>
> Cc: Nuno S=C3=A1 <nuno.sa@analog.com>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Fixes: 969d49b2cdc8 ("dt-bindings: asoc: Add ADAU7118 documentation")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
>
> Changes from v1:
>   - Fix the address instead of the unit-address.
> ---
>  Documentation/devicetree/bindings/sound/adi,adau7118.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
