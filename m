From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCH] Add EDAC peripheral init functions & Ethernet EDAC.
Date: Mon, 18 Apr 2016 15:15:55 -0500
Message-ID: <5715407B.8090506@opensource.altera.com>
References: <1460499181-23080-1-git-send-email-tthayer@opensource.altera.com>
 <20160414143501.GA25212@rob-hp-laptop>
 <20160415064042.330406ab.m.chehab@samsung.com>
 <5711087A.8050501@opensource.altera.com> <20160415214618.GB4545@cz.tnic>
 <5714EEC4.4060807@opensource.altera.com> <20160418200227.GA2057@cz.tnic>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160418200227.GA2057@cz.tnic>
Sender: linux-doc-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh@kernel.org>, dougthompson@xmission.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org


On 04/18/2016 03:02 PM, Borislav Petkov wrote:
> On Mon, Apr 18, 2016 at 09:27:16AM -0500, Thor Thayer wrote:
>> We're still getting the single bit correction
>
> By that you mean, you get that by enabling ECC on the FIFO block?
>
Yes, you are correct. I'd still get the single bit correction by 
enabling ECC on the FIFO which is a win.

>> which makes the entire system more stable and the ability to see both
>> single bit errors corrected and the number of uncorrectable errors is
>> useful from a system point of view.
>
> If so, that makes sense, yes.
>
> Thanks.
>
