From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCHv8 1/4] EDAC, altera: Add Altera L2 Cache and OCRAM EDAC
 Support
Date: Fri, 22 Jan 2016 19:08:30 +0100
Message-ID: <20160122180830.GH9806@pd.tnic>
References: <1453397668-32094-1-git-send-email-tthayer@opensource.altera.com>
 <56A1C5DE.1080501@mentor.com>
 <56A24C34.3000303@opensource.altera.com>
 <56A25F59.5070306@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56A25F59.5070306@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, tthayer@opensource.altera.com
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Jan 22, 2016 at 06:56:57PM +0200, Vladimir Zapolskiy wrote:
> it sounds like the author of the original change is Dinh, but if you agreed
> about authorship transfer, then "From: Thor Thayer" statement should be
> correct, but in any case your SoB should follow Dinh's SoB, if you decide to
> keep the latter one.
> 
> This consideration may apply to the other changes in the changeset as well.

So the patch author should be in the From:

If Thor has changed the original patch considerably, then you Thor and
Dinh could decide amongst each other who should be the author.

If Thor becomes the author and lands in From:, then the commit message
could state something like "based on original work from Dinh" or
"Originally-from: Dinh" and so on. "git log" has some examples.

The SOB chain shows who handled the patch on its way upstream. So in
this case, it should be:

SOB: Dinh (if From: is Dinh - otherwise Originally-by:)
SOB: Thor
SOB: Boris

if I'm going to pick it up and send it to Linus.

Ok?

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
