Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9C3C2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 11:39:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F42A20768
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586950740;
	bh=R43hO9Q3If9QrtnZ5K9TcR/a0ZvrCDhZjgGwgzT0xFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=ytiv9K2jeiJAItKf9jVF+VrTqI1cOtwAodzxn5LdRjgjDNgYPu6WNGxZ/vntjgAoR
	 XtNbvm8TIlgZhL+dk0jsB/vhWjx+FYhT2yMsSxjoRfQlBqYFi+fruU5RiPz0Mxkf4m
	 jWy+8NTp6vQEikRIs2uyXD3XkYbSK1d7P+RW/+bE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897274AbgDOLir (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 07:38:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:58644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2897264AbgDOLij (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 07:38:39 -0400
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B603216FD;
        Wed, 15 Apr 2020 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586950718;
        bh=R43hO9Q3If9QrtnZ5K9TcR/a0ZvrCDhZjgGwgzT0xFE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=E5odArf/RDc2lUAWXYieDSICfp9q8nBXEpH8oGXMbl511ftW6vzpHvHktcBE2iKiC
         CKixYDKgMb9QlA1aORiC5Eu+aRqxfTt+PKHC5/btAAOBgUVlxZbVPCpfvrqokmXOdZ
         CbKDC6mtkLWOW1EL3z3pC7fdPh/RNVXyWZm30v4k=
Received: by mail-lf1-f46.google.com with SMTP id r17so2379370lff.2;
        Wed, 15 Apr 2020 04:38:38 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ9WSJnSO6AYiy7Kf5ZdRr9MshNvCwTwoSrOMpD4NZ/hdI+9w6u
        soXlwgfAXMZs8mj1E5+u2Lxe0ZW+kPRqhjbIrKM=
X-Google-Smtp-Source: APiQypI+VI3dpF2YbI7yVr/aHwnSBVAysHwaY+SScdUs4Jyyh+GbDgIy/bRBbEhJiawYLq4RWaZKVJOwvX1RTOgkOWY=
X-Received: by 2002:a19:ae16:: with SMTP id f22mr2914229lfc.2.1586950716265;
 Wed, 15 Apr 2020 04:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586939718.git.hns@goldelico.com> <004611c9660943759b635a87484932869927cf74.1586939718.git.hns@goldelico.com>
In-Reply-To: <004611c9660943759b635a87484932869927cf74.1586939718.git.hns@goldelico.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 15 Apr 2020 13:38:25 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdEkWniffmGZmf=S6E5UxWTdVGXnycqTFftXwo_45rz3w@mail.gmail.com>
Message-ID: <CAJKOXPdEkWniffmGZmf=S6E5UxWTdVGXnycqTFftXwo_45rz3w@mail.gmail.com>
Subject: Re: [PATCH v6 07/12] ARM: DTS: omap5: add sgx gpu child node
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, openpvrsgx-devgroup@letux.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> and add interrupt.
>
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # Pyra-Handheld.

Don't add your own Tested-by tags. These are implied by authorship,
otherwise all patches people make should have such tag.

Best regards,
Krzysztof
