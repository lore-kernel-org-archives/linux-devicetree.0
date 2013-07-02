From: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [RFC PATCH 01/13] misc: atmel_ssc: add device tree DMA support
Date: Tue, 2 Jul 2013 10:13:08 +0200
Message-ID: <CACQ1gAgcc=j3kmcpjp8bbdHhxr_k=h8jJs6R_paJbPUMv74uGg@mail.gmail.com>
References: <1372667978-4718-1-git-send-email-richard.genoud@gmail.com>
 <1372667978-4718-2-git-send-email-richard.genoud@gmail.com> <51D24299.9050209@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51D24299.9050209@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bo Shen <voice.shen@atmel.com>
Cc: devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: devicetree@vger.kernel.org

2013/7/2 Bo Shen <voice.shen@atmel.com>:
> Hi Richard,
>
>
> On 7/1/2013 16:39, Richard Genoud wrote:
>>
>> The ssc device has to fill the at_dma_slave structure with the
>> device tree informations.
>> Doing a of_dma_request_slave_channel()+dma_release_channel() for that
>> seems wrong (or at least not very clean).
>
>
> Please hold on of this, as to the ASoC dmaengine will deal with this. So, we
> not need do it manually.
>
> Now, I am working on it. And will send out the patch soon after testing OK.
Ok, I stay tuned !

Thanks !

Best regards,
Richard
