Return-Path: <SRS0=TSDT=YW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0D2CA9EAE
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 18:52:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 601F520874
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 18:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572375168;
	bh=e0TRhw+HkYRf/H52KDSnwAETrusuWKPwqptazJA4IiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IOj3QGnsQsZva4ALQmMsqqHk4eI4tPYC0zqOEeZVyyIpzT4JyGlk7kzHZABWj+PYZ
	 QAVtye1i8qOrPrXgzHA1IETGRZWei38FpSBvUAasoT8xbpvrbA6fkG49/h5vR30XX0
	 /zS6RiEBcGLa4mVpeXGcBeCMwnpI+6PK0JkRaRTw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732072AbfJ2Swr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 29 Oct 2019 14:52:47 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36195 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbfJ2Swr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Oct 2019 14:52:47 -0400
Received: by mail-ot1-f67.google.com with SMTP id c7so10721876otm.3;
        Tue, 29 Oct 2019 11:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=CQrNe1j7QkcNJRw1v8RbGpAi+Oc2Ejh/QH9GQXsq6oE=;
        b=nwk3nJnRVsH3hrA8f5X73Niaob6y1A4euCXVXg1vw0rOVO/9MiWfl8L5niIu1kgAAz
         f933sIpPnnC6DJkWQY26/yBY017OXoZL1Gzxojm5ku0+d66KAME6A58888KJWWvJTqZn
         A3uZzKBAwy6/vC3K4x9OhrOtNz0Eq7B8jX1VoHFBAIlkWcAG/BE9eN9KO/btPjZn53ob
         kk7ob0P7DsnGFKIqkyu8aXRoFrOjLtTusNI1Iekx9bdAOW50A5OQ6828iCsjc/ObO/u+
         IPUlGKfZsopoe/rpx+uUbS01qhmFUgOu34Tj5gICPlkQX4OA2I759ubNuh7tH4KFK1of
         WDJQ==
X-Gm-Message-State: APjAAAXI5rPr+dg/l0EVgVB4oO/TzRC9IzIQQyrx5iOlGVFZ+q3yX3kd
        ndamkSzO9+q2y7bqQpe2lw==
X-Google-Smtp-Source: APXvYqw2kFzbLbVafeXhlE4NavVPQIDmG2KwYF/yp23GAL7D1cuRf7KkyV/9gOqHgMmgdku+p8YIsQ==
X-Received: by 2002:a9d:870:: with SMTP id 103mr19095433oty.67.1572375166556;
        Tue, 29 Oct 2019 11:52:46 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x9sm866628otg.45.2019.10.29.11.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 11:52:46 -0700 (PDT)
Date:   Tue, 29 Oct 2019 13:52:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Richard Leitner <richard.leitner@skidata.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Carsten Stelling <carsten.stelling@goerlitz.com>
Subject: Re: [PATCH 2/3] usb: usb251xb: Document chip variant usb2422
Message-ID: <20191029185245.GA19185@bogus>
References: <20191023105250.16537-1-u.kleine-koenig@pengutronix.de>
 <20191023105250.16537-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191023105250.16537-2-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 23 Oct 2019 12:52:49 +0200, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= wrote:
> The next patch introduces support for the USB2422. Add it to the list of
> devices supported by the binding.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
