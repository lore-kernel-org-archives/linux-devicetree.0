From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] Add EDAC peripheral init functions & Ethernet EDAC.
Date: Mon, 18 Apr 2016 22:06:37 +0200
Message-ID: <20160418200637.GB2057@cz.tnic>
References: <1460499181-23080-1-git-send-email-tthayer@opensource.altera.com>
 <20160414143501.GA25212@rob-hp-laptop>
 <20160415064042.330406ab.m.chehab@samsung.com>
 <5711087A.8050501@opensource.altera.com>
 <20160415214618.GB4545@cz.tnic>
 <5714EEC4.4060807@opensource.altera.com>
 <20160418200227.GA2057@cz.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160418200227.GA2057@cz.tnic>
Sender: linux-doc-owner@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh@kernel.org>, dougthompson@xmission.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Apr 18, 2016 at 10:02:27PM +0200, Borislav Petkov wrote:
> >  the number of uncorrectable errors is useful from a system point of
> > view.

I forgot: so altr_edac_a10_ecc_irq() panics on uncorrectable errors. Do we want
to do that even for UEs coming from the network...?

Seems a bit overboard to me...

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply. Srsly.
