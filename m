Return-Path: <SRS0=bipS=ZI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFDAC432C3
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 10:28:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2CE320715
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 10:28:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gf8+xE3u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfKPK2o (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 16 Nov 2019 05:28:44 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46099 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfKPK2n (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 16 Nov 2019 05:28:43 -0500
Received: by mail-oi1-f193.google.com with SMTP id n14so10929657oie.13
        for <devicetree@vger.kernel.org>; Sat, 16 Nov 2019 02:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sZhD/EUwU2LYmqXZzHYtr3lzbEoemhuYST7IWlhE6j0=;
        b=gf8+xE3ulehOsc5z+4rMPuOai0+uZBLR7+efZJ+o42vDgffLsx17nKEGw3IsWe9QSQ
         sPNSML0APKutXIbdn+rr6CRx+Sj9QaEpH676Kxt15sQ5jYJCDEq7p1YsIlB9kjFbHP4Y
         ZC+o0he5dzxFd7mjAUt6LumMP/0GNX1PVZ+mULwLWRDX7qZMRjG8ytfZcHJ0084Epup6
         tajx3wMGOODe1MWrC28i64e76ITL5lFIyCUh8EsZxCysG+fBwpV1jP7QpW91/dbB8ih/
         ER74co302G/Pu5nHfk0mcHhXB2gWjfFPtoiJvv1xrmvYTzlFg3IUVjx+pp2dCAHbWzFN
         P9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sZhD/EUwU2LYmqXZzHYtr3lzbEoemhuYST7IWlhE6j0=;
        b=UxTmQk521Q/amUhsJFPpq0AJ+MW9wsUaicnmK4gqvTDEcMzKKiwj+pZTytjt7UeSwx
         kpLhtd39KiFPLlUeWPx0szePnYNHzOYHaIHDG8Jt258G3gA4hAHHVEVHp5R5JjpfFzx3
         TIENnd9R1oQDiJX5iDbX9REmNCGAmh5uqgcbBiL4ltNW1E1OjjTlnNqER+2qCD18rVks
         sawaQ2ANICznzuf3E63lnJTzRV7vu23wtFW84Mz0HxQcwQ8o/Liur5SWwm3HovOUJnrJ
         GMmztcZ9u/O+Q0LSTXzMbDkO6nZfVbJX3DcucgBaqInxJJTDUQgSFzMG0FV1dnSXVtOq
         k51w==
X-Gm-Message-State: APjAAAXUVs3Zn9j/Zr537VO/o2rHNlnwgeuF2MSEU1QXmMNWNEFqdb7I
        6KcXvi/9kPskvnDgvRQ3TRHr/BI8gG7D8Bpo1jQ=
X-Google-Smtp-Source: APXvYqzqpR3r9z/YwmrTeU5WMMZLPoNaek3O+69iFR3LbGOpV+usYWFgo/EYlXBZZmBYLoxRvxzaPrHZfbRUB6hYgY8=
X-Received: by 2002:aca:504d:: with SMTP id e74mr12138443oib.140.1573900122769;
 Sat, 16 Nov 2019 02:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20191115165026.19376-1-mohammad.rasim96@gmail.com>
 <20191115165026.19376-3-mohammad.rasim96@gmail.com> <6fa93c06-ecab-c8da-32c4-db40533c09ec@suse.de>
In-Reply-To: <6fa93c06-ecab-c8da-32c4-db40533c09ec@suse.de>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 16 Nov 2019 11:28:31 +0100
Message-ID: <CAFBinCBFopdV8yRNN+jBc1DmB8mx85T0SKaFkxe_So_fsvcejA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Add support for Videostrong KII Pro tv box
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Kevin Hilman <khilman@baylibre.com>,
        devicetree@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Mohammad,

On Sat, Nov 16, 2019 at 10:53 AM Andreas F=C3=A4rber <afaerber@suse.de> wro=
te:
[...]
> > +
> > +/dts-v1/;
> > +
> > +#include "meson-gxbb-p201.dts"
>
> This is rather unusual, normally you would include the SoC's .dtsi, not
> another board.
you may even get another benefit from this:
we don't know the Ethernet PHY setup on the P201 board (because nobody
has an actual P201 board) so we don't use interrupts etc.

however, since you do have a access to your KII Pro you can do better
than P201 and define the Ethernet bits similar to Odroid-C2 for
example: [0]
if you board doesn't use a Realtek RTL8211F PHY then please also
update the comment in the Ethmac node
testing the PHY interrupt (which means less polling -> your CPU has
more time to do other things) is easy:
* cat /proc/interrupts
* unplug and re-plug the Ethernet cable
* cat /proc/interrupts again and check the Ethernet PHY interrupt
(should be +2 compared to the first invocation)


Martin


[0] https://github.com/torvalds/linux/blob/f9717178b9be9477877d4c3776c61ff5=
6d854ddf/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts#L122
