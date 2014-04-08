From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 3/3] edac: altera: Add SDRAM EDAC support for
 CycloneV/ArriaV
Date: Tue, 8 Apr 2014 18:03:51 +0200
Message-ID: <20140408160351.GK30077@pd.tnic>
References: <1396907649-20212-1-git-send-email-tthayer@altera.com>
 <1396907649-20212-4-git-send-email-tthayer@altera.com>
 <20140408100851.GF30077@pd.tnic>
 <1396965459.23349.4.camel@dinh-ubuntu>
 <20140408152406.GI30077@pd.tnic>
 <20140408154017.GF11876@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140408154017.GF11876@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Thor Thayer <tthayer@altera.com>, "robherring2@gmail.com" <robherring2@gmail.com>, "dougthompson@xmission.com" <dougthompson@xmission.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "rob@landley.net" <rob@landley.net>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "dinguyen@altera.com" <dinguyen@altera.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 08, 2014 at 04:40:17PM +0100, Mark Rutland wrote:
> The patches should be in the same series, but for review purposes it's
> nicer if the bindings are separate patches from the code within that
> series.
>
> I usually look at the drivers implementing bindings and prefer to be
> Cc'd on the whole series, with both the binding and driver.

Right, but I got only the 3/3 patch on linux-edac which made me wonder.

So I'm guessing you or someone else would be picking the whole set once
I've acked the EDAC part?

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
