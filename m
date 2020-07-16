Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0320CC433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:20:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD5C4206C1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:20:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="whW3JyN0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgGPIUR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 04:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgGPIUP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 04:20:15 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F6AC08C5C0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:20:14 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k6so6090829wrn.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aNaxqofYXFSzeT53qhM6P9rOnpb8qLzF3w0KlM+9kgo=;
        b=whW3JyN05g/TSRVXKkS7QuKcA6enM8if4nsNId5VDVfOd7Mip9EisaG655KUh4t0OE
         uWJW+hcQMfSUw1brOs5wcOAI71r+6VNknZeP2hyCFpbXt9OB85biIdMyeiSqTRqTW8W3
         uhwXVLGdEnzPGKvtDCWdQKrbDWrjZ0aFKM1XmsyGswY/4xlN46G5hXdhKWEqwZjH5hKG
         ZCX8YcsIm35wVG5vhZOKtKLTiATFaiQSOCupWNcCbD+5LNsoOvI8vyVrZKkGCtJNZd0v
         gSBCf+cfJd89Bpj44M2jB/8sEB4DbFrX7qeaIhiLV/HqVWTrIdSyo3VMUsMiqTB33FB1
         MYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aNaxqofYXFSzeT53qhM6P9rOnpb8qLzF3w0KlM+9kgo=;
        b=oSS4DL7l//ZPVgtgvzL6c8bmog7qpUh0IZj8c80RUiq2Ln5ZFP7FR/NhylsLA40Emg
         gqS1woIwcTROQxAK3GTcRaED68Q5zD8DcC7LiuOT/0bhLXPHvSHkiqDAFZobrOQHLz6I
         WoqBcmyUEbb3DcZqY6PsucNRVySPFiMjLgxo/ZVM/qlwZXYLXo+xumeYBjoCpgIj53Vu
         sQZmsPUqVQPqSEyL2qRiDMg3pt3uHsar0bSWiL73KUnX07pn9r1tzehQRm95kjIeRiSS
         FYjO296E2Xj1kXgDlRSVlyUe59I6tg3otjiurFD+7nLBzEc4UvVpAXkS0kHU442Mpanv
         WrlQ==
X-Gm-Message-State: AOAM5317PpBCx9PtAd4epFQEhisKlZV6exs3jzOVqa2k/a1lhBAdph/m
        B2e3Y2UCw6ml83TXIgqNSr9FSg==
X-Google-Smtp-Source: ABdhPJzh6Lsj8eHHFSmmWY21Y++ugUHdwa7sQutHaCmspTas0tYvCFERHCyqamcs/eqz8DrJj37yZw==
X-Received: by 2002:a5d:4002:: with SMTP id n2mr4090900wrp.255.1594887612997;
        Thu, 16 Jul 2020 01:20:12 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a12sm7885164wrv.41.2020.07.16.01.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 01:20:12 -0700 (PDT)
