From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v6 0/8] mfd: Add OF device table to I2C drivers that are
 missing it
Date: Fri, 5 May 2017 12:40:05 +0200
Message-ID: <CABxcv=nXhyuRwwhzv0H8mK98wUmAPDNPErkV92o9nRFZV2dEsw@mail.gmail.com>
References: <20170504052107.18995-1-javier@dowhile0.org> <20170504080931.GA1487@katana>
 <20170504115016.ayrgbqdshdvnop6k@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170504115016.ayrgbqdshdvnop6k@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Linux Kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, May 4, 2017 at 1:50 PM, Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 04 May 2017, Wolfram Sang wrote:
>> thanks for the series.
>>
>> > Most patches can be applied independently, with the exception of patches
>> > 2 to 4 that should be applied in the same tree to keep bisect-ability. I
>> > suggest these to go through the MFD subsystem tree.
>>
>> From my POV, patches 2-5 should be applied to the same tree. Since all

Yes, I didn't mention 5 because is just a documentation change. But it
would be better if is merged together with 2-4 indeed.

>> I2C related patches have my tag, I assume they will be picked up by MFD.
>> Lee, let me know if you prefer differently.
>
> I can pick them up, no problem.  Can the ARM patches be taking
> independently?  I'm guessing they can since they are separate from one
> another.
>

That's corect. The only platform changes that can't be picked
independently from MFD are the ones in patch 2, but tha's why I added
in the same patch. The OMAP folks (Tony and Aaro) already acked so you
can pick it.

Best regards,
Javier
