From: Bo Shen <voice.shen@atmel.com>
Subject: Re: [RFC PATCH 01/13] misc: atmel_ssc: add device tree DMA support
Date: Tue, 2 Jul 2013 17:11:03 +0800
Message-ID: <51D29927.80900@atmel.com>
References: <1372667978-4718-1-git-send-email-richard.genoud@gmail.com> <1372667978-4718-2-git-send-email-richard.genoud@gmail.com> <51D24299.9050209@atmel.com> <CACQ1gAgcc=j3kmcpjp8bbdHhxr_k=h8jJs6R_paJbPUMv74uGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACQ1gAgcc=j3kmcpjp8bbdHhxr_k=h8jJs6R_paJbPUMv74uGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Genoud <richard.genoud@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Richard,

On 7/2/2013 16:13, Richard Genoud wrote:
>> Please hold on of this, as to the ASoC dmaengine will deal with this. So, we
>> >not need do it manually.
>> >
>> >Now, I am working on it. And will send out the patch soon after testing OK.
> Ok, I stay tuned !

I think you can go on working with the two patches I send just now.
[1]: ASoC: atmel_ssc_dai: move set dma data to startup callback
https://patchwork.kernel.org/patch/2811241/

[2]: ASoC: atmel-pcm: use generic dmaengine framework
https://patchwork.kernel.org/patch/2811261/

I use your patches 4 ~ 8 do a quick testing, it works. Please note the 
name of asound.state under /etc in your rootfs should the same with 
atmel,model in patch 6.

> Thanks !
>
> Best regards,
> Richard

Best Regards,
Bo Shen
