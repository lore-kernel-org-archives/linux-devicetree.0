From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCHv2 6/7] ARM: socfpga: Enable Arria10 OCRAM ECC on startup
Date: Wed, 6 Apr 2016 19:36:49 -0500
Message-ID: <5705ABA1.4000308@opensource.altera.com>
References: <1459450087-24792-1-git-send-email-tthayer@opensource.altera.com>
 <1459450087-24792-7-git-send-email-tthayer@opensource.altera.com>
 <57034C4D.9010204@opensource.altera.com> <20160405053110.GA17541@pd.tnic>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160405053110.GA17541@pd.tnic>
Sender: linux-doc-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

On 04/05/2016 12:31 AM, Borislav Petkov wrote:
> On Tue, Apr 05, 2016 at 12:25:33AM -0500, Thor Thayer wrote:
>> I realize that I'm not calling iounmap(ecc_block_base) and I'll fix that in
>> the next revision with a goto.
>
> I'm assuming nothing else changes. Because I've applied 1-4 already.
>
> Yes, no?
>
> If no, then please send only an updated version of this patch as a reply
> to this thread here.
>
> Thanks.
>
Yes, nothing else changes. The rest was OK. Thanks!
