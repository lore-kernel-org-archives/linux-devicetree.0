From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCHv2 6/7] ARM: socfpga: Enable Arria10 OCRAM ECC on startup
Date: Tue, 5 Apr 2016 07:31:10 +0200
Message-ID: <20160405053110.GA17541@pd.tnic>
References: <1459450087-24792-1-git-send-email-tthayer@opensource.altera.com>
 <1459450087-24792-7-git-send-email-tthayer@opensource.altera.com>
 <57034C4D.9010204@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57034C4D.9010204@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 05, 2016 at 12:25:33AM -0500, Thor Thayer wrote:
> I realize that I'm not calling iounmap(ecc_block_base) and I'll fix that in
> the next revision with a goto.

I'm assuming nothing else changes. Because I've applied 1-4 already.

Yes, no?

If no, then please send only an updated version of this patch as a reply
to this thread here.

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
