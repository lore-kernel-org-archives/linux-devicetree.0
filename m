Return-Path: <SRS0=X3x8=H4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36525 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965118AbeEIWa4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 9 May 2018 18:30:56 -0400
Received: by mail-pf0-f195.google.com with SMTP id w129-v6so67296pfd.3
        for <devicetree@vger.kernel.org>; Wed, 09 May 2018 15:30:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/6] dt-bindings: arm: amlogic: add support for the Meson8m2 SoC
References: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
        <20180506092119.467-2-martin.blumenstingl@googlemail.com>
        <20180508162558.GA9444@rob-hp-laptop>
Date: Wed, 09 May 2018 15:30:51 -0700
In-Reply-To: <20180508162558.GA9444@rob-hp-laptop> (Rob Herring's message of
        "Tue, 8 May 2018 11:25:58 -0500")
Message-ID: <7h8t8szckk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, carlo@caione.org, mark.rutland@arm.com, balbes-150@yandex.ru
List-ID: <devicetree@vger.kernel.org>

Rob Herring <robh@kernel.org> writes:

> On Sun, May 06, 2018 at 11:21:14AM +0200, Martin Blumenstingl wrote:
>> The Meson8m2 SoC is an updated version of the Meson8 SoC. Some of the
>> peripherals are updated to be register-compatible with Meson8b.
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/amlogic.txt | 4 ++++
>>  1 file changed, 4 insertions(+)
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied with tag from Rob,

Kevin
