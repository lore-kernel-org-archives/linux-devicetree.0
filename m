From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCHv2 6/7] ARM: socfpga: Enable Arria10 OCRAM ECC on startup
Date: Tue, 5 Apr 2016 22:15:30 +0200
Message-ID: <20160405201530.GK17541@pd.tnic>
References: <1459450087-24792-1-git-send-email-tthayer@opensource.altera.com>
 <1459450087-24792-7-git-send-email-tthayer@opensource.altera.com>
 <57034C4D.9010204@opensource.altera.com>
 <20160405053110.GA17541@pd.tnic>
 <alpine.DEB.2.02.1604051333070.32718@linux-builds1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1604051333070.32718@linux-builds1>
Sender: linux-doc-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@opensource.altera.com>, Thor Thayer <tthayer@opensource.altera.com>
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 05, 2016 at 01:37:49PM -0500, Dinh Nguyen wrote:
> My only suggestion was to change the 3 helper functions(ecc_set_bits,
> ecc_clear_bits, and ecc_test_bits) should be static inline.

That doesn't take care of the iounmap error path Thor is talking about,
AFAICT.

So, I've pushed out what I have applied so far:

http://git.kernel.org/cgit/linux/kernel/git/bp/bp.git/log/?h=for-next

Thor, please send me what is outstanding ontop.

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
