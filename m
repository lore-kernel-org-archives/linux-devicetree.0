From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCHv2 0/4] Add Altera peripheral memories to EDAC framework
Date: Mon, 27 Oct 2014 21:43:07 +0100
Message-ID: <20141027204307.GB4741@pd.tnic>
References: <1413578029-13205-1-git-send-email-tthayer@opensource.altera.com>
 <544E93F0.3030409@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <544E93F0.3030409@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@altera.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@altera.com
List-Id: devicetree@vger.kernel.org

On Mon, Oct 27, 2014 at 01:50:24PM -0500, Thor Thayer wrote:
> Do you have any comments about this driver?

Just a question: why do you have three .c files for something which
does only error injection and nothing else AFAICT? Why isn't this part
of altera_edac.c?

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
