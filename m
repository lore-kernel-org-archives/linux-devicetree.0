From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCHv2 2/4] edac, altera: Refactor EDAC for Altera CycloneV
 SoC.
Date: Thu, 4 Jun 2015 17:27:28 -0500
Message-ID: <5570D0D0.9030803@opensource.altera.com>
References: <1433428128-7292-1-git-send-email-tthayer@opensource.altera.com>
 <1433428128-7292-3-git-send-email-tthayer@opensource.altera.com>
 <55706E25.8050105@opensource.altera.com>
 <5570C479.7010902@opensource.altera.com> <20150604220609.GK3795@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150604220609.GK3795@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>, Thor Thayer <tthayer@opensource.altera.com>
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On 06/04/2015 05:06 PM, Borislav Petkov wrote:
> On Thu, Jun 04, 2015 at 04:34:49PM -0500, Thor Thayer wrote:
>> OK. I'll refactor and resend. I was using Altera's internal for-next branch.
> 
> Use this one:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git#for-next
> 

This is my mistake. I applied Alan Tull's patch for suspend-to-ram which
also touches drivers/edac/altera_edac.c.

https://git.kernel.org/cgit/linux/kernel/git/dinguyen/linux.git/commit/?h=socfpga_for_next_arria10&id=d44a92eb044f4cc1abf34a790d647e9fa356d7b0

I think I will have to ask Alan to split up his patch and send the part
that touches altera_edac.c to linux-edac.

Sorry about the confusion.

Dinh
