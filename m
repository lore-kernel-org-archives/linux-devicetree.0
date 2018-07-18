Return-Path: <SRS0=W3G5=KC=ysoft.com=Michal.Vokac@kernel.org>
Subject: Re: [PATCH V2 2/2] Documentation: dt-bindings: add adi,adgs1408 doc
References: <20180717134416.5865-1-mircea.caprioru@analog.com>
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <69a80679-8caf-fae5-61a7-fe505f606985@ysoft.com>
Date: Wed, 18 Jul 2018 10:52:36 +0200
MIME-Version: 1.0
In-Reply-To: <20180717134416.5865-1-mircea.caprioru@analog.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mircea Caprioru <mircea.caprioru@analog.com>
Cc: peda@axentia.se, robh+dt@kernel.org, davem@davemloft.net, mchehab+samsung@kernel.org, akpm@linux-foundation.org, rdunlap@infradead.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 17.7.2018 15:44, Mircea Caprioru wrote:
> Adding dt-bindings documentation for adgs1408/1409 multiplexer. The
> bindings follow the standard SPI and mux bindings and do not require any
> additional custom properties.
> 
> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> ---

Hi Mircea,
some time ago I tripped over this [1] patch 44acf1058790 ("dt-bindings:
submitting-patches: add guidance on patch content and subject") from
Rob on the mailing list. Seems like the "rules" could be very well applied
to your patch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=44acf10587907ff77c28fd97906220b2d8eb4f05

Best regards,
Michal
