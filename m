From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] Add EDAC peripheral init functions & Ethernet EDAC.
Date: Fri, 15 Apr 2016 23:46:18 +0200
Message-ID: <20160415214618.GB4545@cz.tnic>
References: <1460499181-23080-1-git-send-email-tthayer@opensource.altera.com>
 <20160414143501.GA25212@rob-hp-laptop>
 <20160415064042.330406ab.m.chehab@samsung.com>
 <5711087A.8050501@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5711087A.8050501@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh@kernel.org>, dougthompson@xmission.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Apr 15, 2016 at 10:27:54AM -0500, Thor Thayer wrote:
> I'll update this patch to only count errors.

... and also think about what that counting is going to bring. If it is
only going to be there to show how many network errors happened and we
can't do anything about it except stare at that number, then adding all
that code is probably waste of time an electrons...

I'm just sayin'.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply. Srsly.