Subject: Re: [PATCHv1 0/3] Enable RTC on Odroid N2
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <20200715160209.652-1-linux.amoon@gmail.com>
 <455f5dcc-3be3-45cd-4947-50f261a502a4@baylibre.com>
 <CANAwSgRXLUqqSqnguV2pgPdumMi8i6T9rh6hNQ0Y03mv_j7V-g@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwU0EVid/pAEQAND7AFhr
 5faf/EhDP9FSgYd/zgmb7JOpFPje3uw7jz9wFb28Cf0Y3CcncdElYoBNbRlesKvjQRL8mozV
 9RN+IUMHdUx1akR/A4BPXNdL7StfzKWOCxZHVS+rIQ/fE3Qz/jRmT6t2ZkpplLxVBpdu95qJ
 YwSZjuwFXdC+A7MHtQXYi3UfCgKiflj4+/ITcKC6EF32KrmIRqamQwiRsDcUUKlAUjkCLcHL
 CQvNsDdm2cxdHxC32AVm3Je8VCsH7/qEPMQ+cEZk47HOR3+Ihfn1LEG5LfwsyWE8/JxsU2a1
 q44LQM2lcK/0AKAL20XDd7ERH/FCBKkNVzi+svYJpyvCZCnWT0TRb72mT+XxLWNwfHTeGALE
 +1As4jIS72IglvbtONxc2OIid3tR5rX3k2V0iud0P7Hnz/JTdfvSpVj55ZurOl2XAXUpGbq5
 XRk5CESFuLQV8oqCxgWAEgFyEapI4GwJsvfl/2Er8kLoucYO1Id4mz6N33+omPhaoXfHyLSy
 dxD+CzNJqN2GdavGtobdvv/2V0wukqj86iKF8toLG2/Fia3DxMaGUxqI7GMOuiGZjXPt/et/
 qeOySghdQ7Sdpu6fWc8CJXV2mOV6DrSzc6ZVB4SmvdoruBHWWOR6YnMz01ShFE49pPucyU1h
 Av4jC62El3pdCrDOnWNFMYbbon3vABEBAAHCwn4EGAECAAkFAlYnf6QCGwICKQkQFpq3saTP
 +K7BXSAEGQECAAYFAlYnf6QACgkQd9zb2sjISdGToxAAkOjSfGxp0ulgHboUAtmxaU3viucV
 e2Hl1BVDtKSKmbIVZmEUvx9D06IijFaEzqtKD34LXD6fjl4HIyDZvwfeaZCbJbO10j3k7FJE
 QrBtpdVqkJxme/nYlGOVzcOiKIepNkwvnHVnuVDVPcXyj2wqtsU7VZDDX41z3X4xTQwY3SO1
 9nRO+f+i4RmtJcITgregMa2PcB0LvrjJlWroI+KAKCzoTHzSTpCXMJ1U/dEqyc87bFBdc+DI
 k8mWkPxsccdbs4t+hH0NoE3Kal9xtAl56RCtO/KgBLAQ5M8oToJVatxAjO1SnRYVN1EaAwrR
 xkHdd97qw6nbg9BMcAoa2NMc0/9MeiaQfbgW6b0reIz/haHhXZ6oYSCl15Knkr4t1o3I2Bqr
 Mw623gdiTzotgtId8VfLB2Vsatj35OqIn5lVbi2ua6I0gkI6S7xJhqeyrfhDNgzTHdQVHB9/
 7jnM0ERXNy1Ket6aDWZWCvM59dTyu37g3VvYzGis8XzrX1oLBU/tTXqo1IFqqIAmvh7lI0Se
 gCrXz7UanxCwUbQBFjzGn6pooEHJYRLuVGLdBuoApl/I4dLqCZij2AGa4CFzrn9W0cwm3HCO
 lR43gFyz0dSkMwNUd195FrvfAz7Bjmmi19DnORKnQmlvGe/9xEEfr5zjey1N9+mt3//geDP6
 clwKBkq0JggA+RTEAELzkgPYKJ3NutoStUAKZGiLOFMpHY6KpItbbHjF2ZKIU1whaRYkHpB2
 uLQXOzZ0d7x60PUdhqG3VmFnzXSztA4vsnDKk7x2xw0pMSTKhMafpxaPQJf494/jGnwBHyi3
 h3QGG1RjfhQ/OMTX/HKtAUB2ct3Q8/jBfF0hS5GzT6dYtj0Ci7+8LUsB2VoayhNXMnaBfh+Q
 pAhaFfRZWTjUFIV4MpDdFDame7PB50s73gF/pfQbjw5Wxtes/0FnqydfId95s+eej+17ldGp
 lMv1ok7K0H/WJSdr7UwDAHEYU++p4RRTJP6DHWXcByVlpNQ4SSAiivmWiwOt490+Ac7ATQRN
 WQbPAQgAvIoM384ZRFocFXPCOBir5m2J+96R2tI2XxMgMfyDXGJwFilBNs+fpttJlt2995A8
 0JwPj8SFdm6FBcxygmxBBCc7i/BVQuY8aC0Z/w9Vzt3Eo561r6pSHr5JGHe8hwBQUcNPd/9l
 2ynP57YTSE9XaGJK8gIuTXWo7pzIkTXfN40Wh5jeCCspj4jNsWiYhljjIbrEj300g8RUT2U0
 FcEoiV7AjJWWQ5pi8lZJX6nmB0lc69Jw03V6mblgeZ/1oTZmOepkagwy2zLDXxihf0GowUif
 GphBDeP8elWBNK+ajl5rmpAMNRoKxpN/xR4NzBg62AjyIvigdywa1RehSTfccQARAQABwsBf
 BBgBAgAJBQJNWQbPAhsMAAoJEBaat7Gkz/iuteIH+wZuRDqK0ysAh+czshtG6JJlLW6eXJJR
 Vi7dIPpgFic2LcbkSlvB8E25Pcfz/+tW+04Urg4PxxFiTFdFCZO+prfd4Mge7/OvUcwoSub7
 ZIPo8726ZF5/xXzajahoIu9/hZ4iywWPAHRvprXaim5E/vKjcTeBMJIqZtS4u/UK3EpAX59R
 XVxVpM8zJPbk535ELUr6I5HQXnihQm8l6rt9TNuf8p2WEDxc8bPAZHLjNyw9a/CdeB97m2Tr
 zR8QplXA5kogS4kLe/7/JmlDMO8Zgm9vKLHSUeesLOrjdZ59EcjldNNBszRZQgEhwaarfz46
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <91fbbe36-d839-d864-7666-5483cc643a5e@baylibre.com>
Date:   Thu, 16 Jul 2020 10:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANAwSgRXLUqqSqnguV2pgPdumMi8i6T9rh6hNQ0Y03mv_j7V-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 16/07/2020 10:14, Anand Moon wrote:
> Hi Neil,
> 
> Thanks for your review comments.
> 
> On Thu, 16 Jul 2020 at 12:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi Anand,
>>
>> Only the vrtc is able to wakeup the device from suspend,
>> the external RTC is not capable.
>>
>> Neil
> 
> Now I have two RTC driver registered
> 
> $ dmesg | grep rtc
> [    4.737315] rtc-pcf8563 0-0051: registered as rtc0
> [    4.738763] rtc-pcf8563 0-0051: setting system clock to
> 2020-07-16T08:00:46 UTC (1594886446)
> [    4.790206] meson-vrtc ff8000a8.rtc: registered as rtc1
> 
> And there are two nodes
> # ls /dev/rtc*
> /dev/rtc  /dev/rtc0  /dev/rtc1
> 
> So it seames an issue that /dev/rtc0 is not able to handle wakeup events.
> How can we resolve this issue?
> 
> # time rtcwake -s 30 -m mem
> rtcwake: /dev/rtc0 not enabled for wakeup events

rtcwake -d /dev/rtc1 -s 30 -m mem

As Christian reported off-list, it may be necessary to keep the vrtc as rtc0,
so you should add aliases in the odroid-n2 DT to have vrtc as rtc0 and the on-board
rtc as rtc1, but it may break the hwclock tools, so the reverse may be better
but you'll need to specify rtc1 to rtcwake.

Neil

> 
> real    0m0.002s
> user    0m0.001s
> sys     0m0.002s
> 
> -Anand
> 

